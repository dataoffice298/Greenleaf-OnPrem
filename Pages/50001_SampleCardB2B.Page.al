page 50001 "Sample Card B2B"
{
    Caption = 'Sample Card';
    PageType = Card;
    SourceTable = "Sample B2B";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Sample ID"; Rec."Sample ID")
                {
                    AssistEdit = true;
                    ApplicationArea = all;
                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.UPDATE();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = all;
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                    ApplicationArea = all;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = all;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = all;
                }
                field("Sample Qty"; Rec."Sample Qty")
                {
                    ApplicationArea = all;
                }
                field("Sample UOM"; Rec."Sample UOM")
                {
                    ApplicationArea = all;
                }
                field("Batch No."; Rec."Batch No.")
                {
                    ApplicationArea = all;
                }
                field("Mfg Date"; Rec."Mfg Date")
                {
                    ApplicationArea = all;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = all;
                }
                field("Specification ID"; Rec."Specification ID")
                {
                    ApplicationArea = all;
                }
                field("AR No."; Rec."AR No.")
                {
                    ApplicationArea = all;
                }
                field("QC Completion Date"; Rec."QC Completion Date")

                {
                    ApplicationArea = all;
                }

                field("QC Completed"; Rec."QC Completed")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = all;
                }
                field("Sales Order No."; Rec."Sales Order No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }

            group("&Vendor Details")
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = all;
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = all;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Caption = 'Post Code/City';
                    ApplicationArea = all;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = all;
                }
                field(State; Rec.State)
                {
                    ApplicationArea = all;
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = all;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = all;
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = all;
                }
                field(Contact; Rec.Contact)
                {
                    Editable = ContactEditable;
                    ApplicationArea = all;

                    trigger OnValidate();
                    begin
                        ContactOnAfterValidate();
                    end;
                }
                field("Vendor Created"; Rec."Vendor Created")
                {
                    ApplicationArea = all;
                }
            }

            group("&Customer Details")
            {
                //Customer>>
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = all;
                }
                field("Customer Address2"; Rec."Customer Address2")
                {
                    ApplicationArea = all;
                }
                field("Customer Post Code"; Rec."Customer Post Code")
                {
                    Caption = 'Post Code/City';
                    ApplicationArea = all;
                }
                field("Customer City"; Rec."Customer City")
                {
                    ApplicationArea = all;
                }
                field("Customer State"; Rec."Customer State")
                {
                    ApplicationArea = all;
                }
                field("Customer Country Code"; Rec."Customer Country Code")
                {
                    ApplicationArea = all;
                }
                field("Customer Phone No."; Rec."Customer Phone No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Fax No."; Rec."Customer Fax No.")
                {
                    ApplicationArea = all;
                }
                field("Customer E-Mail"; Rec."Customer E-Mail")
                {
                    ApplicationArea = all;
                }
                field("Customer Home Page"; Rec."Customer Home Page")
                {
                    ApplicationArea = all;
                }
                field("Customer Contact"; Rec."Customer Contact")
                {
                    Editable = ContactEditable;
                    ApplicationArea = all;

                    trigger OnValidate();
                    begin
                        ContactOnAfterValidate();
                    end;
                }
                field("Customer Created"; Rec."Customer Created")
                {
                    ApplicationArea = all;
                }
                //Customer<<
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Order")
            {
                Caption = 'Order';
                Image = Order;
                action(CreateSalesOrder)
                {
                    Caption = 'Create Sales Order';
                    Image = Sales;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        CreateOrder(0);
                    end;
                }
                action(CreatePurchaseOrder)
                {
                    Caption = 'Create Purchase Order';
                    Image = Purchase;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        CreateOrder(1);
                    end;
                }
            }

            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = ReferenceData;
                action("Create Vendor")
                {
                    ApplicationArea = all;
                    Caption = 'Create Vendor';
                    Image = CreateForm;

                    trigger OnAction();
                    begin
                        Rec.TESTFIELD("Vendor Name");
                        if Rec."Vendor No." <> '' then
                            ERROR(Text002Lbl)
                        else
                            if CONFIRM(Text001Lbl) then begin
                                Rec.TESTFIELD("QC Completed");
                                "Purchases&PayablesSetup".GET();
                                Vendor."No." := NoSeriesMgt.GetNextNo("Purchases&PayablesSetup"."Vendor Nos.", 0D, true);
                                CreatedVendor := Vendor."No.";
                                Vendor.VALIDATE(Name, Rec."Vendor Name");
                                Vendor.VALIDATE(Name, Rec."Vendor Name");
                                Vendor.VALIDATE(Address, Rec.Address);
                                Vendor.VALIDATE("Address 2", Rec.Address2);
                                Vendor.VALIDATE(City, Rec.City);
                                Vendor.Contact := Rec.Contact;
                                Vendor.VALIDATE("Phone No.", Rec."Phone No.");
                                Vendor.VALIDATE("Telex No.", Rec."Telex No.");
                                Vendor.VALIDATE("Post Code", Rec."Post Code");
                                Vendor.VALIDATE("Country/Region Code", Rec."Country Code");
                                Vendor.VALIDATE("Fax No.", Rec."Fax No.");
                                Vendor.VALIDATE("Primary Contact No.", Rec."Primary Contact No.");
                                Vendor.VALIDATE("E-Mail", Rec."E-Mail");
                                Vendor.VALIDATE("Home Page", Rec."Home Page");
                                Vendor.INSERT();
                                Rec."Vendor Created" := true;
                                MESSAGE(Text000Lbl, CreatedVendor);
                                Rec."Vendor No." := CreatedVendor;
                                CurrPage.UPDATE();
                            end;

                        CurrPage.UPDATE();
                    end;
                }
                action("Create Inspection Data &Sheets")
                {
                    ApplicationArea = all;
                    Caption = 'Create Inspection Data &Sheets';
                    Image = CreateForm;

                    trigger OnAction();
                    begin
                        Rec.TESTFIELD("Item No.");
                        Rec.TESTFIELD("Sample Qty");
                        Rec.TESTFIELD("Sample UOM");
                        Rec.TESTFIELD("Batch No.");
                        Rec.TESTFIELD("Mfg Date");
                        // if Item.GET(Rec."Item No.") then
                        //     if Item."Item Classification" <> Item."Item Classification"::Packing then
                        Rec.TESTFIELD("Expiry Date");
                        Rec.TESTFIELD("Specification ID");
                        if Rec."Vendor No." = '' then
                            Rec.TESTFIELD("Vendor Name")
                        else
                            Rec.TESTFIELD("Vendor No.");
                        Rec.CreateInspectionDataSheets();
                    end;
                }
            }
        }
    }

    trigger OnInit();
    begin
        ContactEditable := true;
    end;

    var
        Vendor: Record Vendor;
        "Purchases&PayablesSetup": Record "Purchases & Payables Setup";
        Item: Record Item;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CreatedVendor: Code[20];
        Text000Lbl: Label 'New Vendor %1 is Created';
        Text001Lbl: Label 'Do you want to create a new vendor';
        [InDataSet]
        ContactEditable: Boolean;
        Text002Lbl: Label 'Vendor is already created';

    procedure CreateOrder(OrderType: Option "Sales Order","Purchase Order")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        Text001: Label 'Sales Order with document no. - %1 has been created successfully.';
        Text002: Label 'Purchase Order with document no. - %1 has been created successfully.';
        Text003: Label 'Sales Order is already created.';
        Text004: Label 'Purchase Order is already created.';
    begin
        if OrderType = OrderType::"Sales Order" then begin
            if Rec."Sales Order No." <> '' then
                Error(Text003);
            Rec.TestField("Customer No.");
            Rec.TestField("Sample ID");
            Rec.TestField("Item No.");
            Rec.TestField("Sample Qty");
            //Header Part>>
            SalesHeader.Init();
            SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
            SalesHeader.Validate("Sell-to Customer No.", Rec."Customer No.");
            SalesHeader."Sample ID" := Rec."Sample ID";
            SalesHeader.Insert(true);
            //Header Part<<

            //Line Part>>
            SalesLine.Init();
            SalesLine."Document Type" := SalesLine."Document Type"::Order;
            SalesLine."Document No." := SalesHeader."No.";
            SalesLine.Validate("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
            SalesLine.Validate(Type, SalesLine.Type::Item);
            SalesLine.Validate("No.", Rec."Item No.");
            SalesLine.Validate(Quantity, Rec."Sample Qty");
            SalesLine.Validate("Unit of Measure Code", Rec."Sample UOM");
            SalesLine."Spec ID" := Rec."Specification ID";
            SalesLine.Insert(true);
            //Line Part<<
            Rec."Sales Order No." := SalesHeader."No.";
            Rec.Modify();
            Message(Text001, SalesHeader."No.");
        end;

        if OrderType = OrderType::"Purchase Order" then begin
            if Rec."Purchase Order No." <> '' then
                Error(Text004);
            Rec.TestField("Vendor No.");
            Rec.TestField("Sample ID");
            Rec.TestField("Item No.");
            Rec.TestField("Sample Qty");
            //Header Part>>
            PurchaseHeader.Init();
            PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Order;
            PurchaseHeader.Validate("Buy-from Vendor No.", Rec."Vendor No.");
            PurchaseHeader."Sample ID" := Rec."Sample ID";
            PurchaseHeader.Insert(true);
            //Header Part<<

            //Line Part>>
            PurchaseLine.Init();
            PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
            PurchaseLine."Document No." := PurchaseHeader."No.";
            PurchaseLine.Validate("Buy-from Vendor No.", PurchaseHeader."Buy-from Vendor No.");
            PurchaseLine.Validate(Type, PurchaseLine.Type::Item);
            PurchaseLine.Validate("No.", Rec."Item No.");
            PurchaseLine.Validate(Quantity, Rec."Sample Qty");
            PurchaseLine.Validate("Unit of Measure Code", Rec."Sample UOM");
            PurchaseLine."Spec ID B2B" := Rec."Specification ID";
            PurchaseLine.Insert(true);
            //Line Part<<
            Rec."Purchase Order No." := PurchaseHeader."No.";
            Rec.Modify();
            Message(Text002, PurchaseHeader."No.");
        end;
    end;
    /*

    actions
    {
        area(navigation)
        {
            group("&Sample")
            {
                Caption = '&Sample';
                Image = RegisteredDocs;
                group("I&nspection")
                {
                    Caption = 'I&nspection';
                    Image = RegisteredDocs;
                    action("Inspection &Data Sheets")
                    {
                        ApplicationArea = all;
                        Caption = 'Inspection &Data Sheets';
                        Image = DataEntry;

                        trigger OnAction();
                        begin
                            ShowDataSheets();
                        end;
                    }
                    action("&Posted Inspection Data Sheets")
                    {
                        ApplicationArea = all;
                        Caption = '&Posted Inspection Data Sheets';
                        Image = Post;

                        trigger OnAction();
                        begin
                            ShowPostDataSheets();
                        end;
                    }
                    action("Inspection &Receipts")
                    {
                        ApplicationArea = all;
                        Caption = 'Inspection &Receipts';
                        Image = Receipt;

                        trigger OnAction();
                        begin
                            ShowInspectReceipt();
                        end;
                    }
                    action("Posted Inspection Re&ceipts")
                    {
                        ApplicationArea = all;
                        Caption = 'Posted Inspection Re&ceipts';
                        Image = PostedReceipt;

                        trigger OnAction();
                        begin
                            ShowPostInspectReceipt();
                        end;
                    }
                }
            }
        }
        area(processing)
        {
            action("Sample &Register")
            {
                ApplicationArea = all;
                Caption = 'Sample &Register';
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                begin
                    REPORT.RUNMODAL(50060, true, false, Rec);
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = ReferenceData;
                action("Create Vendor")
                {
                    ApplicationArea = all;
                    Caption = 'Create Vendor';
                    Image = CreateForm;

                    trigger OnAction();
                    begin
                        TESTFIELD("Vendor Name");
                        if "Vendor No." <> '' then
                            ERROR(Text002Lbl)
                        else
                            if CONFIRM(Text001Lbl) then begin
                                TESTFIELD("QC Completed");
                                "Purchases&PayablesSetup".GET();
                                Vendor."No." := NoSeriesMgt.GetNextNo("Purchases&PayablesSetup"."Vendor Nos.", 0D, true);
                                CreatedVendor := Vendor."No.";
                                Vendor.VALIDATE(Name, "Vendor Name");
                                Vendor.VALIDATE(Name, "Vendor Name");
                                Vendor.VALIDATE(Address, Address);
                                Vendor.VALIDATE("Address 2", Address2);
                                Vendor.VALIDATE(City, City);
                                Vendor.Contact := Contact;
                                Vendor.VALIDATE("Phone No.", "Phone No.");
                                Vendor.VALIDATE("Telex No.", "Telex No.");
                                Vendor.VALIDATE("Post Code", "Post Code");
                                Vendor.VALIDATE("Country/Region Code", "Country Code");
                                Vendor.VALIDATE("Fax No.", "Fax No.");
                                Vendor.VALIDATE("Primary Contact No.", "Primary Contact No.");
                                Vendor.VALIDATE("E-Mail", "E-Mail");
                                Vendor.VALIDATE("Home Page", "Home Page");
                                Vendor.INSERT();
                                Rec."Vendor Created" := true;
                                MESSAGE(Text000Lbl, CreatedVendor);
                                Rec."Vendor No." := CreatedVendor;
                                CurrPage.UPDATE();
                            end;

                        CurrPage.UPDATE();
                    end;
                }
                action("Create Inspection Data &Sheets")
                {
                    ApplicationArea = all;
                    Caption = 'Create Inspection Data &Sheets';
                    Image = CreateForm;

                    trigger OnAction();
                    begin
                        TESTFIELD("Item No.");
                        TESTFIELD("Sample Qty");
                        TESTFIELD("Sample UOM");
                        TESTFIELD("Batch No.");
                        TESTFIELD("Mfg Date");
                        if Item.GET("Item No.") then
                            if Item."Item Classification" <> Item."Item Classification"::Packing then
                                TESTFIELD("Expiry Date");
                        TESTFIELD("Specification ID");
                        if "Vendor No." = '' then
                            TESTFIELD("Vendor Name")
                        else
                            TESTFIELD("Vendor No.");
                        CreateInspectionDataSheets();
                    end;
                }
                action("&Destruction Process")
                {
                    ApplicationArea = all;
                    Caption = '&Destruction Process';
                    Image = Split;

                    trigger OnAction();
                    begin
                        InsertDestruction(Rec);
                    end;
                }
            }
        }
    }
    */



    procedure ActivateFields();
    begin
        ContactEditable := Rec."Primary Contact No." = '';
        ContactEditable := Rec."Customer Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate();
    begin
        ActivateFields();
    end;
}

