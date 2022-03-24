report 14135100 "LvnLoanReport"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'lvnLoanReport.docx';
    RDLCLayout = 'lvnLoanReport.RDLC';
    EnableHyperlinks = true;

    dataset
    {
        dataitem(LoanReport; lvnLoan)
        {
            column(No_; "No.") { }
            column(Borrower_First_Name; "Borrower First Name") { }
            column(Borrower_Last_Name; "Borrower Last Name") { }
            column(Property_Address; "Property Address") { }
            column(Property_City; "Property City") { }
            column(Property_State; "Property State") { }
            column(Property_Zip_Code; "Property Zip Code") { }
            column(Loan_Amount; "Loan Amount") { }
            column(Interest_Rate; "Interest Rate") { }
            column(Loan_Term; "Loan Term") { }
            column(Loan_Type; "Loan Type") { }
            column(DocumentTitleLbl; DocumentTitleLbl) { }
            column(CompanyNameLbl; CompanyNameLbl) { }
            column(CompanyAddressLbl; CompanyAddressLbl) { }



        }
    }



    var
        DocumentTitleLbl: Label 'Loan Report';
        CompanyNameLbl: Label 'Bestborn Busines Solutions';
        CompanyAddressLbl: Label '507 W Newton St #2, Greensburg, PA 15601';

}