pageextension 50008 ReleasedProductionOrder  extends "Released Production Order"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
        addafter("Subcontractor - Dispatch List")
        {
            action(BlendingReport)
            {
                Caption = 'Print COA';
                Image = Print;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    InsRcptHdr: Record "Inspection Receipt Header B2B";
                begin
                    InsRcptHdr.Reset();
                    InsRcptHdr.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::COA, true, false, InsRcptHdr);
                end;
            }

        }
    }
    
    var
        myInt: Integer;
}