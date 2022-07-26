pageextension 50000 SalesOrderPageExtB2B extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {


            field("Sample ID"; Rec."Sample ID")
            {
                ApplicationArea = All;
                Editable = false;
            }

        }
    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            var
                SaleLine: Record "Sales Line";
                ErrSelect: Label 'No line selected to generate the report after posted. Please select atleast one line to continue.';
            begin
                SaleLine.Reset();
                SaleLine.SetRange("Document No.", Rec."No.");
                SaleLine.SetFilter("No.", '<>%1', '');
                SaleLine.SetRange(Select, true);
                if not SaleLine.FindFirst() then
                    Error(ErrSelect);
            end;
        }
        addlast(Warehouse)
        {
            group("Quality B2B")
            {
                Caption = '&Receipt';
                action("CreateInspectionDataSheets B2B")
                {
                    Caption = 'Create Inspection Data &Sheets';
                    ToolTip = 'we can create inspected data sheet is any item testing using for new ids created';
                    Image = MakeOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;
                    trigger OnAction()
                    begin
                        CurrPage.SalesLines.PAGE.CreateInspecDataSheets();
                    end;
                }

                action("Print NDGR DTDC")
                {
                    ApplicationArea = All;
                    Image = PrintAcknowledgement;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        SaleHeader: Record "Sales Header";
                    begin
                        SaleHeader.Reset();
                        SaleHeader.SetRange("No.", Rec."No.");
                        Report.RunModal(50002, true, false, SaleHeader);
                    end;
                }

                action("Print NDGR DHL")
                {
                    ApplicationArea = All;
                    Image = PrintAcknowledgement;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        SaleHeader: Record "Sales Header";
                    begin
                        SaleHeader.Reset();
                        SaleHeader.SetRange("No.", Rec."No.");
                        Report.RunModal(50004, true, false, SaleHeader);
                    end;
                }

            }

        }




    }


    var
        myInt: Integer;
}