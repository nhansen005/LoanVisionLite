tableextension 14135100 "lvnLoanNoExt" extends "G/L Entry"
{
    fields
    {
        field(14135100; "Loan No."; Code[20])
        {
            Caption = 'Loan No.';
            DataClassification = CustomerContent;
            TableRelation = lvnLoan;
        }
    }
    keys
    {
        key(PK; "Loan No.") { }
    }


}