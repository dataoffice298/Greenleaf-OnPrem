tableextension 50007 SalesHeaderExtB2B extends "Sales Header"
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