tableextension 50004 PostedInsDataSheetHdrExtB2B extends "Posted Ins DatasheetHeader B2B"
{
    fields
    {
        field(50000; "Sales. Line No"; Integer)
        {
            Caption = 'Sales. Line No';
            DataClassification = CustomerContent;
        }
        field(50001; "Sample ID"; Code[20])
        {
            Caption = 'Sample ID';
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}