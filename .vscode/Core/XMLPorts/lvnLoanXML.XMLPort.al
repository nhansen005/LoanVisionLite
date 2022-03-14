xmlport 14135101 "lvnLoanXML"
{
    Caption = 'Import Loans CSV';
    Direction = Import;
    TextEncoding = UTF8;
    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ',';


    schema
    {
        textelement(root)
        {
            tableelement(Loans; "lvnLoan")
            {


                XmlName = 'Loans';
                fieldelement(Code; Loans."No.") { }
                fieldelement(FirstName; Loans."Borrower First Name") { }
                fieldelement(LastName; Loans."Borrower Last Name") { }
                fieldelement(Amount; Loans."Loan Amount") { }
                fieldelement(InterestRate; Loans."Interest Rate") { }
                fieldelement(LoanTerm; Loans."Loan Term") { }
                fieldelement(Address; Loans."Property Address") { }
                fieldelement(City; Loans."Property City") { }
                fieldelement(ZipCode; Loans."Property Zip Code") { }
                fieldelement(State; Loans."Property State") { }
                fieldelement(LoanType; Loans."Loan Type") { }


            }
        }
    }

}