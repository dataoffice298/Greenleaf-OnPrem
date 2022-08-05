pageextension 50006 PostedSalesInvB2B extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Print)
        {
            action(SampleInvoice)
            {
                Caption = 'SampleInvoice';
                Image = Print;
                Promoted = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    SalesInvHead: Record "Sales Invoice Header";
                begin
                    SalesInvHead.Reset();
                    SalesInvHead.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"Sample Invoice", true, false, SalesInvHead);

                end;
            }
        }

    }

    var
        myInt: Integer;
}