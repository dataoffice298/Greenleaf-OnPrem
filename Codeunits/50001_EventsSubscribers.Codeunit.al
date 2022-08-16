codeunit 50001 MyCodeunit
{
    //Sales QC Events Start>>

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inspection Jnl. Post Line B2B", 'OnBeforeInsertQualityLedgerEntry', '', false, false)]
    procedure OnBeforeInsertQualityLedgerEntry(var QualityLedgerEntry: Record "Quality Ledger Entry B2B"; InspectReceipt: Record "Inspection Receipt Header B2B")
    begin
        QualityLedgerEntry."Sales Line No" := InspectReceipt."Sales. Line No";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Post-Inspection Data Sheet B2B", 'OnBeforeInsertInspectionReportHeader', '', false, false)]
    procedure OnBeforeInsertInspectionReportHeader(var InspectReportHeader: Record "Inspection Receipt Header B2B"; InspectHeader: Record "Posted Ins DatasheetHeader B2B")
    begin
        InspectReportHeader."Sales. Line No" := InspectHeader."Sales. Line No";
        if InspectHeader."Document Type" = InspectHeader."Document Type"::"Sales Order" then
            InspectReportHeader."Document Type" := InspectReportHeader."Document Type"::"Sales Order";
        if InspectHeader."Document Type" = InspectHeader."Document Type"::"Sample QC" then
            InspectReportHeader."Document Type" := InspectReportHeader."Document Type"::"Sample QC";
        InspectReportHeader."Sample ID" := InspectHeader."Sample ID";
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterSalesShptLineInsert', '', false, false)]
    local procedure QualityCheckInspect(var SalesShipmentLine: Record "Sales Shipment Line"; SalesLine: Record "Sales Line"; ItemShptLedEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean; SalesInvoiceHeader: Record "Sales Invoice Header"; var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary; var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary)
    begin
        if SalesLine."Dispatch Qc" then begin
            SalesLine.CalcFields("Quantity Accepted");
            if SalesLine."Quantity Accepted" < ABS(SalesLine."Qty. to Ship") + SalesLine."Quantity Shipped" then
                Error(Text33000250Err, SalesLine."Document No.", SalesLine."Line No.");
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterItemApplnEntryInsert', '', false, false)]
    local procedure OnAfterItemApplnEntryInsert(var ItemApplicationEntry: Record "Item Application Entry"; GlobalItemLedgerEntry: Record "Item Ledger Entry"; OldItemLedgerEntry: Record "Item Ledger Entry")
    var
        QILE: Record "Quality Item Ledger Entry B2B";
        QErr: Label 'Quality item ledger entry exists for the applied entry No. %1';
    begin
        //if QILE.get(OldItemLedgerEntry."Entry No.") THEN 
        if QILE.get(OldItemLedgerEntry."Entry No.") AND (OldItemLedgerEntry."Document No." <> QILE."Document No.") then //PKON22J15
            Error(QErr, OldItemLedgerEntry."Entry No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inspection Jnl. Check Line B2B", 'OnBeforeApplyInsDataSheetFilters', '', false, false)]
    procedure OnBeforeApplyInsDataSheetFilters(InspectReceipt: Record "Inspection Receipt Header B2B"; var InspectDataSheet: Record "Ins Datasheet Header B2B")
    begin
        if InspectReceipt."Document Type" = InspectReceipt."Document Type"::"Sales Order" then begin
            InspectDataSheet.SETRANGE("Order No.", InspectReceipt."Order No.");
            InspectDataSheet.SetRange("Sales. Line No", InspectReceipt."Sales. Line No");
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Post-Inspection Data Sheet B2B", 'OnBeforeGetInspectReportHeader', '', false, false)]
    procedure OnBeforeGetInspectReportHeader(Var InspectReportHeader: Record "Inspection Receipt Header B2B"; InspectHeader: Record "Posted Ins DatasheetHeader B2B"; var IsHandled: boolean)
    begin
        if InspectHeader."Source Type" = InspectHeader."Source Type"::"In Bound" then begin
            if InspectReportHeader."Quality Before Receipt" then
                InspectReportHeader.SETRANGE("Order No.", InspectHeader."Order No.")
            else
                if InspectHeader."Document Type" = InspectHeader."Document Type"::"Sales Order" then begin
                    InspectReportHeader.SETRANGE("Order No.", InspectHeader."Order No.");
                    InspectReportHeader.SETRANGE("Sales. Line No", InspectHeader."Sales. Line No");
                    InspectReportHeader.SETRANGE("Rework Reference No.", InspectHeader."Rework Reference No.");
                end else begin
                    //if InspectHeader."Document Type" <> InspectHeader."Document Type"::"Sample Lot" then begin
                    InspectReportHeader.SETRANGE("Receipt No.", InspectHeader."Receipt No.");
                    InspectReportHeader.SETRANGE("Purch Line No", InspectHeader."Purch. Line No");
                    InspectReportHeader.SETRANGE("Lot No.", InspectHeader."Lot No.");
                    InspectReportHeader.SETRANGE("Purchase Consignment", InspectHeader."Purchase Consignment No.");
                    InspectReportHeader.SETRANGE("Rework Reference No.", InspectHeader."Rework Reference No.");
                    if InspectHeader."Rework Level" <> 0 then
                        InspectReportHeader.SETRANGE("DC Inbound Ledger Entry.", InspectHeader."DC Inbound Ledger Entry");//QC1.4
                end;
        end else begin
            InspectReportHeader.SETRANGE("Prod. Order No.", InspectHeader."Prod. Order No.");
            InspectReportHeader.SETRANGE("Prod. Order Line", InspectHeader."Prod. Order Line");
            InspectReportHeader.SETRANGE("Production Batch No.", InspectHeader."Production Batch No.");
            InspectReportHeader.SETRANGE("Rework Reference No.", InspectHeader."Rework Reference No.");
            if InspectHeader."Rework Level" <> 0 then
                InspectReportHeader.SETRANGE("DC Inbound Ledger Entry.", InspectHeader."DC Inbound Ledger Entry");//QC1.4
        end;
        IsHandled := true;
    end;

    //Sales QC Events End<<

    //Auto-Reserve of Sales Order Starts>>
    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterOnClosePage', '', false, false)]
    local procedure OnAfterOnClosePage(var TrackingSpecification: Record "Tracking Specification"; CurrentRunMode: Enum "Item Tracking Run Mode"; CurrentSourceType: Integer; CurrentSourceRowID: Text[250]; SecondSourceRowID: Text[250])
    var
        ReserveEntryLRec: Record "Reservation Entry";
        RsrvEntry: Record "Reservation Entry";
        RsrvEntry1: Record "Reservation Entry";
        ILE: Record "Item Ledger Entry";
        Reserved: Boolean;
    begin
        if TrackingSpecification."Source Type" <> 37 then
            exit;
        Reserved := false;
        if TrackingSpecification."Lot No." <> '' then begin
            ReserveEntryLRec.Reset();
            ReserveEntryLRec.SetRange("Source Type", 37);
            ReserveEntryLRec.SetRange("Source Subtype", 1);
            ReserveEntryLRec.SetRange("Source ID", TrackingSpecification."Source ID");
            ReserveEntryLRec.SetRange("Source Ref. No.", TrackingSpecification."Source Ref. No.");
            if ReserveEntryLRec.FindSet() then
                repeat
                    RsrvEntry.Reset();
                    RsrvEntry.SetRange("Entry No.", ReserveEntryLRec."Entry No.");
                    if ReserveEntryLRec.Positive then
                        RsrvEntry.SetRange(Positive, false)
                    else
                        RsrvEntry.SetRange(Positive, true);
                    if not RsrvEntry.FindFirst() then begin
                        ILE.Reset();
                        ILE.SetRange("Item No.", ReserveEntryLRec."Item No.");
                        ILE.SetRange("Location Code", ReserveEntryLRec."Location Code");
                        ILE.SetFilter("Remaining Quantity", '>%1', 0);
                        ILE.SetRange(Open, true);
                        ILE.SetRange(Positive, true);
                        ILE.SetRange("Lot No.", ReserveEntryLRec."Lot No.");
                        if ILE.FindFirst() then begin
                            RsrvEntry1.Init();
                            RsrvEntry1."Entry No." := ReserveEntryLRec."Entry No.";
                            RsrvEntry1."Item No." := ILE."Item No.";
                            RsrvEntry1."Location Code" := ILE."Location Code";
                            RsrvEntry1.validate(Quantity, -ReserveEntryLRec.Quantity);
                            RsrvEntry1.validate("Quantity (Base)", -ReserveEntryLRec."Quantity (Base)");
                            RsrvEntry1."Reservation Status" := RsrvEntry1."Reservation Status"::Reservation;
                            RsrvEntry1.Description := TrackingSpecification.Description;
                            RsrvEntry1."Creation Date" := ReserveEntryLRec."Creation Date";
                            RsrvEntry1."Source Type" := 32;
                            RsrvEntry1."Source Ref. No." := ILE."Entry No.";
                            RsrvEntry1."Created By" := ReserveEntryLRec."Created By";
                            RsrvEntry1.Positive := true;
                            RsrvEntry1."Shipment Date" := ReserveEntryLRec."Creation Date";
                            RsrvEntry1."Lot No." := ReserveEntryLRec."Lot No.";
                            RsrvEntry1.Insert();

                            ReserveEntryLRec."Reservation Status" := ReserveEntryLRec."Reservation Status"::Reservation;
                            ReserveEntryLRec.Modify();
                            Reserved := true;
                        end;
                    end;
                until ReserveEntryLRec.Next() = 0;
            if Reserved then
                Message(Text50000);
        end;
    end;
    //Auto-Reserve of Sales Order Starts<<

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inspection Jnl. Post Line B2B", 'OnBeforeUpdatePurchReceiptLine', '', false, false)]
    procedure OnBeforeUpdatePurchReceiptLine(var InsReceiptHeader: Record "Inspection Receipt Header B2B"; var IsHandled: Boolean)
    begin
        if (InsReceiptHeader."Document Type" = InsReceiptHeader."Document Type"::"Sample QC")
        or (InsReceiptHeader."Document Type" = InsReceiptHeader."Document Type"::"Sales Order") then
            IsHandled := true;
    end;

    //Showing Item Tracking Lines in Inspection Receipt Start>>
    [EventSubscriber(ObjectType::Table, Database::"Inspection Receipt Header B2B", 'OnBeforeShowItemTrackingLines', '', false, false)]
    procedure OnBeforeShowItemTrackingLines(var InsRcptHdr: Record "Inspection Receipt Header B2B"; Var IsHandled: Boolean)

    begin
        if (InsRcptHdr."Document Type" = InsRcptHdr."Document Type"::"Sales Order")
           And (InsRcptHdr."Source Type" = InsRcptHdr."Source Type"::"In Bound")
           and (not InsRcptHdr."Quality Before Receipt") then begin
            CallItemTracking(InsRcptHdr);
            IsHandled := true;
        end else
            IsHandled := false;
    end;

    local procedure CallItemTracking(var InsRcptHdr: Record "Inspection Receipt Header B2B")
    var
        QualityItemLedgEntry: Record "Quality Item Ledger Entry B2B";
        TempItemLedgEntry1: Record "Quality Item Ledger Entry B2B" temporary;
        SignFactor: Integer;
        ReserveEntry: Record "Reservation Entry";
        ReserveEntryLRec: Record "Reservation Entry";
    begin
        ReserveEntry.Reset();
        ReserveEntry.SETCURRENTKEY("Source ID", "Source Type");
        ReserveEntry.SetRange("Source Type", Database::"Sales Line");
        ReserveEntry.SetRange("Source Subtype", 1);
        ReserveEntry.SetRange("Source ID", InsRcptHdr."Order No.");
        ReserveEntry.SetRange("Source Ref. No.", InsRcptHdr."Sales. Line No");
        ReserveEntry.SetRange("Reservation Status", ReserveEntry."Reservation Status"::Reservation);
        ReserveEntry.SETRANGE("Source Batch Name", '');
        ReserveEntry.SETRANGE("Source Prod. Order Line", 0);
        ReserveEntry.SETRANGE("Lot No.", InsRcptHdr."Lot No.");
        TempItemLedgEntry1.DELETEALL();
        if ReserveEntry.FIND('-') then begin
            SignFactor := -1;
            if not InsRcptHdr.Status then begin
                if InsRcptHdr."Rework Level" = 0 then begin
                    repeat
                        ReserveEntryLRec.Get(ReserveEntry."Entry No.", true);
                        if QualityItemLedgEntry.GET(ReserveEntryLRec."Source Ref. No.") then
                            if (QualityItemLedgEntry."Inspection Status" = QualityItemLedgEntry."Inspection Status"::"Under Inspection") then begin
                                TempItemLedgEntry1 := QualityItemLedgEntry;
                                TempItemLedgEntry1.INSERT();
                            end;

                    until ReserveEntry.NEXT() = 0;
                    PAGE.RUNMODAL(33000276, TempItemLedgEntry1)
                end else begin
                    if InsRcptHdr."Serial No." = '' then begin
                        QualityItemLedgEntry.SETRANGE("Lot No.", InsRcptHdr."Lot No.");
                        if QualityItemLedgEntry.FIND('-') then begin
                            TempItemLedgEntry1 := QualityItemLedgEntry;
                            TempItemLedgEntry1.INSERT();
                        end;
                    end else begin
                        QualityItemLedgEntry.SETRANGE("Serial No.", InsRcptHdr."Serial No.");
                        if QualityItemLedgEntry.FIND('-') then begin
                            TempItemLedgEntry1 := QualityItemLedgEntry;
                            TempItemLedgEntry1.INSERT();
                        end
                    end;
                    PAGE.RUNMODAL(33000276, TempItemLedgEntry1);
                end;
                InsRcptHdr."Qty. Accepted" := 0;
                InsRcptHdr."Qty. Rejected" := 0;
                InsRcptHdr."Qty. Rework" := 0;
                InsRcptHdr."Qty. Accepted Under Deviation" := 0;
                if TempItemLedgEntry1.FIND('-') then
                    repeat
                        if TempItemLedgEntry1.Accept then
                            InsRcptHdr."Qty. Accepted" := InsRcptHdr."Qty. Accepted" + TempItemLedgEntry1.Quantity;
                        if TempItemLedgEntry1.Reject then
                            InsRcptHdr."Qty. Rejected" := InsRcptHdr."Qty. Rejected" + TempItemLedgEntry1.Quantity;
                        if TempItemLedgEntry1.Rework then
                            InsRcptHdr."Qty. Rework" := InsRcptHdr."Qty. Rework" + TempItemLedgEntry1.Quantity;
                        if TempItemLedgEntry1."Accept Under Deviation" then
                            InsRcptHdr."Qty. Accepted Under Deviation" := InsRcptHdr."Qty. Accepted Under Deviation" +
                                                                               TempItemLedgEntry1.Quantity;
                        QualityItemLedgEntry.COPY(TempItemLedgEntry1);
                        QualityItemLedgEntry.MODIFY();
                    until TempItemLedgEntry1.NEXT() = 0;
                InsRcptHdr.MODIFY();
                exit;
            end else begin
                if InsRcptHdr."Rework Level" = 0 then begin
                    QualityItemLedgEntry.SETRANGE("Document No.", InsRcptHdr."Receipt No.");
                    if QualityItemLedgEntry.FIND('-') then
                        repeat
                            if QualityItemLedgEntry.Rework then begin
                                TempItemLedgEntry1 := QualityItemLedgEntry;
                                TempItemLedgEntry1.INSERT();
                            end;
                        until QualityItemLedgEntry.NEXT() = 0;
                    PAGE.RUNMODAL(33000276, TempItemLedgEntry1);
                end else begin
                    if InsRcptHdr."Serial No." = '' then begin
                        QualityItemLedgEntry.SETRANGE("Lot No.", InsRcptHdr."Lot No.");
                        if QualityItemLedgEntry.FIND('-') then begin
                            TempItemLedgEntry1 := QualityItemLedgEntry;
                            TempItemLedgEntry1.INSERT();
                        end;
                    end else begin
                        QualityItemLedgEntry.SETRANGE("Serial No.", InsRcptHdr."Serial No.");
                        if QualityItemLedgEntry.FIND('-') then begin
                            TempItemLedgEntry1 := QualityItemLedgEntry;
                            TempItemLedgEntry1.INSERT();
                        end;
                    end;
                    Page.RUNMODAL(33000276, TempItemLedgEntry1);
                end;
                InsRcptHdr."Qty. to Vendor(Rework)" := 0;
                if TempItemLedgEntry1.FIND('-') then
                    repeat
                        if TempItemLedgEntry1."Sending to Rework" then
                            InsRcptHdr."Qty. to Vendor(Rework)" := InsRcptHdr."Qty. to Vendor(Rework)" + TempItemLedgEntry1.Quantity;
                        QualityItemLedgEntry.COPY(TempItemLedgEntry1);
                        QualityItemLedgEntry.MODIFY();
                    until TempItemLedgEntry1.NEXT() = 0;
                InsRcptHdr.MODIFY();
            end;
            exit;
        end else
            exit;
    end;
    //Showing Item Tracking Lines in Inspection Receipt End<<

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inspection Jnl. Post Line B2B", 'OnBeforeInsertQCItemTrackingLedger', '', false, false)]
    procedure OnBeforeInsertQCItemTrackingLedger(var InsReceiptHeader: Record "Inspection Receipt Header B2B"; var QualityLedgerEntry: Record "Quality Ledger Entry B2B"; QualityLedgerEntryNo: Integer; var IsHandled: Boolean)
    begin
        if (InsReceiptHeader."Document Type" = InsReceiptHeader."Document Type"::"Sales Order")
           And (InsReceiptHeader."Source Type" = InsReceiptHeader."Source Type"::"In Bound")
           and (not InsReceiptHeader."Quality Before Receipt") then begin
            InsertSalesQCItemTrackingLedger(InsReceiptHeader, QualityLedgerEntry, QualityLedgerEntryNo);
            IsHandled := true;
        end else
            IsHandled := false;
    end;

    procedure InsertSalesQCItemTrackingLedger(var InsReceiptHeader: Record "Inspection Receipt Header B2B";
                                            var QualityLedgerEntry: Record "Quality Ledger Entry B2B";
                                            var QualityEntryNo: Integer)
    var
        QualityItemLedgEntry: Record "Quality Item Ledger Entry B2B";
        IsHandled: Boolean;
        TempItemLedgEntry1: Record "Quality Item Ledger Entry B2B" temporary;
        ReserveEntry: Record "Reservation Entry";
        ReserveEntryLRec: Record "Reservation Entry";
        InsPostLine: Codeunit "Inspection Jnl. Post Line B2B";
    begin
        ReserveEntry.Reset();
        ReserveEntry.SETCURRENTKEY("Source ID", "Source Type");
        ReserveEntry.SetRange("Source Type", Database::"Sales Line");
        ReserveEntry.SetRange("Source Subtype", 1);
        ReserveEntry.SetRange("Source ID", InsReceiptHeader."Order No.");
        ReserveEntry.SetRange("Source Ref. No.", InsReceiptHeader."Sales. Line No");
        ReserveEntry.SetRange("Reservation Status", ReserveEntry."Reservation Status"::Reservation);
        ReserveEntry.SETRANGE("Source Batch Name", '');
        ReserveEntry.SETRANGE("Source Prod. Order Line", 0);
        ReserveEntry.SETRANGE("Lot No.", InsReceiptHeader."Lot No.");
        if InsReceiptHeader."Rework Level" = 0 then begin
            if ReserveEntry.FIND('-') then
                repeat
                    ReserveEntryLRec.Get(ReserveEntry."Entry No.", true);
                    if QualityItemLedgEntry.GET(ReserveEntryLRec."Source Ref. No.") and
                       (QualityItemLedgEntry."Inspection Status" = QualityItemLedgEntry."Inspection Status"::"Under Inspection")
                    then begin
                        if (QualityItemLedgEntry.Accept) or (QualityItemLedgEntry."Accept Under Deviation") then begin
                            QualityLedgerEntry.Quantity := QualityItemLedgEntry."Remaining Quantity";
                            QualityLedgerEntry."Remaining Quantity" := 0;
                            QualityLedgerEntry.Open := false;
                            QualityLedgerEntry."Serial No." := QualityItemLedgEntry."Serial No.";
                            QualityLedgerEntry."Lot No." := QualityItemLedgEntry."Lot No.";
                            QualityLedgerEntry."Item Ledger Entry No." := QualityItemLedgEntry."Entry No.";
                            if QualityItemLedgEntry."Accept Under Deviation" then begin
                                QualityLedgerEntry."Accepted Under Dev. Reason" := InsReceiptHeader."Qty. Accepted UD Reason";
                                QualityLedgerEntry."Reason Description" := InsReceiptHeader."Reason Description";
                            end;
                            QualityEntryNo := QualityEntryNo + 1;
                            QualityLedgerEntry."Entry No." := QualityEntryNo;
                            QualityLedgerEntry."Entry Type" := QualityLedgerEntry."Entry Type"::Accepted;
                            QualityItemLedgEntry."Quality Ledger Entry No." := QualityLedgerEntry."Entry No.";
                            QualityLedgerEntry.INSERT();
                            QualityItemLedgEntry.DELETE();
                        end;
                        if QualityItemLedgEntry.Reject then begin
                            QualityLedgerEntry.Quantity := QualityItemLedgEntry."Remaining Quantity";
                            QualityLedgerEntry."Remaining Quantity" := 0;
                            QualityLedgerEntry.Open := false;
                            QualityLedgerEntry."Serial No." := QualityItemLedgEntry."Serial No.";
                            QualityLedgerEntry."Lot No." := QualityItemLedgEntry."Lot No.";
                            QualityLedgerEntry."Item Ledger Entry No." := QualityItemLedgEntry."Entry No.";
                            QualityEntryNo := QualityEntryNo + 1;
                            QualityLedgerEntry."Entry No." := QualityEntryNo;
                            QualityLedgerEntry."Entry Type" := QualityLedgerEntry."Entry Type"::Reject;
                            QualityItemLedgEntry."Inspection Status" := QualityItemLedgEntry."Inspection Status"::Rejected;
                            QualityItemLedgEntry."Quality Ledger Entry No." := QualityLedgerEntry."Entry No.";
                            QualityLedgerEntry."Accepted Under Dev. Reason" := '';
                            QualityLedgerEntry."Reason Description" := '';
                            IF InsReceiptHeader."Rework Level" = 0 THEN
                                QualityLedgerEntry."In bound Item Ledger Entry No." := InsReceiptHeader."Item Ledger Entry No."
                            ELSE
                                QualityLedgerEntry."In bound Item Ledger Entry No." := InsReceiptHeader."DC Inbound Ledger Entry.";
                            QualityLedgerEntry.INSERT();
                            QualityItemLedgEntry.MODIFY();
                        end;
                        if QualityItemLedgEntry.Rework then begin
                            QualityLedgerEntry.Quantity := QualityItemLedgEntry."Remaining Quantity";
                            QualityLedgerEntry."Remaining Quantity" := QualityItemLedgEntry."Remaining Quantity";
                            QualityLedgerEntry."Item Ledger Entry No." := QualityItemLedgEntry."Entry No.";
                            QualityLedgerEntry.Open := true;
                            QualityEntryNo := QualityEntryNo + 1;
                            QualityLedgerEntry."Serial No." := QualityItemLedgEntry."Serial No.";
                            QualityLedgerEntry."Lot No." := QualityItemLedgEntry."Lot No.";
                            QualityLedgerEntry."Entry No." := QualityEntryNo;
                            QualityLedgerEntry."Entry Type" := QualityLedgerEntry."Entry Type"::Rework;
                            QualityLedgerEntry."Accepted Under Dev. Reason" := '';
                            QualityLedgerEntry."Reason Description" := '';
                            QualityLedgerEntry.INSERT();
                        end;
                    end;
                until ReserveEntry.NEXT() = 0;
            //end;
        end else begin
            if InsReceiptHeader."Serial No." = '' then
                QualityItemLedgEntry.SETRANGE("Lot No.", InsReceiptHeader."Lot No.")
            else
                QualityItemLedgEntry.SETRANGE("Serial No.", InsReceiptHeader."Serial No.");
            if QualityItemLedgEntry.FIND('-') then begin
                if (QualityItemLedgEntry.Accept) or (QualityItemLedgEntry."Accept Under Deviation") then begin
                    QualityLedgerEntry.Quantity := QualityItemLedgEntry."Remaining Quantity";
                    QualityLedgerEntry."Remaining Quantity" := 0;
                    QualityLedgerEntry.Open := false;
                    QualityLedgerEntry."Serial No." := QualityItemLedgEntry."Serial No.";
                    QualityLedgerEntry."Lot No." := QualityItemLedgEntry."Lot No.";
                    QualityLedgerEntry."Item Ledger Entry No." := QualityItemLedgEntry."Entry No.";
                    if QualityItemLedgEntry."Accept Under Deviation" then begin
                        QualityLedgerEntry."Accepted Under Dev. Reason" := InsReceiptHeader."Qty. Accepted UD Reason";
                        QualityLedgerEntry."Reason Description" := InsReceiptHeader."Reason Description";
                    end;
                    QualityEntryNo := QualityEntryNo + 1;
                    QualityLedgerEntry."Entry No." := QualityEntryNo;
                    QualityLedgerEntry."Entry Type" := QualityLedgerEntry."Entry Type"::Accepted;
                    QualityItemLedgEntry."Quality Ledger Entry No." := QualityLedgerEntry."Entry No.";
                    QualityLedgerEntry.INSERT();
                    QualityItemLedgEntry.DELETE();
                end;
                if QualityItemLedgEntry.Reject then begin
                    QualityLedgerEntry.Quantity := QualityItemLedgEntry."Remaining Quantity";
                    QualityLedgerEntry."Remaining Quantity" := 0;
                    QualityLedgerEntry.Open := false;
                    QualityLedgerEntry."Serial No." := QualityItemLedgEntry."Serial No.";
                    QualityLedgerEntry."Lot No." := QualityItemLedgEntry."Lot No.";
                    QualityLedgerEntry."Item Ledger Entry No." := QualityItemLedgEntry."Entry No.";
                    QualityEntryNo := QualityEntryNo + 1;
                    QualityLedgerEntry."Entry No." := QualityEntryNo;
                    QualityLedgerEntry."Entry Type" := QualityLedgerEntry."Entry Type"::Reject;
                    QualityItemLedgEntry."Inspection Status" := QualityItemLedgEntry."Inspection Status"::Rejected;
                    QualityItemLedgEntry."Quality Ledger Entry No." := QualityLedgerEntry."Entry No.";
                    QualityLedgerEntry."Accepted Under Dev. Reason" := '';
                    QualityLedgerEntry."Reason Description" := '';
                    QualityLedgerEntry.INSERT();
                    QualityItemLedgEntry."Document No." := InsReceiptHeader."No.";
                    QualityItemLedgEntry.MODIFY();

                end;
                if QualityItemLedgEntry.Rework then begin
                    QualityLedgerEntry.Quantity := QualityItemLedgEntry."Remaining Quantity";
                    QualityLedgerEntry."Remaining Quantity" := QualityItemLedgEntry."Remaining Quantity";
                    QualityLedgerEntry."Item Ledger Entry No." := QualityItemLedgEntry."Entry No.";
                    QualityLedgerEntry.Open := true;
                    QualityEntryNo := QualityEntryNo + 1;
                    QualityLedgerEntry."Serial No." := QualityItemLedgEntry."Serial No.";
                    QualityLedgerEntry."Lot No." := QualityItemLedgEntry."Lot No.";
                    QualityLedgerEntry."Entry No." := QualityEntryNo;
                    QualityLedgerEntry."Entry Type" := QualityLedgerEntry."Entry Type"::Rework;
                    QualityLedgerEntry."Accepted Under Dev. Reason" := '';
                    QualityLedgerEntry."Reason Description" := '';
                    QualityLedgerEntry.INSERT();
                    QualityItemLedgEntry."Document No." := InsReceiptHeader."No.";
                    QualityItemLedgEntry.MODIFY();
                end;
            end;
            if InsReceiptHeader."Rework Reference No." <> '0' then
                InsPostLine.UpdateParentQualityLedgEntry(InsReceiptHeader."Rework Reference No.");
        end;
    end;

    var
        Text50000: Label 'Tracking Reserved.';
        Text33000250Err: Label 'You cannot ship more than Quality Accepted in Sales Order No. %1 and Line No. %2.', comment = ' %1 Document No.= ; %2 = Line No.';


}