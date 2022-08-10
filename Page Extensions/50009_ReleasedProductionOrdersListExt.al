pageextension 50009 ReleasedProductionOrders extends "Released Production Orders"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(ProdOrderShortageList)
        {
            action(BlendingReport)
            {
                Caption = 'Blending Report';
                Image = Print;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    RelProdOrder: Record "Prod. Order Line";

                begin
                    RelProdOrder.Reset();
                    RelProdOrder.SetRange("Prod. Order No.", Rec."No.");
                    if RelProdOrder.FindFirst() then
                        Report.RunModal(Report::"Blending Report", true, false, RelProdOrder);


                end;
            }

        }
    }

    var
        myInt: Integer;
}