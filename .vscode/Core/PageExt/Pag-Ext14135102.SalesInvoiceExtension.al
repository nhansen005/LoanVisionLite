pageextension 14135102 "SalesInvoiceExtension" extends "Sales Invoice"
{


    actions
    {
        addlast("F&unctions")
        {
            action(ExportItems)
            {
                Caption = 'Export Items';
                Promoted = True;
                PromotedCategory = Process;
                Image = Export;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(14135103, true, false);
                end;
            }
        }

    }

}