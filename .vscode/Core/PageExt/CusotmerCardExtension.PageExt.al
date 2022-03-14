pageextension 14135101 "CusotmerCardExtension" extends "Customer Card"
{

    actions
    {

        addfirst(processing)
        {
            action(showName)
            {
                Caption = 'Show Name';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Confirm;

            }
        }


    }


}