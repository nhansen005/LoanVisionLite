xmlport 14135102 "lvnLoanTypeXML"
{
    Caption = 'Import Loan Type CSV';
    Direction = Import;
    TextEncoding = UTF8;
    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ',';


    schema
    {
        textelement(root)
        {
            tableelement(LoanType; "lvnLoanType")
            {


                XmlName = 'LoanType';
                fieldelement(Code; LoanType.code) { }
                fieldelement(Name; LoanType.Description) { }

            }
        }
    }

}