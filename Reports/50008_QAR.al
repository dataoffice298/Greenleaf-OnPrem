report 50008 QAR
{
    DefaultLayout = RDLC;
    RDLCLayout = './QAR.rdl';

    Caption = 'QAR_50008 REPORT';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;


    dataset
    {
        dataitem("Specification Line B2B"; "Specification Line B2B")
        {
            DataItemTableView = where("Character Type" = filter('STANDARD'));
            RequestFilterFields = "Spec ID";

            column(Character_Code; "Character Code")
            {

            }
            column(Character_Type; "Character Type")

            {

            }
            column(Description; Description)
            {

            }

            column(ActualValue_Text_; "ActualValue(Text)")
            {

            }
            column(ActualValue_Text_2; "ActualValue(Text)2")
            {

            }
            column(ActualValue_Text_3; "ActualValue(Text)3")
            {

            }
            column(ActualValue_Text_4; "ActualValue(Text)4")
            {

            }
            column(ActualValue_Text_5; "ActualValue(Text)5")
            {

            }
            column(PostedDataSheetHdr; PostedDataSheetHdr."No.")
            {

            }
            column(PostedDataSheetHdr2; PostedDataSheetHdr2."No.")
            {

            }
            column(PostedDataSheetHdr3; PostedDataSheetHdr3."No.")
            {

            }
            column(PostedDataSheetHdr4; PostedDataSheetHdr4."No.")
            {

            }
            column(PostedDataSheetHdr5; PostedDataSheetHdr5."No.")
            {

            }
            column(Property_Name; "Property Name")
            {

            }
            column(Companyinfo; Companyinfo.Name)
            {

            }


            trigger OnAfterGetRecord()
            var
                myInt: Integer;

                spec: Record "Specification Line B2B";


            begin
                Clear(PostedDataSheet);
                Clear("ActualValue(Text)");
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then
                    "ActualValue(Text)" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";
                Clear("ActualValue(Text)2");
                Clear(PostedDataSheet);
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr2."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then
                    "ActualValue(Text)2" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";

                Clear("ActualValue(Text)3");
                Clear(PostedDataSheet);
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr3."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then
                    "ActualValue(Text)3" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";

                Clear("ActualValue(Text)4");
                Clear(PostedDataSheet);
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr4."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then
                    "ActualValue(Text)4" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";

                Clear("ActualValue(Text)5");
                Clear(PostedDataSheet);
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr5."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then
                    "ActualValue(Text)5" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";

            end;
        }



    }


    requestpage
    {

        layout
        {
            area(Content)
            {
                group(Details)
                {
                    field(PostedDataSheetHdr; PostedDataSheetHdr."No.")
                    {
                        ApplicationArea = All;
                        TableRelation = "Posted Ins DatasheetHeader B2B";

                    }
                    field(PostedDataSheetHdr2; PostedDataSheetHdr2."No.")
                    {
                        ApplicationArea = all;
                        TableRelation = "Posted Ins DatasheetHeader B2B";

                    }
                    field(PostedDataSheetHdr3; PostedDataSheetHdr3."No.")
                    {
                        ApplicationArea = all;
                        TableRelation = "Posted Ins DatasheetHeader B2B";

                    }
                    field(PostedDataSheetHdr4; PostedDataSheetHdr4."No.")
                    {
                        ApplicationArea = all;
                        TableRelation = "Posted Ins DatasheetHeader B2B";


                    }
                    field(PostedDataSheetHdr5; PostedDataSheetHdr5."No.")
                    {
                        ApplicationArea = all;
                        TableRelation = "Posted Ins DatasheetHeader B2B";

                    }

                }
            }
        }
        trigger OnInit()
        var
            myInt: Integer;
        begin

            Companyinfo.get();

        end;




    }
    var
        myInt: Integer;
        PostedDataSheetHdr: Record "Posted Ins DatasheetHeader B2B";
        PostedDataSheet: Record "Posted Ins Datasheet Line B2B";

        "ActualValue(Text)": Code[20];
        PostedDataSheetHdr2: Record "Posted Ins DatasheetHeader B2B";
        PostedDataSheetHdr3: Record "Posted Ins DatasheetHeader B2B";
        PostedDataSheetHdr4: Record "Posted Ins DatasheetHeader B2B";
        PostedDataSheetHdr5: Record "Posted Ins DatasheetHeader B2B";

        "ActualValue(Text)2": Code[20];
        "ActualValue(Text)3": Code[20];
        "ActualValue(Text)4": Code[20];
        "ActualValue(Text)5": Code[20];
        "Property Name": Code[20];
        Companyinfo: Record "Company Information";
        Text0001: Label 'QAR NO';
        Text0002: Label 'QAR DATE';
        Text0003: Label 'DATE OF RECEIPT';
        Text0004: Label 'LOT NO';
        Text0005: Label 'PRODUCT';
        Text0006: Label 'SUPPLIER';
        Text0007: label 'SUPPLIER REF NO';
        Text0008: label 'RECEIVED QTY';



}