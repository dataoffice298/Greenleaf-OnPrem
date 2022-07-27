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
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterSalesShptLineInsert', '', false, false)]
    local procedure QualityCheckInspect(var SalesShipmentLine: Record "Sales Shipment Line"; SalesLine: Record "Sales Line"; ItemShptLedEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean; SalesInvoiceHeader: Record "Sales Invoice Header"; var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary; var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary)
    begin
        if SalesLine."Dispatch Qc" then begin
            SalesLine.CalcFields("Quantity Accepted");
            if SalesLine."Quantity Accepted" > SalesLine."Qty. to Ship" + SalesLine."Quantity Shipped" then
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
                end else
                    if InspectHeader."Document Type" <> InspectHeader."Document Type"::"Sample QC" then begin
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
    end;

    //Sales QC Events End<<

    var
        Text33000250Err: Label 'You cannot ship more than Quality Accepted in Sales Order No. %1 and Line No. %2.', comment = ' %1 Document No.= ; %2 = Line No.';


}