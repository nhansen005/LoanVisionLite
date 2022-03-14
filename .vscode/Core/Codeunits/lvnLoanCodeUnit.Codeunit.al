codeunit 14135100 "lvnLoanCodeunit"
{
    //this shows you first and last name when entered
    [EventSubscriber(ObjectType::Table, Database::lvnLoan, 'OnAfterModifyEvent', '', true, true)]
    local procedure lvnLoan_Action_OnInsert(var Rec: Record lvnLoan)
    begin
        Message(Rec."Borrower First Name" + ' ' + rec."Borrower Last Name");
    end;

    //This subcribes to button created and and shows the First and Last name when clicked
    [EventSubscriber(ObjectType::Page, Page::lvnLoanCard, 'OnAfterActionEvent', 'showMessage', true, true)]
    local procedure lvnLoanList_Action_ShowMessage(var Rec: Record lvnLoan)
    begin
        Message(rec."Borrower First Name" + ' ' + rec."Borrower Last Name");
    end;


    //this subcribes to a extension created with a button and shows name when clicked
    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterActionEvent', 'showName', true, true)]
    local procedure CustCardExt_Action_ShowName(var Rec: Record Customer)
    begin
        Message(rec.Name);
    end;


}