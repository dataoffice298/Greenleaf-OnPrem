report 50122 "Sample Invoice"
{
    // version B2B

    // 
    // .............................................
    //  Name           : PT SathishG
    //  Date           : 10-07-13
    //  Description    : Proforma Invoice
    // ..............................................
    DefaultLayout = RDLC;
    RDLCLayout = './SampleInvoice.rdl';
    UsageCategory = ReportsAndAnalysis;
    Caption = '50005- SampleInvoice';
    ApplicationArea = all;


    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            column(AdvPaymentDetails; AdvPaymentDetails)
            {
            }
            column(Head_Caption; Head_CaptionLbl)
            {
            }
            column(SupplyofGoodCaption; SupplyofGoodCaptionLbl)
            {
            }
            column(AggregatingCaption; AggregatingCaptionLbl)
            {
            }
            column(Exporter_cap; Exporter_cap)
            {
            }
            column(Vessel_FlightNo_Cap; Vessel_FlightNo_Cap)
            {
            }
            column(InvoiceNo_Date_Cap; InvoiceNo_Date_Cap)
            {
            }
            column(Exporters_Ref_Cap; Exporters_Ref_Cap)
            {
            }
            column(Consignee_Cap; Consignee_Cap)
            {
            }
            column(GSTNumber_Cap; GSTNumber_Cap)
            {
            }
            column(Pre_Carriage_by_Cap; Pre_Carriage_by_Cap)
            {
            }
            column(Place_Of_Receipt_by_Cap; Place_Of_Receipt_by_Cap)
            {
            }
            column(Port_Of_Loading_Cap; Port_Of_Loading_Cap)
            {
            }
            column(Port_Of_Discharge_Cap; Port_Of_Discharge_Cap)
            {
            }
            column(Final_Destination_Cap; Final_Destination_Cap)
            {
            }
            column(Country_Of_Origin_of_Goods_Cap; Country_Of_Origin_of_Goods_Cap)
            {
            }
            column(Country_of_Final_Destination_Cap; Country_of_Final_Destination_Cap)
            {
            }
            column(Terms_Of_Delivery_Cap; Terms_Of_Delivery_Cap)
            {
            }
            column(Terms_of_Payment_Cap; Terms_of_Payment_Cap)
            {
            }
            column(Marks_Nos_Container_No_Cap; Marks_Nos_Container_No_Cap)
            {
            }
            column(No_of_Pkgs_Cap; No_of_Pkgs_Cap)
            {
            }
            column(Description_Of_Goods_Cap; Description_Of_Goods_Cap)
            {
            }
            column(Quantity_Cap; Quantity_Cap)
            {
            }
            column(Rate_Cap; Rate_Cap)
            {
            }
            column(Amount_Cap; Amount_Cap)
            {
            }
            column(Amount_in_words_Cap; Amount_in_words_Cap)
            {
            }
            column(Total_Amt_Cap; Total_Amt_Cap)
            {
            }
            column(ProvisionalIDNo_Cap; ProvisionalIDNo_Cap)
            {
            }
            column(withoutpaymentCaption; withoutpaymentCaptionLbl)
            {
            }
            column(Heading2Text; Heading2Text)
            {
            }
            column(ShowSezDes; ShowSezDes)
            {
            }
            column(IRNNoCaption; IRNNoCaptionLVar)
            {
            }
            column(PaymentTermsCaption; PaymentTermsCaptionLbl)
            {
            }
            column(RateCaption; RateCaption)
            {
            }
            column(AmtPerCaption; AmtPerCaption)
            {
            }
            column(TotalAmtGVarCaption; TotalAmtGVar)
            {
            }
            column(ShowHeadCap; ShowHeadCap)
            {
            }
            column(Footer01_CapLb01; Footer01_CapLb01)
            {
            }
            column(Footer02_CapLb02; Footer02_CapLb02)
            {
            }
            column(Footer03_CapLb03; Footer03_CapLb03)
            {
            }
            column(Footer04_CapLb04; Footer04_CapLb04)
            {
            }
            column(Label1_Cap01; Label1_Cap01)
            {
            }
            column(Label2_Cap02; Label2_Cap02)
            {
            }
            column(Lable3_Cap03; Lable3_Cap03)
            {
            }
            column(Lable4_Cap04; Lable4_Cap04)
            {
            }
            column(Sell_to_County; "Sell-to County")
            {

            }
            column(Bill_to_County; "Bill-to County")
            {

            }
            column(Transport_Method; "Transport Method")
            {

            }
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }
            column(Work_Description; "Work Description")
            {

            }


            /* column(EnvoiceEntry_IRNNo; EnvoiceEntry."IRN No.")
             {
             }
             column(EnvoiceEntry_QRCode; EnvoiceEntry."QR Code")
             {
             }*/
            column(PaymentTermsCode_SalesInvoiceHeader; PaymentTerms2.Description)
            {
            }
            column(CurrencyCode_SalesInvoiceHeader; "Sales Invoice Header"."Currency Code")
            {
            }
            /*column(GST_Customer_Type; "GST Customer Type")
            {
            }*/
            column(InvNo; "No.")
            {
            }
            column(InvPostingDate; "Posting Date")
            {
            }
            column(InvExtDocNo; "External Document No.")
            {
            }
            column(InvDocDate; "Order Date")
            {
            }
            /*  column(CustPONo; "Customer PO No.")
              {
              }*/
            column(CustName; CustName)
            {
            }
            column(CustAddress; CustAddress)
            {
            }
            column(CustAddress2; CustAddress2)
            {
            }
            column(CustCity; CustCity)
            {
            }
            column(CustPostCode; CustPostCode)
            {
            }
            column(CusPhNo; CusPhNo)
            {
            }

            column(CustVAT; CustVAT)
            {
            }
            column(CustCST; CustCST)
            {
            }
            column(CustPAN; CustPAN)
            {
            }
            column(CustSTC; CustSTC)
            {
            }
            /*  column(CompName; CompInfo."Div1 Name")
              {
              }
              column(CompName2; CompInfo."Div1 Name 2")
              {
              }
              column(CompName3; CompInfo."Div1 Name 3")
              {
              }
              column(CompAddress; CompInfo."Div1 Address")
              {
              }
              column(CompAddress2; CompInfo."Div1 Address 2")
              {
              }
              column(CompCity; CompInfo."Div1 City")
              {
              }
              column(CompPostCode; CompInfo."Div1 Post Code")
              {
              }*/
            column(CompInfo; CompInfo.Picture)
            {
            }
            /* column(CompVAT; CompInfo."Div1 VAT Registration No.")
             {
             }
             column(CompCST; CompInfo."Div1 C.S.T No.")
             {
             }
             column(CompPAN; CompInfo."Div1 P.A.N. No.")
             {
             }
             column(CompSTC; CompInfo."Div1 Service Tax Reg. No.")
             {
             }
             column(CINNO; CompInfo."Div1 CIN No.")
             {
             }
             column(CompServCategory; CompInfo."Div1 Service Category")
             {
             }
             column(BeneficiaryName; CompInfo."Div1 Beneficiary Name")
             {
             }
             column(AccountNo; CompInfo."Div1 Account No.")
             {
             }
             column(BeneficiaryBank; CompInfo."Div1 Beneficiary Bank")
             {
             }
             column(BeneficiaryBranch; CompInfo."Div1 Beneficiary Branch")
             {
             }
             column(AccountType; CompInfo."Div1 Account Type")
             {
             }
             column(IFSCCode; CompInfo."Div1 IFSC Code")
             {
             }
             column(CompInfo_ForeignBeneficiaryName; CompInfo."Foreign Beneficiary Name")
             {
             }
             column(CompInfo_ForeignACCOUNTNo; CompInfo."Foreign ACCOUNT No.")
             {
             }
             column(CompInfo_ForeignBeneficiaryBank; CompInfo."Foreign Beneficiary  Bank")
             {
             }
             column(CompInfo_ForeignBeneficiaryBranch; CompInfo."Foreign Beneficiary Branch")
             {
             }
             column(CompInfo_ForeignSWIFTCODE; CompInfo."Foreign SWIFT CODE")
             {
             }
             column(CompInfo_ForeignROUTINGWITH; CompInfo."Foreign ROUTING WITH")
             {
             }
             column(CompInfo_ForeignACCOUNTNo2; CompInfo."Foreign ACCOUNT No2.")
             {
             }
             column(CompInfo_ForeignSWIFTCODE2; CompInfo."Foreign SWIFT CODE2")
             {
             }
             column(CompInfo_AuthorisedSignature; CompInfo."Authorised Signature")
             {
             }
             column(CompInfo_CIN_No; 'CIN - ' + CompInfo."CIN No.")
             {
             }*/
            /*column(CompInfo_GST_Registration_No; 'GST No. ' + CompInfo."GST Registration No.")
            {
            }*/
            column(Customer_GST_Reg__No_; "Customer GST Reg. No.")
            { }
            column(Vehicle_No_; "Vehicle No.")
            { }
            column(State; State)
            { }
            column(ServTaxPer; ServTaxPer)
            {
            }
            column(ServTaxEcess; SerTaxEcessPer)
            {
            }
            column(ServTaxSheCess; SerTaxSheCessPer)
            {
            }
            column(SBCessPer; SBCessPer)
            {
            }
            column(NewSerTaxPer; NewSerTaxPer)
            {
            }
            column(TaxType; TaxType)
            {
            }
            column(TaxPercent; TaxPercent)
            {
            }
            column(PaymentTerms; PaymentTrms)
            {
            }
            column(CustTaxLiable; CustTaxLiable)
            {
            }
            column(SEZRemarks1; SEZRemarks1)
            {
            }
            column(SEZRemarks2; SEZRemarks2)
            {
            }
            column(Grandtotal1; GrandTotal1)
            {
            }
            column(GrandTotalUSD; GrandTotalUSD)
            {
            }
            column(Linetotal1; Linetotal1)
            {
            }
            column(Linetotal1USD; Linetotal1USD)
            {
            }
            column(Footer1_Caption; Footer1_1_CaptionLbl)
            {
            }
            column(Footer2_Caption; Footer2_1_CaptionLbl)
            {
            }
            column(Footer3_Caption; Footer3_1_CaptionLbl)
            {
            }
            column(Footer4_Caption; Footer4_1_CaptionLbl)
            {
            }
            column(Footer5_1_CaptionLbl; Footer5_1_CaptionLbl)
            {

            }
            column(Footer5_Caption; Footer5_CaptionLbl)
            {
            }
            column(Footer6_Caption; Footer6_CaptionLbl)
            {
            }
            column(GSTComponentCode1; 'Tax payment details' + '               ' + GSTComponentCode[1] + ' @ ' + FORMAT(GstPerGVar) + '%')
            {
            }
            column(GSTComponentCode2; GSTComponentCode[2] + ' @ ' + FORMAT(GstPerGVar) + '%')
            {
            }
            column(GSTComponentCode3; GSTComponentCode[3] + ' @ ' + FORMAT(GstPerGVar) + '%')
            {
            }
            column(GSTComponentCode4; GSTComponentCode[4] + ' @ ' + FORMAT(GstPerGVar) + '%')
            {
            }
            column(GSTCompAmount1; ABS(GSTCompAmount[1]))
            {
            }
            column(GSTCompAmount2; ABS(GSTCompAmount[2]))
            {
            }
            column(GSTCompAmount3; ABS(GSTCompAmount[3]))
            {
            }
            column(GSTCompAmount4; ABS(GSTCompAmount[4]))
            {
            }
            column(IsGSTApplicable; IsGSTApplicable)
            {
            }
            /*column(CustRec_GST_Registration_No; CustRec."GST Registration No.")
            {
            }*/
            /*column(CustRec_P_A_N_No; CustRec."P.A.N. No.")
            {
            }*/
            /* column(CustRecGSTLUTNo; CustRec."GST LUT No.")
             {
             }
             column(CustRecGSTLUTCertDate; CustRec."GST LUT Cert Date")
             {
             }*/
            column(PaymentTerms_Description; PaymentTerms.Description)
            {
            }
            column(ShipAdderGRec_Name; SendAddress1)
            {
            }
            column(ShipAdderGRec_Address; SendAddress2)
            {
            }
            column(ShipAdderGRec_Addres_2; SendAddress3)
            {
            }
            column(ShipAdderGRec_City; SendAddress4)
            {
            }
            column(ShipAdderGRec_Post_Code; SendAddress5)
            {
            }
            column(ShipAdderGRec_Phone_No; SendAddress6)
            {
            }
            column(TotalGstGVar; TotalGstGVar)
            {
            }
            column(No_SalesHeader; "No.")
            {
            }
            column(State_Caption; State_CaptionLbl)
            {
            }
            column(Code_Caption; Code_CaptionLbl)
            {
            }
            /*column(GSTBilltoStateCode_SalesHeader; "GST Bill-to State Code")
            {
            }*/
            /* column(StateGRec_StateCodeGSTRegNo; StateGRec."State Code (GST Reg. No.)")
             {
             }*/

            column(ShowBankDetails; ShowBankDetails)
            {
            }
            dataitem("Copy loop"; 2000000026)
            {
                DataItemTableView = SORTING(Number);
                dataitem("page loop"; 2000000026)
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(Outputno; Outputno)
                    {
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.")
                                            ORDER(Ascending)
                                            WHERE(Quantity = FILTER(> 0));
                        column(DocumentNo_SalesLine; "Sales Invoice Line"."Document No.")
                        {
                        }
                        column(LineNo_SalesLine; "Line No.")
                        {
                        }
                        column(sno; sno)
                        {
                        }
                        column(Description; Description)
                        {
                        }
                        column(ShowExtDesc; ShowExtDesc)
                        {
                        }
                        // column(ExtendedDescription_SalesInvoiceLine; "Sales Invoice Line"."Extended Description")
                        // {
                        // }
                        column(Quantity; Quantity)
                        {
                        }
                        column(UnitPrice; "Unit Price")
                        {
                        }
                        column(UnitofMeasure; UOMUSDAmt)
                        {
                        }
                        column(PerUOM; PerUOM)
                        {
                        }
                        column(LineAmount; "Line Amount")
                        {
                        }
                        /*column(StartingDate_SalesLine; "Starting Date")
                        {
                        }
                        column(EndingDate_SalesLine; "Ending Date")
                        {
                        }*/
                        column(SalesType_SalesLine; SalTypeDes)
                        {
                        }


                        column(ServiceTaxTotal; ServiceTaxTotal)
                        {
                        }
                        column(SBCessTotal; SBCessTotal)
                        {
                        }
                        column(EshesTotal; EshesTotal)
                        {
                        }
                        column(SheshesTotal; SheshesTotal)
                        {
                        }
                        column(TaxTotal; TaxTotal)
                        {
                        }
                        column(TaxPer; TaxPer)
                        {
                        }
                        column(GrandTotal; GrandTotal)
                        {
                        }
                        column(LineTotal; LineTotal)
                        {
                        }
                        column(NumToText; NumToText[1])
                        {
                        }
                        column(IGSSTAmt; IGSSTAmt)
                        {

                        }
                        column(CGSTAmt; CGSTAmt)
                        {

                        }
                        column(SGSTAmt; SGSTAmt)
                        {

                        }
                        column(IGSTPer; IGSTPer)
                        {

                        }
                        column(SGSTPer; SGSTPer)
                        {

                        }
                        column(CGSTPer; CGSTPer)
                        {

                        }
                        column(periodboolean; periodboolean)
                        {
                        }
                        column(Lindiscount; lindiscountamt)
                        {
                        }
                        column(Lisdisamount; lindismat)
                        {
                        }
                        column(dispercentage; "Line Discount %")
                        {
                        }
                        column(netvaramt; netamtvar)
                        {
                        }
                        column(netamtvar1; netamtvar1)
                        {
                        }
                        /*column(HSNSACCode_SalesLine; "HSN/SAC Code")
                        {
                        }*/
                        column(QtyGVar; QtyGVar)
                        {
                        }
                        column(Rate; Rate)
                        {
                        }
                        column(AmountGVar; AmountGVar)
                        {
                        }
                        column(USDClauseGVar; USDClauseGVar)
                        {
                        }
                        column(IGSTRate; IGSTRate)
                        { }
                        column(CGSTRate; CGSTRate)
                        { }
                        column(SGSTRate; SGSTRate)
                        { }
                        column(SEZGSTPer; SEZGSTPer)
                        {
                        }
                        column(SEZGSTAmnt; SEZGSTAmnt)
                        {
                        }

                        trigger OnAfterGetRecord();
                        var
                        //  TaxTransactionValue: Record "Tax Transaction Value";
                        //  GSTSetup: Record "GST Setup";
                        begin

                            if "Sales Invoice Line"."no." = 'FC830980' then //BUGFIX
                                CurrReport.skip;//BUGFIX  //  Rounding line skipped.
                                                //B2B1.0JM>>
                                                /* IF ("Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account") THEN BEGIN
                                                     DefferedOrderSetupGRec.RESET;
                                                     DefferedOrderSetupGRec.SETRANGE("Sale Type", "Sales Invoice Line"."Sales Type");
                                                     IF DefferedOrderSetupGRec.FINDFIRST THEN BEGIN
                                                         IF ((DefferedOrderSetupGRec."Sales Account" = "Sales Invoice Line"."No.") OR (DefferedOrderSetupGRec."Revenue Account Sales" = "Sales Invoice Line"."No.") OR
                                                          (DefferedOrderSetupGRec."Deffered Account Sales" = "Sales Invoice Line"."No.") OR (DefferedOrderSetupGRec."Revenue Account Maintenance" = "Sales Invoice Line"."No.") OR
                                                          (DefferedOrderSetupGRec."Deffered Account Maintenance" = "Sales Invoice Line"."No.")) THEN
                                                             CurrReport.SKIP;
                                                     END ELSE
                                                         CurrReport.SKIP;
                                                 END;*/
                                                //B2B1.0JM<<

                            IF "Sales Invoice Line".Quantity <> 0 THEN
                                sno += 1;
                            SlNo += 1;
                            CLEAR(lindiscountamt);
                            CLEAR(lindismat);
                            CLEAR(periodboolean);
                            CLEAR(netamtvar);
                            CLEAR(QtyGVar);
                            CLEAR(Rate);
                            CLEAR(AmountGVar);
                            clear(SEZGSTAmnt);//BUGFIX

                            clear(SEZGSTPer);//BUGFIX

                            // LICENSE1.0 >>





                            CLEAR(ShowExtDesc);
                            // IF "Sales Invoice Line"."Extended Description" <> '' THEN
                            //     ShowExtDesc := TRUE;

                            CLEAR(SalTypeDes);
                            // IF (Type = Type::Item) AND ("Sales Invoice Line"."No." <> 'USD CLAUSE') THEN
                            //     SalTypeDes := "Sales Invoice Line"."Sales Type";

                            SalesInvHeader.GET("Document No.");
                            // SalesInvHeader.Reset();
                            // SalesInvHeader."Partial Billing" := true;
                            /* IF NOT SalesInvHeader."Partial Billing" THEN BEGIN
                                 //IF  (Type = Type::Item)  THEN
                                 QtyGVar := Quantity;
                                 Rate := "Unit Price";
                             END ELSE BEGIN
                                 QtyGVar := "Sales Invoice Line"."Partial Billing Quantity";

                                 IF ("Sales Invoice Line".Quantity <> 0) AND ("Partial Billing Quantity" <> 0) THEN
                                     Rate := ("Sales Invoice Line".Quantity / "Sales Invoice Line"."Partial Billing Quantity") * "Sales Invoice Line"."Unit Price";
                             END;*/


                            IF (SlNo >= vtemp) AND (SlNo <= vtemp1) THEN BEGIN
                                salesInvline1.RESET;
                                salesInvline1.SETRANGE("Document No.", "Document No.");
                                salesInvline1.SETRANGE("Line No.", "Line No.");
                                IF salesInvline1.FINDFIRST THEN;

                                /*DefferedOrderSetup.RESET;
                                DefferedOrderSetup.SETRANGE(DefferedOrderSetup."Sale Type", "Sales Type");
                                IF DefferedOrderSetup.FINDFIRST THEN
                                    IF DefferedOrderSetup."Print Period" = TRUE THEN
                                        periodboolean := TRUE
                                    ELSE
                                        periodboolean := FALSE;*/

                                lindismat := -(ROUND("Line Discount Amount", 1));

                                // IF "Partial Billing Quantity" <> 0 THEN
                                //     lindiscountamt := -("Line Discount Amount" / "Partial Billing Quantity")
                                // ELSE
                                //     lindiscountamt := -("Line Discount Amount");

                                // lindismat := - ( ROUND("Sales Line"."Line Discount Amount",0.001));
                                //12-DEC
                                /*   IF SalesInvHeader."Partial Billing" THEN BEGIN
                                       IF "Sales Invoice Header"."Currency Code" <> '' THEN
                                           netamtvar := (QtyGVar * Rate) * ExchRate1
                                       ELSE
                                           netamtvar := (QtyGVar * Rate);
                                   END ELSE BEGIN
                                       IF "Sales Invoice Header"."Currency Code" <> '' THEN
                                           netamtvar := ROUND((QtyGVar) * ("Unit Price"), 1) * ExchRate1
                                       ELSE
                                           netamtvar := ROUND((QtyGVar) * ("Unit Price"), 1);
                                   END;*/

                                netamtvar1 += ROUND(netamtvar, 1);

                                IF i = cnt THEN BEGIN
                                    boolcheck := TRUE;
                                END ELSE BEGIN
                                    boolcheck := FALSE;
                                END;

                                /* IF SalesInvHeader."Partial Billing" THEN
                                     netamtvar2 := (QtyGVar * Rate)
                                 ELSE
                                     netamtvar2 := ROUND((QtyGVar) * ("Unit Price"), 1);*/

                                CLEAR(PerUOM);
                                IF "Sales Invoice Header"."Currency Code" <> '' THEN BEGIN
                                    UOMUSDAmt := netamtvar2;
                                    UOMUSDAmtTot += UOMUSDAmt;
                                END ELSE
                                    PerUOM := "Sales Invoice Line"."Unit of Measure Code";


                            END ELSE BEGIN
                                CurrReport.SKIP;
                            END;
                            // LICENSE1.0 <<
                            // GSTSetup.get();
                            //GetGSTAmounts(TaxTransactionValue, "Sales Invoice Line", GSTSetup);
                            // GetGSTAmount("Sales Invoice Header", "Sales Invoice Line");
                            GetGSTbaseAmount("Sales Invoice Header", "Sales Invoice Line");//BUGFIX

                            GetTDSAmt("Sales Invoice Header", "Sales Invoice Line");
                            //TotalGstGVar += CGSTAmt + SGSTAmt + IGSSTAmt;
                            // CGSTRate := (CGSTAmt / "Sales Invoice Line".Quantity) * QtyGVar; //BUGFIX
                            CGSTRate := CGSTAmt; //BUGFIX
                                                 //  Message('%1,%2,%3', CGSTAmt, "Sales Line".Quantity, QtyGVar);
                                                 //SGSTRate := (SGSTAmt / "Sales Invoice Line".Quantity) * QtyGVar;//BUGFIX
                            SGSTRate := SGSTAmt;//BUGFIX
                            //IGSTRate := (IGSSTAmt / "Sales Invoice Line".Quantity) * QtyGVar;//BUGFIX
                            IGSTRate := IGSSTAmt;//BUGFIX
                            //B2BUPG1.0>>
                            if "Sales Invoice Header"."Currency Code" <> '' then begin
                                CGSTRate := CGSTRate * ExchRate1;
                                SGSTRate := SGSTRate * ExchRate1;
                                IGSTRate := IGSTRate * ExchRate1;
                            end;
                            TotalGstGVar := CGSTRate + SGSTRate + IGSTRate;
                            //B2BUPG1.0<<
                            GrandTotal := Round(LineTotal + CGSTRate + SGSTRate + IGSTRate, 1);
                            //ChckReport.InitTextVariable();
                            //ChckReport.FormatNoText(NumToText, GrandTotal, "Sales Invoice Header"."Currency Code");
                            //10DEC 2019 <<

                            /* IF "Sales Invoice Header"."Currency Code" <> '' THEN BEGIN
                                 GrandTotal := UOMUSDAmtTot + ROUND((ServiceTaxTotal + EshesTotal + SheshesTotal), 1) + TaxTotal + SBCessTotal + ABS(GSTCompAmount[1]) + ABS(GSTCompAmount[2]) + ABS(GSTCompAmount[3]) + ABS(GSTCompAmount[4]); //B2BGST1.0
                                 GrandTotalUSD := ROUND(GrandTotal, 1);
                                 Chck.InitTextVariable;
                                 Chck.FormatNoText(NumToText, ROUND(GrandTotal, 1), "Sales Invoice Header"."Currency Code");
                             END;*/


                            IF "Sales Invoice Line"."No." = 'USD CLAUSE' THEN
                                USDClauseGVar := FALSE
                            ELSE
                                USDClauseGVar := TRUE;

                        end;

                        trigger OnPreDataItem();
                        begin
                            sno := 0;
                            SlNo := 0;

                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    IF Number > 1 THEN BEGIN
                        Outputno += 1;
                    END;

                    i += 1;
                    IF Number = 1 THEN BEGIN
                        vtemp := 1;
                        vtemp1 := 5;
                        //vtemp1 :10;
                    END ELSE BEGIN
                        vtemp := vtemp1 + 1;
                        vtemp1 += 5;
                        // vtemp1 +=10;
                    END;
                end;

                trigger OnPreDataItem();
                begin

                    SETRANGE(Number, 1, cnt);
                    Outputno := 1;
                    i := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //  IsGSTApplicable := GSTManagement.IsGSTApplicable(Structure);//B2BGST1.0
                CustRec.RESET;
                CustRec.SETRANGE(CustRec."No.", "Sell-to Customer No.");
                IF CustRec.FINDFIRST THEN BEGIN
                    CustName := CustRec.Name;
                    CustAddress := CustRec.Address;
                    CustAddress2 := CustRec."Address 2";
                    CustCity := CustRec.City;
                    CustPostCode := CustRec."Post Code";
                    CusPhNo := CustRec.Contact;
                    //CustVAT := CustRec."T.I.N. No.";
                    //  CustCST := CustRec."C.S.T. No.";
                    //  CustPAN := CustRec."P.A.N. No.";
                    CustTaxLiable := CustRec."Tax Liable";
                    //  SEZRemarks1 := CustRec."SEZ Remarks 1";
                    //SEZRemarks2 := CustRec."SEZ Remarks 2";
                    //CustSTC:=
                END;

                CustRec1.Reset;
                CustRec1.SetRange(CustRec1."No.", "Bill-to Customer No.");
                If CustRec1.FindFirst() then;


                /*     IRNNoCaptionLVar := '';
                     IF EnvoiceEntry.GET(EnvoiceEntry."Document Type"::"Sales Invoice", "Sales Invoice Header"."No.") THEN BEGIN
                         EnvoiceEntry.CALCFIELDS("QR Code");
                         IF EnvoiceEntry."IRN No." <> '' THEN
                             IRNNoCaptionLVar := 'IRN No.';
                     END;*/

                CLEAR(Heading2Text);
                CLEAR(ShowSezDes);
                /* IF "Sales Invoice Header".Structure = 'EXPORT-LUT' THEN
                   Heading2Text := Text001
                 ELSE IF "Sales Invoice Header".Structure = 'SEZ' THEN BEGIN
                   Heading2Text := Text002;
                   ShowSezDes := TRUE;
                 END ELSE IF "Sales Invoice Header".Structure = 'SALES RCM' THEN
                     Heading2Text := Text003
                 ELSE
                     Heading2Text := '';*/
                //B2BUPG1.0>>
                /*  IF "Sales Invoice Header"."GST Customer Type" = "Sales Invoice Header"."GST Customer Type"::"SEZ Unit" THEN BEGIN
                      Heading2Text := Text002;
                      ShowSezDes := TRUE;
                  end;*/
                //B2BUPG1.0<<

                CLEAR(ShowBankDetails);
                CLEAR(RateCaption);
                CLEAR(AmtPerCaption);
                clear(ItemLinesExist);
                IF "Sales Invoice Header"."Currency Code" <> '' THEN BEGIN
                    ShowBankDetails := TRUE;
                    RateCaption := 'Rate in USD';
                    AmtPerCaption := 'Amount in USD';
                    TotalAmtGVar := 'Total Amount  (INR)'
                END ELSE BEGIN
                    RateCaption := 'Rate';
                    AmtPerCaption := 'Per';
                    TotalAmtGVar := 'Amount  (INR)';
                END;

                IF "Sales Invoice Header"."Currency Factor" > 0 THEN
                    ExchRate1 := (1 / "Sales Invoice Header"."Currency Factor");

                SalesInvLine2.RESET;
                SalesInvLine2.SETRANGE("Document No.", "No.");
                //SalesInvLine2.SETFILTER("Service Tax Group", '<>%1', '');
                /* IF SalesInvLine2.FINDFIRST THEN BEGIN
                   ServTaxSetup.RESET;
                   ServTaxSetup.SETRANGE(ServTaxSetup.Code,SalesInvLine2."Service Tax Group");
                   ServTaxSetup.SETFILTER(ServTaxSetup."From Date",'<=%1',"Posting Date");
                   IF ServTaxSetup.FINDLAST THEN BEGIN
                     ServTaxPer:=ServTaxSetup."Service Tax %";
                     IF ServTaxSetup."SB Cess %" <>0 THEN BEGIN
                       SBCessPer:=ServTaxSetup."SB Cess %";////
                       NewSerTaxPer:=ServTaxPer-SBCessPer;////
                     END ELSE
                       NewSerTaxPer:=ServTaxPer;////
                     SerTaxEcessPer:=ServTaxSetup."eCess %";
                     SerTaxSheCessPer:=ServTaxSetup."SHE Cess %";
                   END;
                 END;*/
                //new bock
                //BUGFIX>>
                /* if "Sales Invoice Header"."Deffered Order" then begin
                     SalesInvLine.RESET;
                     SalesInvLine.SETRANGE(SalesInvLine."Document No.", "No.");
                     SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
                     if SalesInvLine.findfirst then
                         ItemLinesExist := true;
                 end;*/
                //BUGFIX<<

                linecount := 0;
                SalesInvLine.RESET;
                SalesInvLine.SETRANGE(SalesInvLine."Document No.", "No.");
                /*if ("Sales Invoice Header"."Deffered Order") and (ItemLinesExist) then
                    SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
                SalesInvLine.setfilter("No.", '<>%1', 'FC830980'); // Rounding account not considered
                IF SalesInvLine.FINDFIRST THEN
                    REPEAT
                        //LICENSE1.0 >>
                        IF "Sales Invoice Header"."Currency Code" = '' THEN BEGIN
                            Linetotal1 += ROUND(SalesInvLine."Line Amount", 1);
                            LineTotal += ROUND(SalesInvLine."Line Amount", 1);
                        END ELSE BEGIN
                            Linetotal1 += ROUND(SalesInvLine."Line Amount", 1) * ExchRate1;
                            LineTotal += ROUND(SalesInvLine."Line Amount", 1) * ExchRate1;
                        END;*/

                // Linetotal1 += ROUND(((SalesLine."Line Amount" * SalesLine."Qty. to Ship")/SalesLine.Quantity),1);  //jm
                //LineTotal +=  ((SalesLine."Line Amount" * SalesLine."Qty. to Ship")/SalesLine.Quantity); //jm

                //LICENSE1.0 <<
                // SerTaxBaseAmt += ROUND(SalesInvLine."Service Tax Base",1);////
                // ServiceTaxTotal += ROUND(SalesInvLine."Service Tax Amount", 1);
                // EshesTotal += ROUND(SalesInvLine."Service Tax eCess Amount", 1);
                // SheshesTotal += ROUND(SalesInvLine."Service Tax SHE Cess Amount", 1);
                ////
                //IF SBCessPer <> 0 THEN
                //  SBCessTotal += ROUND((Linetotal1*(SBCessPer)/100),1);
                //IF SBCessTotal <>0 THEN
                //ServiceTaxTotal -= SBCessTotal;
                //ERROR('%1 - %2 - %3',ServiceTaxTotal,SBCessTotal,SBCessPer);
                ////

                // TaxAmt += ROUND(SalesInvLine."Tax Amount",1);
                //CustSTC:=SalesLine."Service Tax Group";
                linecount += 1;
                //TaxPer:=salesline;

                //UNTIL SalesInvLine.NEXT = 0;

                TaxTotal := ROUND(TaxAmt, 1);

                PaymentTerms.RESET;
                PaymentTerms.SETRANGE(PaymentTerms.Code, "Payment Terms Code");
                IF PaymentTerms.FINDFIRST THEN
                    PaymentTrms := PaymentTerms.Description;
                /*
                SalesLine2.RESET;
                SalesLine2.SETRANGE(SalesLine2."Document No.","Sales Header"."No.");
                SalesLine2.SETRANGE(SalesLine2."Document Type","Sales Header"."Document Type");
                SalesLine2.SETFILTER(SalesLine2."Service Tax Group",'<>%1','');
                IF SalesLine2.FINDFIRST THEN BEGIN
                  ServTaxSetup.RESET;
                  ServTaxSetup.SETRANGE(ServTaxSetup.Code,SalesLine2."Service Tax Group");
                  ServTaxSetup.SETFILTER(ServTaxSetup."From Date",'<=%1',"Sales Header"."Posting Date");
                  IF ServTaxSetup.FINDLAST THEN BEGIN
                    ServTaxPer:=ServTaxSetup."Service Tax %";
                    IF ServTaxSetup."SB Cess %" <>0 THEN BEGIN
                      SBCessPer:=ServTaxSetup."SB Cess %";////
                      NewSerTaxPer:=ServTaxPer-SBCessPer;////
                    END;
                    SerTaxEcessPer:=ServTaxSetup."eCess %";
                    SerTaxSheCessPer:=ServTaxSetup."SHE Cess %";
                  END;
                END;
                */

                SalesInvLine2.RESET;
                SalesInvLine2.SETRANGE(SalesInvLine2."Document No.", "No.");
                //SalesLine2.SETRANGE(SalesLine2."Document Type","Document Type");
                //SalesInvLine2.SETFILTER(SalesInvLine2."Tax %",'<>%1',0);
                SalesInvLine2.SETFILTER(SalesInvLine2."Tax Area Code", '<>%1', '');
                IF SalesInvLine2.FINDFIRST THEN BEGIN
                    // TaxPercent:=SalesInvLine2."Tax %";
                    TaxArea.RESET;
                    TaxArea.SETRANGE(TaxArea.Code, SalesInvLine2."Tax Area Code");
                    IF TaxArea.FINDFIRST THEN BEGIN
                        TaxAreaLine.RESET;
                        TaxAreaLine.SETRANGE(TaxAreaLine."Tax Area", TaxArea.Code);
                        IF TaxAreaLine.FINDFIRST THEN BEGIN
                            TaxJurisdiction.RESET;
                            TaxJurisdiction.SETRANGE(TaxJurisdiction.Code, TaxAreaLine."Tax Jurisdiction Code");
                            /* IF TaxJurisdiction.FINDFIRST THEN
                                TaxType:=FORMAT(TaxJurisdiction."Tax Type");*/
                        END;
                    END;
                END;

                ////
                IF SBCessPer <> 0 THEN
                    SBCessTotal += ROUND((SerTaxBaseAmt * (SBCessPer / 100)), 1);
                IF SBCessTotal <> 0 THEN
                    ServiceTaxTotal -= SBCessTotal;

                IF PaymentTermsGRec.GET("Payment Terms Code") THEN;


                IF ShipAdderGRec.GET("Bill-to Customer No.", "Ship-to Code") THEN BEGIN
                    SendAddress1 := ShipAdderGRec.Name;
                    SendAddress2 := ShipAdderGRec.Address;
                    SendAddress3 := ShipAdderGRec."Address 2";
                    SendAddress4 := ShipAdderGRec.City;
                    SendAddress5 := ShipAdderGRec."Post Code";
                    SendAddress6 := ShipAdderGRec."Phone No.";
                END ELSE BEGIN
                    SendAddress1 := CustRec.Name;
                    SendAddress2 := CustRec.Address;
                    SendAddress3 := CustRec."Address 2";
                    SendAddress4 := CustRec.City;
                    SendAddress5 := CustRec."Post Code";
                    SendAddress6 := CustRec."Phone No."
                END;

                //B2BGST1.0 Start >>
                SalesInvLineGRec.RESET;
                SalesInvLineGRec.SETRANGE("Document No.", "No.");
                //SalesInvLineGRec.SETRANGE(Type,SalesInvLineGRec.Type::Item);
                IF SalesInvLineGRec.FINDFIRST THEN;
                IF IsGSTApplicable AND (SalesInvLineGRec.Type <> SalesInvLineGRec.Type::" ") THEN BEGIN
                    j := 1;
                    /* GSTComponent.RESET;
                     GSTComponent.SETRANGE("GST Jurisdiction Type",SalesInvLineGRec."GST Jurisdiction Type");
                     IF GSTComponent.FINDSET THEN
                       REPEAT
                         GSTComponentCode[j] := GSTComponent.Code;
                         DetailedGSTEntryBuffer.RESET;
                         DetailedGSTEntryBuffer.SETCURRENTKEY(DetailedGSTEntryBuffer."Entry No.");
                         DetailedGSTEntryBuffer.SETRANGE("Transaction Type",DetailedGSTEntryBuffer."Transaction Type"::Sales);
                         DetailedGSTEntryBuffer.SETRANGE("Document No.","No.");
                         DetailedGSTEntryBuffer.SETRANGE("GST Component Code",GSTComponentCode[j]);
                         IF DetailedGSTEntryBuffer.FINDSET THEN BEGIN
                           REPEAT
                             IF "Sales Invoice Header"."Currency Code" = '' THEN
                               GSTCompAmount[j] +=  (DetailedGSTEntryBuffer."GST Amount")
                             ELSE BEGIN
                                CLEAR(ExchRate);
                                ExchRate :=(1/"Sales Invoice Header"."Currency Factor");
                               GSTCompAmount[j] +=  (DetailedGSTEntryBuffer."GST Amount")/ExchRate;
                             END;

                             GstPerGVar := DetailedGSTEntryBuffer."GST %";
                           UNTIL DetailedGSTEntryBuffer.NEXT = 0;
                           j += 1;
                         END;
                       UNTIL GSTComponent.NEXT = 0;*/
                END;

                CLEAR(TotalGstGVar);
                TotalGstGVar := ABS(GSTCompAmount[1]) + ABS(GSTCompAmount[2]) + ABS(GSTCompAmount[3]) + ABS(GSTCompAmount[4]);
                //B2BGST1.0 End <<



                GrandTotal := LineTotal + ROUND((ServiceTaxTotal + EshesTotal + SheshesTotal), 1) + TaxTotal + SBCessTotal + ABS(GSTCompAmount[1]) + ABS(GSTCompAmount[2]) + ABS(GSTCompAmount[3]) + ABS(GSTCompAmount[4]); //B2BGST1.0
                GrandTotal1 := ROUND(GrandTotal, 1);
                IF "Sales Invoice Header"."Currency Code" = '' THEN BEGIN
                    Chck.InitTextVariable;
                    Chck.FormatNoText(NumToText, ROUND(GrandTotal, 1), "Currency Code");
                END;

                cnt := 0;
                cnt2 := 0;
                cnt1 := 0;

                //cnt1 :=linecount / 10;  //jm
                cnt1 := linecount / 5;
                cnt2 := ROUND(cnt1, 1);

                IF cnt1 = cnt2 THEN BEGIN
                    cnt := cnt1;
                END ELSE
                    IF cnt1 > cnt2 THEN BEGIN
                        cnt := ROUND(cnt1, 1) + 1;
                    END ELSE BEGIN
                        cnt := ROUND(cnt1, 1);
                        ;
                    END;

                // IF StateGRec.GET("GST Bill-to State Code") THEN;


                CLEAR(SEZGSTPer);
                CLEAR(SEZGSTAmnt);



                /* IF (Structure = 'SEZ') AND ("GST Bill-to State Code" <> '') AND ("Location State Code"<>'') THEN BEGIN
                    SalesInvLine3.RESET;
                    SalesInvLine3.SETRANGE("Document No.","No.");
                    SalesInvLine3.SETFILTER("GST Group Code",'<>%1','');
                    SalesInvLine3.SETFILTER(SalesInvLine3.Quantity,'<>%1',0); //jm
                    IF SalesInvLine3.FINDFIRST THEN BEGIN
                    //REPEAT
                     IF "Location State Code" <> "GST Bill-to State Code" THEN BEGIN
                        GSTSetup.RESET;
                        GSTSetup.SETRANGE("GST State Code","GST Bill-to State Code");
                        GSTSetup.SETRANGE("GST Group Code",SalesInvLine3."GST Group Code");
                        GSTSetup.SETFILTER("GST Component",'=%1','IGST');
                        IF GSTSetup.FINDFIRST THEN BEGIN
                         SEZGSTPer := FORMAT(GSTSetup."GST Component %")+'%' ;
                         //SEZGSTAmnt += SalesInvLine3."Line Amount"*(GSTSetup."GST Component %"/100);
                         SEZGSTAmnt += Linetotal1 *(GSTSetup."GST Component %"/100);
                        END;
                     END ELSE BEGIN
                        GSTSetup.RESET;
                        GSTSetup.SETRANGE("GST State Code","GST Bill-to State Code");
                        GSTSetup.SETRANGE("GST Group Code",SalesInvLine3."GST Group Code");
                        GSTSetup.SETRANGE("GST Component",'<>%1','IGST');
                        IF GSTSetup.FINDSET THEN BEGIN
                         REPEAT
                           SEZGSTAmnt += GSTSetup."GST Component %"
                         UNTIL GSTSetup.NEXT=0;
                         SEZGSTPer := FORMAT(GSTSetup."GST Component %")+'%' ;
                         //SEZGSTAmnt +=(SalesInvLine3."Line Amount")*(SEZGSTAmnt/100);
                          SEZGSTAmnt +=(Linetotal1)*(SEZGSTAmnt/100);
                        END;
                     END;
                   //UNTIL SalesInvLine3.NEXT=0;
                   END;*/



                CLEAR(AdvPaymentDetails);
                CustLedgerEntry.RESET;
                CustLedgerEntry.SETRANGE(CustLedgerEntry."Document No.", "Sales Invoice Header"."No.");
                CustLedgerEntry.SETRANGE(CustLedgerEntry."Posting Date", "Sales Invoice Header"."Posting Date");
                IF CustLedgerEntry.FINDFIRST THEN BEGIN
                    CustLedgerEntry.CALCFIELDS(Amount);
                    CustLedgerEntry.CALCFIELDS("Remaining Amount");
                    AdvPaymentDetails := (CustLedgerEntry.Amount - CustLedgerEntry."Remaining Amount");
                END;

                //B2BJM1.0 >>
                IF PaymentTerms2.GET("Sales Invoice Header"."Payment Terms Code") THEN;

                //B2BJM1.0 <<

            end;

            trigger OnPostDataItem();
            begin
                //  ERROR('%1 - %2 - %3',SerTaxBaseAmt,Linetotal1,SBCessPer);//
                /*
                        IF SBCessPer <> 0 THEN
                        SBCessTotal += ROUND((SerTaxBaseAmt*(SBCessPer/100)),1);
                        IF SBCessTotal <>0 THEN
                        ServiceTaxTotal -= SBCessTotal;
                 */
                // ERROR('%1 - %2 - %3',SBCessTotal,ServiceTaxTotal);//

            end;

            trigger OnPreDataItem();
            begin
                CompInfo.GET;
                CompInfo.CALCFIELDS(CompInfo.Picture);
                // CompInfo.CALCFIELDS(CompInfo."Authorised Signature");

                CLEAR(LineTotal);
                CLEAR(ServiceTaxTotal);
                CLEAR(EshesTotal);
                CLEAR(SheshesTotal);
                CLEAR(TaxTotal);
                CLEAR(CustSTC);
                CLEAR(linecount);
                CLEAR(SerTaxEcessPer);
                CLEAR(SerTaxSheCessPer);
                CLEAR(ServTaxPer);
                CLEAR(SBCessPer);////
                CLEAR(NewSerTaxPer);////
                CLEAR(SBCessTotal);////
                CLEAR(TaxType);
                CLEAR(TaxPercent);
                CLEAR(CustTaxLiable);
                CLEAR(SEZRemarks1);
                CLEAR(SEZRemarks2);
                CLEAR(Linetotal1USD);
                CLEAR(UOMUSDAmtTot);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Option)
                {
                    field(ShowHeadCap; ShowHeadCap)
                    {
                        Caption = 'Show Header Caption';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            ShowHeadCap := TRUE;
        end;
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        //ERROR('1- %1 - %2 - %3',ServiceTaxTotal,SBCessTotal,SBCessPer,ServTaxSetup.Code);
    end;

    /*procedure GetGSTRoundingPrecision(ComponentName: Code[30]): Decimal
    var
        TaxComponent: Record "Tax Component";
        GSTSetup: Record "GST Setup";
        GSTRoundingPrecision: Decimal;
    begin
        if not GSTSetup.Get() then
            exit;
        GSTSetup.TestField("GST Tax Type");

        TaxComponent.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxComponent.SetRange(Name, ComponentName);
        TaxComponent.FindFirst();
        if TaxComponent."Rounding Precision" <> 0 then
            GSTRoundingPrecision := TaxComponent."Rounding Precision"
        else
            GSTRoundingPrecision := 1;
        exit(GSTRoundingPrecision);
    end;*/

    /*local procedure GetGSTAmount(SalesIvHeader: Record "Sales Invoice Header";
    SalesInvLine: Record "Sales Invoice Line")
    var
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
    begin
        Clear(IGSSTAmt);
        Clear(IGSTPer);
        Clear(SGSTPer);
        Clear(CGSTPer);
        Clear(CGSTAmt);
        Clear(SGSTAmt);
        Clear(CessAmt);
        DetailedGSTLedgerEntry.Reset();
        DetailedGSTLedgerEntry.SetRange("Document No.", SalesInvLine."Document No.");
        DetailedGSTLedgerEntry.SetRange("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                if (DetailedGSTLedgerEntry."GST Component Code" = CGSTLbl) And (SalesIvHeader."Currency Code" <> '') then begin
                    CGSTAmt += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesIvHeader."Currency Factor"), GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"));
                    CGSTPer := DetailedGSTLedgerEntry."GST %";
                end else
                    if (DetailedGSTLedgerEntry."GST Component Code" = CGSTLbl) then begin
                        CGSTAmt += Abs(DetailedGSTLedgerEntry."GST Amount");
                        CGSTPer := DetailedGSTLedgerEntry."GST %";
                    end;
                if (DetailedGSTLedgerEntry."GST Component Code" = SGSTLbl) And (SalesIvHeader."Currency Code" <> '') then begin
                    SGSTAmt += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesIvHeader."Currency Factor"), GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"));
                    SGSTPer := DetailedGSTLedgerEntry."GST %";
                end else
                    if (DetailedGSTLedgerEntry."GST Component Code" = SGSTLbl) then begin
                        SGSTAmt += Abs(DetailedGSTLedgerEntry."GST Amount");
                        SGSTPer := DetailedGSTLedgerEntry."GST %";
                    end;
                if (DetailedGSTLedgerEntry."GST Component Code" = IGSTLbl) And (SalesIvHeader."Currency Code" <> '') then begin
                    IGSSTAmt += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesIvHeader."Currency Factor"), GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"));
                    IGSTPer := DetailedGSTLedgerEntry."GST %";
                end else
                    if (DetailedGSTLedgerEntry."GST Component Code" = IGSTLbl) then begin
                        IGSSTAmt += Abs(DetailedGSTLedgerEntry."GST Amount");
                        IGSTPer := DetailedGSTLedgerEntry."GST %";
                        // message('%1', IGSTPer);
                    end;
                if (DetailedGSTLedgerEntry."GST Component Code" = CessLbl) And (SalesIvHeader."Currency Code" <> '') then
                    CessAmt += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesIvHeader."Currency Factor"), GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"))
                else
                    if (DetailedGSTLedgerEntry."GST Component Code" = CessLbl) then
                        CessAmt += Abs(DetailedGSTLedgerEntry."GST Amount");
            until DetailedGSTLedgerEntry.Next() = 0;

    end;*/

    local procedure GetTDSAmt(SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line")
    var
    //  TDSEntry: Record "TDS Entry";
    begin
        /* Clear(TDSAmt);
         TDSEntry.Reset();
       //  TDSEntry.SetRange("Document No.", SalesInvLine."Document No.");
         if TDSEntry.FindSet() then
             repeat
                 if "Sales Invoice Header"."Currency Code" <> '' then
                     TDSAmt += (SalesInvHeader."Currency Factor" * TDSEntry."Total TDS Including SHE CESS")
                 else
                     TDSAmt += TDSEntry."Total TDS Including SHE CESS";
             until TDSEntry.Next() = 0;*/
    end;

    local procedure GetGSTBaseAmount(SalesIvHeader: Record "Sales Invoice Header";
    SalesInvLine: Record "Sales Invoice Line")
    var
        //     TaxTransactionValue: Record "Tax Transaction Value";
        GstRateVar: decimal;
    begin

        CLEAR(SEZGSTPer);
        CLEAR(SEZGSTAmnt);

        // TaxTransactionValue.Reset;
        // TaxTransactionValue.Setrange("Tax Record ID", SalesInvLine.RecordId);
        // TaxTransactionValue.Setrange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        // TaxTransactionValue.Setfilter("Value ID", '%1|%2|%3', 2, 3, 6);
        // TaxTransactionValue.setrange("Tax Type", 'GST');
        //if TaxTransactionValue.FindFirst() then
        //GstRateVar := TaxTransactionValue.Percent
        //else
        GstRateVar := 0;
        //DetailedGSTLedgerEntry.Reset();
        // DetailedGSTLedgerEntry.SetRange("Document No.", SalesInvLine."Document No.");
        // DetailedGSTLedgerEntry.SetRange("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");

        /* if DetailedGSTLedgerEntry.FindSet() then
             repeat
                 if (SalesIvHeader."Currency Code" <> '') then begin
                     if GstRateVar <> 0 then
                       //  SEZGSTAmnt += Round((Abs((DetailedGSTLedgerEntry."GST base Amount" * GstRateVar) / 100) * SalesIvHeader."Currency Factor"), GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"));
                     SEZGSTPer := Format(GstRateVar);
                 end else begin


                     if GstRateVar <> 0 then
                     //    SEZGSTAmnt += Round(Abs(DetailedGSTLedgerEntry."GST base Amount" * GstRateVar) / 100, GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"));
                     SEZGSTPer := Format(GstRateVar);
                 end;



             until DetailedGSTLedgerEntry.Next() = 0;*/

    end;



    var


        Exporter_cap: Label 'Exporter';
        Exporters_Ref_Cap: Label 'Exporters Ref.';
        Consignee_Cap: Label 'Consignee:';
        InvoiceNo_Date_Cap: Label 'Invoice No & Date';
        GSTNumber_Cap: Label 'GST Number';
        Pre_Carriage_by_Cap: Label 'Pre-Carriage by';
        Place_Of_Receipt_by_Cap: Label 'Place Of Receipt by';
        Vessel_FlightNo_Cap: Label 'Vessel/Flight No.';
        Port_Of_Loading_Cap: Label 'Port Of Loading';
        Port_Of_Discharge_Cap: Label 'Port Of Discharge';
        Final_Destination_Cap: Label 'Final Destination';
        Country_Of_Origin_of_Goods_Cap: Label 'Country Of Origin of Goods';
        Country_of_Final_Destination_Cap: Label 'Country of Final Destination';
        Terms_Of_Delivery_Cap: Label 'Terms Of Delivery';
        Terms_of_Payment_Cap: Label 'Terms of Payment:';
        Marks_Nos_Container_No_Cap: Label 'Marks & Nos./Container No.';
        No_of_Pkgs_Cap: Label 'No of Pkgs';
        Description_Of_Goods_Cap: Label 'Description Of Goods';
        Quantity_Cap: Label 'Quantity';
        Rate_Cap: Label 'Rate';
        Amount_Cap: Label 'Amount';
        Amount_in_words_Cap: Label 'Amount (in words)';
        Total_Amt_Cap: Label 'Total Amt';
        ProvisionalIDNo_Cap: Label 'Provisional ID No:';
        CompInfo: Record 79;
        sno: Integer;
        ServiceTaxTotal: Decimal;
        EshesTotal: Decimal;
        SheshesTotal: Decimal;
        TaxTotal: Decimal;
        TaxPer: Text;
        GrandTotal: Decimal;
        NumToText: array[2] of Text[250];
        bank: Record 270;
        SalesInvLine: Record 113;
        LineTotal: Decimal;
        SalesInvHeader: Record 112;
        TaxArea: Record 318;
        TaxAreaLine: Record 319;
        TaxJurisdiction: Record 320;
        Chck: Report 1401;
        CustRec: Record 18;
        CustRec1: Record 18;
        CustPAN: Text[50];
        CustCST: Text[50];
        CustVAT: Text[50];
        CustPostCode: Text[30];
        CusPhNo: Text[100];
        CustCity: Text[30];
        CustAddress: Text[50];
        CustAddress2: Text[50];
        CustName: Text[50];
        CustSTC: Text[50];
        linecount: Integer;
        cnt: Integer;
        cnt1: Decimal;
        cnt2: Decimal;
        Outputno: Integer;
        vtemp: Integer;
        vtemp1: Integer;
        boolcheck: Boolean;
        i: Integer;
        SlNo: Integer;
        salesInvline1: Record 113;
        SalesInvLine2: Record 113;
        //ServTaxSetup : Record "16472";
        ServTaxPer: Decimal;
        SerTaxEcessPer: Decimal;
        SerTaxSheCessPer: Decimal;
        TaxType: Text;
        TaxPercent: Decimal;
        PaymentTerms: Record 3;
        PaymentTrms: Text[50];
        TaxAmt: Decimal;
        CustTaxLiable: Boolean;
        SEZRemarks1: Text[50];
        SEZRemarks2: Text[50];
        periodboolean: Boolean;
        //  DefferedOrderSetup: Record 50007;
        lindiscountamt: Decimal;
        lindismat: Decimal;
        netamtvar: Decimal;
        direction: Text;
        netamtvar1: Decimal;
        GrandTotal1: Decimal;
        Linetotal1: Decimal;
        SBCessPer: Decimal;
        NewSerTaxPer: Decimal;
        SBCessTotal: Decimal;
        SerTaxBaseAmt: Decimal;
        Footer1_CaptionLbl: Label '1. Goods once sold will not be taken back';
        Footer2_CaptionLbl: Label '2. Payment Terms: %1  Payment should be made strictly as per terms"';
        Footer3_CaptionLbl: Label '3. Any dispute shall be resolved subject to Hyderabad Jurisdiction';
        Footer4_CaptionLbl: Label '4. Tax subject/ not subject to reverse charge';
        Footer5_CaptionLbl: Label '5. Unless otherwise stated tax on this invoice is not payable under reverse charge';
        Footer6_CaptionLbl: Label '6. I/We certify that my / our registration certificate under GST Act is in force on the date on which the sale of the goods specifed in this Tax Invoice is made by me/ us & that the transction of sale converted by this Tax Invoice has been affectedby me / us & the due tax, if any, payable on the sales has been paid or shall be paid.';
        Footer01_CapLb01: Label 'Declaration : We declare that this Invoice shows the actual price of the goods described and that all particulars are true and correct.';
        Footer02_CapLb02: Label 'Free sample of no commercial value. sample for testing purposes';
        Footer03_CapLb03: Label 'For Greenleaf Extraction Pvt Ltd';
        Footer04_CapLb04: Label 'Authorized Signatory';


        Label1_Cap01: Label 'Buyer (if other than consignee)';
        Label2_Cap02: Label 'Provisional ID No:';
        Lable3_Cap03: Label 'Sample for testing Purpose Only';
        Lable4_Cap04: label 'NOT FOR RE-SALE , ONLY FOR TESTING PURPOSE';

        "-B2BGST1.0-": Integer;
        // GSTComponent : Record "16405";
        //  DetailedGSTEntryBuffer: Record "Detailed GST Entry Buffer";
        IsGSTApplicable: Boolean;
        j: Integer;
        GSTCompAmount: array[20] of Decimal;
        GSTComponentCode: array[20] of Code[10];
        //GSTManagement : Codeunit "16401";
        ShipAdderGRec: Record 222;
        TotalGstGVar: Decimal;
        GstPerGVar: Decimal;
        SalesInvLineGRec: Record 113;
        SendAddress1: Text[50];
        SendAddress2: Text[50];
        SendAddress3: Text[50];
        SendAddress4: Text[30];
        SendAddress5: Code[20];
        SendAddress6: Code[15];
        PaymentTermsGRec: Record 3;
        ShowHeadCap: Boolean;
        Head_CaptionLbl: Label 'Original For Recipient';
        State_CaptionLbl: Label 'State';
        Code_CaptionLbl: Label 'State Code';

        QtyGVar: Decimal;
        IGSTGVar: Decimal;
        CGSTGVar: Decimal;
        SGSTGVar: Decimal;
        Rate: Decimal;
        AmountGVar: Decimal;
        //EnvoiceEntry: Record 50050;
        Text001: Label 'SUPPLY MEANT FOR EXPORT UNDER BOND OR LETTER OF UNDERTAKING WITHOUT PAYMENT OF INTEGRATED TAX';
        Text002: Label 'SUPPLY TO SEZ UNIT OR SEZ DEVELOPER FOR AUTHORISED OPERATIONS UNDER BOND OR LETTER OF UNDERTAKING WITHOUT PAYMENT OF INTEGRATED TAX';
        Text003: Label 'This Invoice Subject to Reverse Charge';
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        SupplyofGoodCaptionLbl: Label 'Supply of Goods/Services Meant for SEZ UNIT under LUT No.-';
        withoutpaymentCaptionLbl: Label '%1  Dt.- %2  without payment of GST @';
        AggregatingCaptionLbl: Label '18% aggregating to Rs. %1';
        SEZGSTPer: Text[250];
        SEZGSTAmnt: Decimal;
        SalesInvLine3: Record 113;
        //    GSTSetup: Record "GST Setup";
        Footer1_1_CaptionLbl: Label '1. Invoice is subjected to repective HCCI standard terms and conditions';
        Footer2_1_CaptionLbl: Label '2. Any dispute shall be resolved subject to Hyderabad Jurisdiction';
        Footer3_1_CaptionLbl: Label '3. Unless otherwise stated tax on this invoice is not payable under reverse charge';
        Footer4_1_CaptionLbl: Label '4. Any changes to invoice shall be informed within 15 days from the date of receipt of soft copy of the invoice and shall be in line with accepted terms & conditions and Purchase Order. Otherwise the invoice will be deemed accepted by you.';
        Footer5_1_CaptionLbl: Label '5. I/ We certify that my / our registration certificate under the GST Act is in force on the date on which the sale of the goods specified in this Tax Invoice is made by me/ us & that the transction of sale convered by this Tax Invoice has been affected by me / us & the due tax, if any, payable on the sale has been paid or shall be paid.';
        Heading2Text: Text[1024];
        ShowBankDetails: Boolean;
        RateCaption: Text[30];
        AmtPerCaption: Text[30];
        ExchRate: Decimal;
        TotalAmtGVar: Text[30];
        ShowSezDes: Boolean;
        UOMUSDAmt: Decimal;
        ExchRate1: Decimal;
        netamtvar2: Decimal;
        Linetotal1USD: Decimal;
        PerUOM: Text[30];
        UOMUSDAmtTot: Decimal;
        SalesInvoiceHeader: Record 112;
        GrandTotalUSD: Decimal;
        CustLedgerEntry: Record 21;
        AdvPaymentDetails: Decimal;
        // DefferedOrderSetupGRec: Record 50007;
        IRNNoCaptionLVar: Text[50];
        SalTypeDes: Text[250];
        ShowExtDesc: Boolean;
        PaymentTerms2: Record 3;
        USDClauseGVar: Boolean;
        CessLbl: Label 'CESS';
        GSTLbl: Label 'GST';
        GSTCESSLbl: Label 'GST CESS';
        CGSTLbl: Label 'CGST';
        SGSTLbl: Label 'SGST';
        IGSTLbl: Label 'IGST';
        SGSTAmt: Decimal;
        CGSTAmt: Decimal;
        IGSSTAmt: Decimal;
        //ChckReport: Codeunit NumbertoText;
        IGSTRate: Decimal;
        CGSTRate: Decimal;
        SGSTRate: Decimal;
        TDSAmt: Decimal;
        CessAmt: Decimal;
        CGSTPer: decimal;
        IGSTPer: decimal;
        SGSTPer: decimal;
        ItemLinesExist: Boolean;
}
