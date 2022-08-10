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
            column(PostedDataSheetHdr6; PostedDataSheetHdr."Vendor No.")
            {

            }
            column(PostedDataSheetHdr7; PostedDataSheetHdr."Order No.")
            {

            }
            column(PostedDataSheetHdr8; PostedDataSheetHdr8."Receipt No.")
            {

            }
            column(Property_Name; "Property Name")
            {

            }
            column(Companyinfo; Companyinfo.Name)
            {

            }
            column(QARCAP; QARCAP)
            {

            }
            column(QARDATECAP; QARDATECAP)
            {

            }
            column(DATEOFRECPT; DATEOFRECPT)
            {

            }
            column(LOTNOCAP; LOTNOCAP)
            {

            }
            column(PRODUCTCAP; PRODUCTCAP)
            {

            }
            column(SUPPLIERCAP; SUPPLIERCAP)
            {

            }
            column(SUPPLIEREFCAP; SUPPLIEREFCAP)
            {

            }
            column(RECIEVEDCAP; RECIEVEDCAP)
            {

            }
            column(Lotno1; Lotno1)
            {

            }
            column(Lotno2; Lotno2)
            {

            }
            column(Lotno3; Lotno3)
            {

            }
            column(Lotno4; Lotno4)
            {

            }
            column(Lotno5; Lotno5)
            {

            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;

                spec: Record "Specification Line B2B";


            begin
                Clear(PostedDataSheet);
                Clear("ActualValue(Text)");
                Clear(Lotno1);
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then begin
                    "ActualValue(Text)" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";
                    Lotno1 := PostedDataSheetHdr."Lot No.";
                    PostedDataSheetHdr.Get(Vendor);
                end;

                Clear("ActualValue(Text)2");
                Clear(Lotno2);
                Clear(PostedDataSheet);
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr2."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then begin
                    "ActualValue(Text)2" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";
                    Lotno2 := PostedDataSheetHdr."Lot No.";
                end;

                Clear("ActualValue(Text)3");
                Clear(Lotno3);
                Clear(PostedDataSheet);
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr3."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then begin
                    "ActualValue(Text)3" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";
                    Lotno3 := PostedDataSheetHdr."Lot No.";
                end;

                Clear("ActualValue(Text)4");
                Clear(Lotno4);
                Clear(PostedDataSheet);
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr4."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then begin
                    "ActualValue(Text)4" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";
                    Lotno4 := PostedDataSheetHdr."Lot No.";
                end;

                Clear("ActualValue(Text)5");
                Clear(PostedDataSheet);
                Clear(Lotno5);
                PostedDataSheet.Reset();
                PostedDataSheet.SetRange("Document No.", PostedDataSheetHdr5."No.");
                PostedDataSheet.SetRange("Character Code", "Specification Line B2B"."Character Code");
                if PostedDataSheet.FindFirst() then begin
                    "ActualValue(Text)5" := format(PostedDataSheet."Actual Value (Num)") + PostedDataSheet."Actual  Value (Text)";
                    Lotno3 := PostedDataSheetHdr."Lot No.";
                end;

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
        PostedDataSheetHdr6: Record "Posted Ins DatasheetHeader B2B";
        PostedDataSheetHdr7: Record "Posted Ins DatasheetHeader B2B";
        PostedDataSheetHdr8: Record "Posted Ins DatasheetHeader B2B";


        "ActualValue(Text)2": Code[20];
        "ActualValue(Text)3": Code[20];
        "ActualValue(Text)4": Code[20];
        "ActualValue(Text)5": Code[20];
        "Property Name": Code[20];
        Companyinfo: Record "Company Information";
        QARCAP: Label 'QAR NO';
        QARDATECAP: Label 'QAR DATE';
        DATEOFRECPT: Label 'DATE OF RECEIPT';
        LOTNOCAP: Label 'LOT NO';
        PRODUCTCAP: Label 'PRODUCT';
        SUPPLIERCAP: Label 'SUPPLIER';
        SUPPLIEREFCAP: label 'SUPPLIER REF NO';
        RECIEVEDCAP: label 'RECEIVED QTY';
        Lotno1: Code[20];
        Lotno2: Code[20];
        Lotno3: Code[20];
        Lotno4: Code[20];
        Lotno5: Code[20];
        Vendor: Code[20];




}