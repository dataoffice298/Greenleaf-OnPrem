report 50001 "Sample Dispatch Letter"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SampleDispatchLetter.rdlc';
    Caption = 'Sample Dispatch Letter';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(NoCap; NoCap)
            {

            }
            column(NameCap; NameCap)
            { }
            column(ShipToCap; ShipToCap)
            {

            }
            column(SiCap; SiCap)
            {

            }
            column(ItemNameCap; ItemNameCap)
            {

            }
            column(SampleCodeCap; SampleCodeCap)
            {

            }
            column(QuantityCap; QuantityCap)
            {

            }
            column(RemarksCap; RemarksCap)
            {

            }
            column(Text000; Text000)
            {

            }
            column(Text001; Text001)
            {

            }

            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(Sell_to_County; "Sell-to County")
            {

            }
            column(Sell_to_Address; "Sell-to Address")
            {

            }
            column(Sell_to_Address_2; "Sell-to Address 2")
            {

            }
            column(Ship_to_Code; "Ship-to Code")
            {

            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                DataItemLinkReference = "Sales Header";
                column(SI1; SI1)
                {

                }
                trigger OnPreDataItem()
                begin
                    Clear(SI1);
                end;

                trigger OnAfterGetRecord()
                begin

                    SI1 := SI1 + 1;

                end;



            }




        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var
        myInt: Integer;
        SI1: Integer;
        NoCap: Label 'No:';
        NameCap: Label 'Name';
        ShipToCap: Label 'Ship To';
        SiCap: Label 'SI No';
        ItemNameCap: Label 'Item Name';
        SampleCodeCap: Label 'Sample Code';
        QuantityCap: Label 'Qty';
        RemarksCap: Label 'Remarks';
        SampleDispatchLetterCap: Label 'SAMPLE DESPATCH LETTER';
        Text000: Label 'Dear Sir';
        Text001: Label 'We hereby submit the following samples for your evaluation  and also look forward for your feedback.Please do get in touch with us in case you need any further action/clarification from our side';


}

