page 14135110 "lvnLoanCard"
{
    Caption = 'Loan Entity Card';
    PageType = Card;
    SourceTable = "lvnLoan";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Borrower First Name"; Rec."Borrower First Name")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        FullName := StrSubstNo(FullNameLbl, Rec."Borrower First Name", Rec."Borrower Last Name");
                    end;
                }
                field("Borrower Last Name"; Rec."Borrower Last Name")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        FullName := StrSubstNo(FullNameLbl, Rec."Borrower First Name", Rec."Borrower Last Name");
                    end;

                }
                field("Loan Amount"; Rec."Loan Amount")
                {
                    ApplicationArea = All;
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = All;
                }
                field("Loan Term"; Rec."Loan Term")
                {
                    ApplicationArea = All;
                }
                field("Property Address"; Rec."Property Address")
                {
                    ApplicationArea = All;
                }
                field("Property City"; Rec."Property City")
                {
                    ApplicationArea = All;
                }
                field("Property Zip Code"; Rec."Property Zip Code")
                {
                    ApplicationArea = All;
                }
                field("Property State"; Rec."Property State")
                {
                    ApplicationArea = All;
                }
                field("Loan Type"; Rec."Loan Type")
                {
                    ApplicationArea = All;
                }
                field(fieldFullName; FullName)
                {
                    ApplicationArea = All;


                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(showMessage)
            {
                Caption = 'Show Message';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Confirm;
            }
        }
    }





    var
        FullName: text;
        FullNameLbl: Label '%1 %2';



    trigger OnAfterGetCurrRecord()
    begin
        FullName := StrSubstNo(FullNameLbl, Rec."Borrower First Name", Rec."Borrower Last Name");
    end;





}