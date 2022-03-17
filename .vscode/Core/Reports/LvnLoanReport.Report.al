report 14135100 "LvnLoanReport"
{
    Caption = 'Loan Report';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    WordLayout = 'lvnLoanReport.docx';
    RDLCLayout = 'lvnLoanReport.RDLC';



    dataset
    {
        dataitem(Loans; lvnLoan)
        {
            column(No_; "No.") { }
            column(Borrower_First_Name; "Borrower First Name") { }
            column(Borrower_Last_Name; "Borrower Last Name") { }
            column(Loan_Amount; "Loan Amount") { }
            column(Interest_Rate; "Interest Rate") { }
            column(Loan_Term; "Loan Term") { }
            column(Property_Address; "Property Address") { }
            column(Property_City; "Property City") { }
            column(Property_Zip_Code; "Property Zip Code") { }
            column(Property_State; "Property State") { }
            column(Loan_Type; "Loan Type") { }

        }
    }

    labels
    {
        Document_Title = 'Loan Report';
        Company_Name = 'Bestborn Busines Solutions';
        Company_Address = '507 W Newton St #2, Greensburg, PA 15601';
    }




}