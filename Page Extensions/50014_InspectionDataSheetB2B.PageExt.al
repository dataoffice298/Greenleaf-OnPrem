pageextension 50014 InspectionDataSheetExtB2B extends "Inspection Data Sheet B2B"
{
    layout
    {
        addlast(General)
        {
            field("Sample ID"; Rec."Sample ID")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}