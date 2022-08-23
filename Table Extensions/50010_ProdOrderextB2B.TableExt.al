tableextension 50010 ProdOrderExtB2B extends "Production Order"
{
    fields
    {
        field(50000; "Sample ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sample ID';
        }
    }

}