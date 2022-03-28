xmlport 14135103 "ExportSales"
{
    Caption = 'Export Sales';
    Direction = Export;
    //TextEncoding = UTF8;
    Format = Xml;
    //FieldDelimiter = '"';
    // FieldSeparator = '<TAB>';


    schema
    {
        textelement(root)
        {
            tableelement(SalesInvoiceHeader; "Sales Invoice Header")
            {

                XmlName = 'SalesInvoiceHeader';


                tableelement(SalesInvoiceLine; "Sales Invoice Line")
                {
                    XmlName = 'SaleInvoiceLine';
                    fieldattribute(Type; SalesInvoiceLine."Type") { }
                    fieldattribute(Code; SalesInvoiceLine."No.") { }
                    fieldattribute(Description; SalesInvoiceLine."Description") { }
                    fieldattribute(Quantity; SalesInvoiceLine."Quantity") { }
                    fieldattribute(UnitPrice; SalesInvoiceLine."Unit Price") { }
                    fieldattribute(Amount; SalesInvoiceLine."Amount") { }
                    fieldattribute(CodeLine; SalesInvoiceHeader."No.") { }
                    fieldattribute(PostingDescription; SalesInvoiceHeader."Posting Description") { }
                    fieldattribute(PostingDate; SalesInvoiceHeader."Posting Date") { }
                    fieldattribute(DocumentDate; SalesInvoiceHeader."Document Date") { }
                }





            }

        }

    }



}