codeunit 14135101 "ExportSalesToJson"
{
    procedure ExportSalesInvoiceAsJson(SalesInvoiceHeader: Record "Sales Invoice Header"; var JsonArr: JsonArray)
    var

        SalesLine: Record "Sales Invoice Line";
        SalesInvoiceHeaderJson: JsonObject;
        SalesLineArray: JsonArray;


    begin
        SalesInvoiceHeaderJson.Add(SalesInvoiceHeader.FieldCaption("No."), SalesInvoiceHeader."No.");
        SalesInvoiceHeaderJson.Add(SalesInvoiceHeader.FieldCaption("Posting Description"), SalesInvoiceHeader."Posting Description");
        SalesInvoiceHeaderJson.Add(SalesInvoiceHeader.FieldCaption("Posting Date"), SalesInvoiceHeader."Posting Date");
        SalesInvoiceHeaderJson.Add(SalesInvoiceHeader.FieldCaption("Document Date"), SalesInvoiceHeader."Document Date");
        SalesLine.SetRange("Document No.", SalesInvoiceHeader."No.");
        IF SalesLine.FindSet() then
            repeat
                ExportSalesInvoiceLineAsJson(SalesLine, SalesLineArray);
            until (SalesLine.Next() = 0);
        SalesInvoiceHeaderJson.Add('Lines', SalesLineArray);
        JsonArr.Add(SalesInvoiceHeaderJson);
    end;

    local procedure ExportSalesInvoiceLineAsJson(SalesInvoiceLine: Record "Sales Invoice Line"; var SalesLineArray: JsonArray);
    var
        SalesIvoiceLineJson: JsonObject;
    begin
        SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption(Type), Format(SalesInvoiceLine.Type));
        SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption("No."), SalesInvoiceLine."No.");
        SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption(Description), SalesInvoiceLine.Description);
        SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption(Quantity), SalesInvoiceLine.Quantity);
        SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption("Unit Price"), SalesInvoiceLine."Unit Price");
        SalesIvoiceLineJson.Add(SalesInvoiceLine.FieldCaption(Amount), SalesInvoiceLine.Amount);
        SalesLineArray.Add(SalesIvoiceLineJson);
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


    /*
        ExportDocuments (HEre you do JSonArray)
            ExportSalesDocument (JsonObject,JsonArray)
                ExportSalesDocumentLines (JsonObject)*/
    /*local procedure GetSalesLineArray(SalesHeader: Record "Sales Invoice Header") SalesLineArray: JsonArray
var
SalesLine: Record "Sales Invoice Line";
begin
SalesLine.SetRange("No.", SalesHeader."No.");
IF SalesLine.FindSet() then
repeat
 ExportSalesInvoiceLineAsJson(SalesLine, SalesLineArray);
until (SalesLine.Next() = 0);
end;*/

}