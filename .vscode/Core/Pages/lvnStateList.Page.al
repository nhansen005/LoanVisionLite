page 14135101 "lvnState"
{
    Caption = 'State';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = lvnState;

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
                field("Name"; Rec.Name)
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
                Caption = 'Import State';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::lvnStatesXML);
                    CurrPage.Update(false);
                end;
            }
        }
    }



}