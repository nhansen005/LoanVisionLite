codeunit 14135101 "ExportSalesToJson"
{
    procedure ExportSalesInvoiceAsJson(SalesInvoiceHeader: Record "Sales Invoice Header"; var JsonArr: JsonArray)

    var

        SalesLine: Record "Sales Invoice Line";
        SalesInvoiceHeaderJson: JsonObject;
        SalesLineArray: JsonArray;

        SalesIvoiceLineJson: JsonObject;
        SalesInvoiceLine: Record "Sales Invoice Line";


    begin

        SalesInvoiceHeaderJson.Add(SalesInvoiceHeader.FieldCaption("No."), SalesInvoiceHeader."No.");
        SalesInvoiceHeaderJson.Add(SalesInvoiceHeader.FieldCaption("Document Date"), SalesInvoiceHeader."Document Date");
        SalesInvoiceHeaderJson.Add(SalesInvoiceHeader.FieldCaption("Posting Date"), SalesInvoiceHeader."Posting Date");
        SalesInvoiceHeaderJson.Add(SalesInvoiceHeader.FieldCaption("Posting Description"), SalesInvoiceHeader."Posting Description");


        SalesInvoiceLine.Reset();
        SalesInvoiceLine.SetRange("Document No.", SalesInvoiceHeader."No.");
        if SalesInvoiceLine.FindSet() then
            repeat

                Clear(SalesIvoiceLineJson);
                SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption("No."), SalesInvoiceLine."No.");
                SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption(Description), SalesInvoiceLine.Description);
                SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption(Type), Format(SalesInvoiceLine.Type));
                SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption("Unit Price"), SalesInvoiceLine."Unit Price");
                SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption(Amount), SalesInvoiceLine.Amount);
                SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption(Quantity), SalesInvoiceLine.Quantity);
                SalesLineArray.Add(SalesIvoiceLineJson);
            until SalesInvoiceLine.Next() = 0;
        SalesInvoiceHeaderJson.Add('Lines', SalesIvoiceLineJson);
        JsonArr.Add(SalesInvoiceHeaderJson);

    end;



    procedure ExportDocs()
    var
        SalesInvHeader: Record "Sales Invoice Header";
        JsonArr: JsonArray;
        Tempblob: Codeunit "Temp Blob";
        IStream: InStream;
        OStream: OutStream;
        ExportFileName: Text;
    begin
        SalesInvHeader.Reset();
        SalesInvHeader.FindSet();
        repeat
            ExportSalesInvoiceAsJson(SalesInvHeader, JsonArr);
        until SalesInvHeader.Next() = 0;

        Tempblob.CreateOutStream(OStream);

        IF JsonArr.WriteTo(OStream) THEN begin
            ExportFileName := 'Sales Invoices.json';
            Tempblob.CreateInStream(IStream);
            DownloadFromStream(IStream, '', '', '', ExportFileName);
        end;

    end;

}