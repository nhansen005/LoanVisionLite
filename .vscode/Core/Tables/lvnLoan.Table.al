table 14135100 "lvnLoan"
{
    Caption = 'Loan';
    DataClassification = CustomerContent;
    LookupPageId = "lvnLoanList";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            NotBlank = true;

        }
        field(10; "Borrower First Name"; Text[100])
        {
            Caption = 'Borrower First Name';
            DataClassification = CustomerContent;
        }
        field(20; "Borrower Last Name"; Text[100])
        {
            Caption = 'Borrower Last Name';
            DataClassification = CustomerContent;
        }
        field(30; "Loan Amount"; Decimal)
        {
            Caption = 'Loan Amount';
            DataClassification = CustomerContent;
        }
        field(40; "Interest Rate"; Decimal)
        {
            Caption = 'Interest Rate';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 4;
        }
        field(50; "Loan Term"; Integer)
        {
            Caption = 'Loan Term (Months)';
            DataClassification = CustomerContent;
        }
        field(60; "Property Address"; Text[100])
        {
            Caption = 'Property Address';
            DataClassification = CustomerContent;
        }
        field(70; "Property City"; Text[100])
        {
            Caption = 'Property City';
            DataClassification = CustomerContent;
        }
        field(80; "Property Zip Code"; Code[20])
        {
            Caption = 'Property Zip Code';
            DataClassification = CustomerContent;
        }
        field(90; "Property State"; Code[20])
        {
            Caption = 'Property State';
            DataClassification = CustomerContent;
            TableRelation = lvnState;
        }
        field(100; "Loan Type"; Code[20])
        {
            Caption = 'Loan Type';
            DataClassification = CustomerContent;
            TableRelation = lvnLoanType;
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(SK; "Property State")
        {

        }
    }

    trigger OnInsert()
    begin
        //Message(rec."Borrower First Name" + ' ' + rec."Borrower Last Name");

        //RaiseEvent(Rec);
    end;


    /* [BusinessEvent(true)]
     local procedure RaiseEvent(var lvnLoan: Record lvnLoan)
     begin
     end;*/



}