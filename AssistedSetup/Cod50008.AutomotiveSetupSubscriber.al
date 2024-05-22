codeunit 50008 "Automotive Setup Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', false, false)]
    local procedure AddExtensionAssistedSetup_OnRegisterAssistedSetup()
    var
        GuidedExperience: Codeunit "Guided Experience";
        TitleLbl: Label 'Automotive Setup';
        ShortTitleLbl: Label 'Create a new automotive';
        DescriptionLbl: Label 'Create a new automotive';
    begin
        GuidedExperience.InsertAssistedSetup(
            TitleLbl,
            ShortTitleLbl,
            DescriptionLbl,
            1,
            ObjectType::Page,
            GetPageId(),
            "Assisted Setup Group"::Extensions,
            'https://www.youtube.com/embed/fitTMAwHcJw',
            "Video Category"::Uncategorized,
            'https://www.waldo.be');

        UpdateStatus();
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnReRunOfCompletedAssistedSetup', '', false, false)]
    // local procedure OnReRunOfCompletedSetup(ExtensionID: Guid; ObjectType: ObjectType; ObjectID: Integer; var Handled: Boolean)
    // var
    //     SetupAlreadyDoneQst: Label 'This setup is already done. Do you want to open the setup page instead?';
    // begin
    //     if ExtensionID <> GetAppId() then exit;
    //     if ObjectType <> ObjectType::Page then exit;
    //     if ObjectID <> GetPageId() then exit;

    //     if Confirm(SetupAlreadyDoneQst, true) then
    //         Page.Run(GetPageId());

    //     Handled := true;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnAfterRunAssistedSetup', '', false, false)]
    // local procedure OnAfterRunOfSetup(ExtensionID: Guid; ObjectType: ObjectType; ObjectID: Integer)
    // begin
    //     if ExtensionID <> GetAppId() then exit;
    //     if ObjectID <> GetPageId() then exit;

    //     Message('Congratulations you created a new automotive');
    // end;

    procedure UpdateStatus()
    var
        Rec: Record Automotive;
        GuidedExperience: Codeunit "Guided Experience";
    begin
        if not Rec.FindFirst() then exit;

        if Rec.Description <> '' then
            GuidedExperience.CompleteAssistedSetup(ObjectType::Page, GetPageId());
    end;

    local procedure GetAppId(): Guid
    var
        EmptyGuid: Guid;
        Info: ModuleInfo;
    begin
        if Info.Id() = EmptyGuid then
            NavApp.GetCurrentModuleInfo(Info);
        exit(Info.Id());
    end;

    local procedure GetPageId(): Integer
    begin
        exit(Page::"Automotive Wizard");
    end;

    //TODO: Call "SomeAssistedSetup.UpdateStatus(); in case the wizard is run without the assisted setup.  It should call the "UpdateStatus" of this codeunit.
}