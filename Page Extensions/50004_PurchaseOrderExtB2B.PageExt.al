pageextension 50004 PurchaseOrderExtB2B extends "Purchase Order"
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


    var
        myInt: Integer;
}