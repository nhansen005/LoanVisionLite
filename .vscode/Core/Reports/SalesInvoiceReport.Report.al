report 14135101 "SalesInvoiceReport"
{

    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SalesInvoiceReport.RDLC';
    EnableHyperlinks = true;



    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            column(DocumentTitleLbl; DocumentTitleLbl) { }
            column(CompanyNameLbl; CompanyNameLbl) { }
            column(CompanyAddressLbl; CompanyAddressLbl) { }
            column(No_; SalesInvoiceHEader."No.") { }
            column(Borrower_First_Name; SalesInvoiceHeader."Sell-to Customer Name") { }
            column(Property_Address; SalesInvoiceHeader."Sell-to Address") { }
            column(Property_City; SalesInvoiceHeader."Sell-to City") { }
            column(Property_Zip_Code; SalesInvoiceHeader."Sell-to Post Code") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(DueDate_Lbl; DueDate_Lbl) { }
            column(Due_Date; "Due Date") { }
            column(Salesperson_Code; "Salesperson Code") { }
            column(CustomerPONumber; SalesInvoiceHeader."External Document No.") { }
            column(OrderNo_Lbl; OrderNo_Lbl) { }
            column(Order_NO; SalesInvoiceHeader."Order No.") { }
            //column(SalesName; SalespersonPurchaser.Name) { }
            column(PaymentTermsCodeLbl; PaymentTermsCodeLbl) { }
            column(Payment_Terms_Code; "Payment Terms Code") { }
            column(DocumentDate_Lbl; DocumentDate_Lbl) { }
            column(Document_Date; "Document Date") { }
            column(ShippingAgentCode_Lbl; ShippingAgentCode_Lbl) { }
            column(Shipping_Agent_Code; "Shipping Agent Code") { }
            column(PackingTrackingNo_Lbl; PackingTrackingNo_Lbl) { }
            column(Package_Tracking_No_; "Package Tracking No.") { }






            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {

                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = SalesInvoiceHeader;
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(LineNo_Line; "Line No.") { }
                column(Job_Task_No_; "Job Task No.") { }
                column(ItemNo_; "No.") { }
                column(Description; Description) { }
                column(Shipment_Date; "Shipment Date") { }
                column(Quantity; Quantity) { }
                column(Unit_Price; "Unit Price") { }
                column(Line_Amount; "Line Amount") { }
                column(Description_Line; Description) { }
                column(Description_Line_Lbl; FieldCaption(Description)) { }





                /* column(AmountExcludingVAT_Line; Amount)
                 {
                     AutoFormatExpression = GetCurrencyCode();
                     AutoFormatType = 1;
                 }
                 column(AmountExcludingVAT_Line_Lbl; FieldCaption(Amount)) { }

                 column(AmountIncludingVAT_Line; "Amount Including VAT")
                 {
                     AutoFormatExpression = GetCurrencyCode();
                     AutoFormatType = 1;
                 }
                 column(AmountIncludingVAT_Line_Lbl; FieldCaption("Amount Including VAT"))
                 {
                     AutoFormatExpression = GetCurrencyCode();
                     AutoFormatType = 1;
                 }
                 column(Description_Line; Description) { }

                 column(Description_Line_Lbl; FieldCaption(Description)) { }

                 column(LineDiscountPercent_Line; "Line Discount %") { }

                 column(LineAmount_Line_Lbl; FieldCaption("Line Amount")) { }

                 column(ItemNo_Line; "No.") { }

                 column(ItemNo_Line_Lbl; FieldCaption("No.")) { }

                 column(ItemReferenceNo_Line; "Item Reference No.") { }

                 column(ItemReferenceNo_Line_Lbl; FieldCaption("Item Reference No.")) { }

                 column(ShipmentDate_Line; Format("Shipment Date")) { }


                 column(Quantity_Line_Lbl; FieldCaption(Quantity)) { }


                 column(Type_Line; Format(Type)) { }

                 column(UnitPrice_Lbl; FieldCaption("Unit Price")) { }

                 column(UnitOfMeasure; "Unit of Measure") { }

                 column(UnitOfMeasure_Lbl; FieldCaption("Unit of Measure")) { }

                 column(VATIdentifier_Line; "VAT Identifier") { }

                 column(VATIdentifier_Line_Lbl; FieldCaption("VAT Identifier")) { }


                 column(VATPct_Line_Lbl; FieldCaption("VAT %")) { }**/
            }
        }


    }



    var
        DocumentTitleLbl: Label 'Sales Invoice Report';
        CompanyNameLbl: Label 'Bestborn Busines Solutions';
        CompanyAddressLbl: Label '507 W Newton St #2, Greensburg, PA 15601';
        PostedShipmentDateLbl: Label 'Shipment Date';
        OrderNo_Lbl: Label 'Order No.';
        DueDate_Lbl: Label 'Due Date';
        PaymentTermsCodeLbl: Label 'Payment Terms';
        DocumentDate_Lbl: Label 'Document Date';
        ShippingAgentCode_Lbl: Label 'Shipping Agent Code';
        PackingTrackingNo_Lbl: Label 'Packing Tracking No.';
        JobNo_Lbl: Label 'Job No.';











}