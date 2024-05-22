codeunit 50006 MyChecklist
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::Checklist, OnChecklistLoading, '', false, false)]
    local procedure Checklist_OnChecklistLoading()
    var
        GuidedExperience: Codeunit "Guided Experience";
    begin
        GuidedExperience.InsertLearnLink('Learn This', 'Learn', 'Click here to learn more', 10, 'https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/onboarding-checklist');
    end;
}