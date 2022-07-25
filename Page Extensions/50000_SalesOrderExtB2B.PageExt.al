pageextension 50000 SalesOrderPageExtB2B extends "Sales Order"
{
    layout
    {
        addafter(Control1900201301)
        {
            group(QC)
            {
                Caption = 'QC';
                field("Sample ID"; Rec."Sample ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
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
            }
        }
    }

    var
        myInt: Integer;
}