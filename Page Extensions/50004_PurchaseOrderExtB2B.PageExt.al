pageextension 50004 PurchaseOrderExtB2B extends "Purchase Order"
{
    layout
    {
        addafter(Prepayment)
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


    var
        myInt: Integer;
}