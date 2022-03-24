xmlport 14135103 "ExportSales"
{
    Caption = 'Export Sales';
    Direction = Export;
    TextEncoding = UTF8;
    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = '<TAB>';

    schema
    {
        textelement(root)
        {
            tableelement(SalesInvoiceHeader; "Sales Invoice Header")
            {
                XmlName = 'SalesInvoiceHeader';
                fieldattribute(Code; SalesInvoiceHeader."No.") { }
                fieldattribute(PostingDescription; SalesInvoiceHeader."Posting Description") { }
                fieldattribute(PostingDate; SalesInvoiceHeader."Posting Date") { }
                fieldattribute(DocumentDate; SalesInvoiceHeader."Document Date") { }
            }
            tableelement(SalesInvoiceLine; "Sales Invoice Line")
            {
                XmlName = 'SaleInvoiceLine';
                fieldattribute(Type; SalesInvoiceLine."Type") { }
                fieldattribute(Code; SalesInvoiceLine."No.") { }
                fieldattribute(Description; SalesInvoiceLine."Description") { }
                fieldattribute(Quantity; SalesInvoiceLine."Quantity") { }
                fieldattribute(UnitPrice; SalesInvoiceLine."Unit Price") { }
                fieldattribute(Amount; SalesInvoiceLine."Amount") { }
            }
        }

    }


}