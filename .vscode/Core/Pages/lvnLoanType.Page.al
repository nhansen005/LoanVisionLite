page 14135102 "lvnLoanType"
{
    Caption = 'Loan Type Page';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "lvnLoanType";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
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
            action(ImportItems)
            {
                Caption = 'Import LoanType';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::lvnLoanTypeXML);
                    CurrPage.Update(false);
                end;
            }
        }
    }


}