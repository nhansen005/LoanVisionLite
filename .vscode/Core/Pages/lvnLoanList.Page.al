page 14135100 "lvnLoanList"
{
    Caption = 'Loan Page';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "lvnLoanCard";
    SourceTable = "lvnLoan";

    layout
    {
        area(Content)
        {
            repeater(General1)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Borrower First Name"; Rec."Borrower First Name") { ApplicationArea = All; }

                field("Borrower Last Name"; Rec."Borrower Last Name") { ApplicationArea = All; }

                field("Loan Amount"; Rec."Loan Amount") { ApplicationArea = All; }

                field("Interest Rate"; Rec."Interest Rate") { ApplicationArea = All; }

                field("Loan Term"; Rec."Loan Term") { ApplicationArea = All; }

                field("Property Address"; Rec."Property Address") { ApplicationArea = All; }

                field("Property City"; Rec."Property City") { ApplicationArea = All; }

                field("Property Zip Code"; Rec."Property Zip Code") { ApplicationArea = All; }

                field("Property State"; Rec."Property State") { ApplicationArea = All; }

                field("Loan Type"; Rec."Loan Type") { ApplicationArea = All; }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(ImportItems)
            {
                Caption = 'Import Loan';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::lvnLoanXML);
                    CurrPage.Update(false);
                end;
            }
            action(ExportToExcel)
            {
                Caption = 'Export to Excel';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Export;

                trigger OnAction()
                var
                begin
                    ExportlvnLoanList(Rec);
                end;
            }


        }


    }
    var
        FullName: text;
        FullNameLbl: Label '%1 %2';

    trigger OnAfterGetRecord()
    begin
        FullName := StrSubstNo(FullNameLbl, Rec."Borrower First Name", Rec."Borrower Last Name");
    end;

    local procedure ExportlvnLoanList(var CustLedgerEntryRec: Record lvnLoan)
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        CustLedgerEntriesLbl: Label 'Loan List Entries';
        ExcelFileName: Label 'LoanListEntries_%1_%2';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Borrower First Name"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Borrower Last Name"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Loan Amount"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Interest Rate"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Loan Term"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Property Address"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Property City"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Property Zip Code"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Property State"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgerEntryRec.FieldCaption("Loan Type"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        if CustLedgerEntryRec.FindSet() then
            repeat
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Borrower First Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Borrower Last Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Loan Amount", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Interest Rate", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Loan Term", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Property Address", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Property City", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Property Zip Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Property State", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(CustLedgerEntryRec."Loan Type", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);

            until CustLedgerEntryRec.Next() = 0;
        TempExcelBuffer.CreateNewBook(CustLedgerEntriesLbl);
        TempExcelBuffer.WriteSheet(CustLedgerEntriesLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();
    end;


}
