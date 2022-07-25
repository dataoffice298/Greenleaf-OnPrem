pageextension 50002 ItemCardExtB2B extends "Item Card"
{
    layout
    {
        addlast("Quality B2B")
        {
            field("Dispatch Qc"; Rec."Dispatch Qc")
            {
                ApplicationArea = All;
                Caption = 'Dispatch Qc';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}