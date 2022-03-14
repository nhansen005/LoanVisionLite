page 14135103 "lvnLateFee"
{
    Caption = 'Late Fees Page';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "lvnLateFee";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("State Code"; Rec."State Code")
                {
                    ApplicationArea = All;
                }
                field("Loan Type Code"; Rec."Loan Type Code")
                {
                    ApplicationArea = All;
                }
                field("Fee %"; Rec."Fee %")
                {
                    ApplicationArea = All;
                }
            }
        }

    }


}