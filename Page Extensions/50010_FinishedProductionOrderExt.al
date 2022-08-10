pageextension 50010 FinishedproductionOrder extends "Finished Production Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("O&rder")
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