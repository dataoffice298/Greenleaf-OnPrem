tableextension 50008 PurchaseHeaderExtB2B extends "Purchase Header"
{
    fields
    {
        field(50000; "Sample ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sample ID';
        }
    }

    var
        myInt: Integer;
}