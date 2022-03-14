table 14135103 "lvnLateFee"
{
    Caption = 'Late Fee Entity';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "State Code"; Code[20])
        {
            Caption = 'State Code';
            DataClassification = CustomerContent;
            TableRelation = lvnState;
        }
        field(10; "Loan Type Code"; Code[20])
        {
            Caption = 'Loan Type Code';
            DataClassification = CustomerContent;
            TableRelation = "lvnLoanType";
        }
        field(20; "Fee %"; Decimal)
        {
            Caption = 'Fee %';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        key(Pk; "State Code", "Loan Type Code")
        {
            Clustered = true;
        }
    }



}