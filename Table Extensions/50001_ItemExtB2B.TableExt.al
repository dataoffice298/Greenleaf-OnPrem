tableextension 50001 ItemExtB2B extends Item
{
    fields
    {
        field(50000; "Dispatch Qc"; Boolean)
        {
            Caption = 'Dispatch Qc';
            DataClassification = CustomerContent;
        }
        field(50001; "Sales Spec ID B2B"; Code[20])
        {
            Caption = 'Sales Spec ID';
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}