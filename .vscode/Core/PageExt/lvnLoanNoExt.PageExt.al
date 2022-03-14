pageextension 14135100 "lvnLoanNoPageExt" extends "G/L Entries Preview"
{
    layout
    {
        addlast(Control1)
        {
            field("Loan No."; Rec."Loan No.")
            {
                ApplicationArea = All;

            }
        }
    }

}