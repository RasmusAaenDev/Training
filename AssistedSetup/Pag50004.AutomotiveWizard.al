page 50004 "Automotive Wizard"
{
    PageType = NavigatePage;
    SourceTable = Automotive;
    SourceTableTemporary = true;
    Caption = 'Add an Automotive';

    layout
    {
        area(content)
        {
            group(Step1)
            {
                Visible = Step1Visible;

                group("Welcome")
                {
                    Caption = 'Welcome to the Automotive assisted setup';
                    group(group11)
                    {
                        Caption = '';
                        InstructionalText = 'Use this guide to register a Automotive task for you and your team.';
                    }
                }
                group("Let's go")
                {
                    Caption = 'Let''s go';
                    group(group12)
                    {
                        Caption = '';
                        InstructionalText = 'Select Next to get started.';
                    }
                }
            }
            group(Step2)
            {
                Caption = 'Enter information about the Automotive';
                Visible = Step2Visible;
                field("No."; _No)
                {
                    ApplicationArea = All;
                    Caption = 'What''s a recognizable identifier for the automotive?';
                    ToolTip = 'Assign a number to the automotive';
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Describe your Automotive';
                    ToolTip = 'The description of the Automotive.';
                }
                field("Model"; _Model)
                {
                    ApplicationArea = All;
                    Caption = 'What''s the model?';
                    ToolTip = 'The Automotive''s model.';
                }
                field("Year"; Rec.Year)
                {
                    ApplicationArea = All;
                    Caption = 'When was the automotive model produced?';
                    ToolTip = 'The year the model of the Automotive was produced.';
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                    Caption = 'What''s the fuel type that the automotive is using?';
                    ToolTip = 'The automotive''s fuel type';
                }
                field("Manufacturer"; _Manufacturer)
                {
                    ApplicationArea = All;
                    Caption = 'Who manufactured the automotive?';
                    ToolTip = 'The automotive manufacturer';
                }
            }
            group(Step3)
            {
                Caption = 'That''s it!';
                InstructionalText = 'Select Finish to save the Automotive.';
                Visible = Step3Visible;

            }
            group(StandardBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and not FinishActionEnabled;
                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and FinishActionEnabled;
                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Back)
            {
                ApplicationArea = All;
                Caption = '&Back';
                Enabled = BackEnable;
                InFooterBar = true;
                Image = PreviousRecord;

                trigger OnAction()
                begin
                    NextStep(true);
                end;
            }
            action(Next)
            {
                ApplicationArea = All;
                Caption = '&Next';
                Enabled = NextEnable;
                InFooterBar = true;
                Image = NextRecord;

                trigger OnAction()
                begin
                    NextStep(false);
                end;
            }
            action(Finish)
            {
                ApplicationArea = All;
                Caption = '&Finish';
                Enabled = FinishEnable;
                InFooterBar = true;
                Image = Approve;

                trigger OnAction()
                begin
                    Finished();
                end;
            }
        }
    }


    trigger OnInit()
    begin

        EnableControls();
        LoadTopBanners();
        Rec.Init();
        Rec.Insert();
    end;

    var
        BackEnable: Boolean;
        NextEnable: Boolean;
        FinishEnable: Boolean;
        Step1Visible: Boolean;
        Step2Visible: Boolean;
        Step3Visible: Boolean;
        Step: Option Start,Fill,Finish;
        Automotive: Record "Automotive";
        TopBannerVisible: Boolean;
        FinishActionEnabled: Boolean;
        MediaRepositoryDone: Record "Media Repository";
        MediaRepositoryStandard: Record "Media Repository";
        MediaResourcesDone: Record "Media Resources";
        _No: Code[20];
        _Model: Code[20];
        _Manufacturer: Code[20];
        MediaResourcesStandard: Record "Media Resources";

    local procedure NextStep(Backwards: Boolean)
    begin
        if Backwards then
            Step := Step - 1
        else
            Step := Step + 1;

        EnableControls();
    end;

    local procedure Finished()
    begin
        StoreRecordVar();
        CurrPage.Close();
    end;

    local procedure EnableControls()
    begin
        ResetControls();
        case Step of
            Step::Start:
                ShowStep1();
            Step::Fill:
                ShowStep2();
            Step::Finish:
                ShowStep3();
        end;
    end;

    local procedure ShowStep1()
    begin
        Step1Visible := true;
        BackEnable := false;
        NextEnable := true;
        FinishEnable := false;
    end;

    local procedure ShowStep2()
    begin
        Step2Visible := true;
        BackEnable := true;
        NextEnable := true;
        FinishEnable := false;
    end;

    local procedure ShowStep3()
    begin
        Step3Visible := true;
        BackEnable := true;
        NextEnable := false;
        FinishEnable := true;
        FinishActionEnabled := true
    end;

    local procedure ResetControls();
    begin
        FinishEnable := false;
        BackEnable := true;
        NextEnable := true;
        Step1Visible := false;
        Step2Visible := false;
        Step3Visible := false;

    end;

    local procedure StoreRecordVar();
    begin
        VerifyOrInsertModel(_Model);
        VerifyOrInsertManufacturer(_Manufacturer);

        Automotive.Init();
        Automotive.TransferFields(Rec, true);
        Automotive."No." := _No;
        Automotive.Model := _Model;
        Automotive.Manufacturer := _Manufacturer;
        Automotive.Insert();
    end;

    local procedure LoadTopBanners();
    begin
        if MediaRepositoryStandard.Get('AssistedSetup-NoText-400px.png', Format(CurrentClientType())) and
            MediaRepositoryDone.Get('AssistedSetupDone-NoText-400px.png', Format(CurrentClientType()))
        then
            if MediaResourcesStandard.Get(MediaRepositoryStandard."Media Resources Ref") and
                MediaResourcesDone.Get(MediaRepositoryDone."Media Resources Ref")
        then
                TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();

    end;

    local procedure VerifyOrInsertModel(_Model: Code[20])
    var
        AutomotiveModel: Record "Automotive Model";
    begin
        if AutomotiveModel.Get(_Model) then
            exit;

        AutomotiveModel.Init();
        AutomotiveModel."Model Code" := _Model;
        AutomotiveModel.Description := _Model;
        AutomotiveModel.Insert();
    end;

    local procedure VerifyOrInsertManufacturer(_Manufacturer: Code[20])
    var
        Manufacturer: Record Manufacturer;
    begin
        if Manufacturer.Get(_Manufacturer) then
            exit;

        Manufacturer.Init();
        Manufacturer."Code" := _Manufacturer;
        Manufacturer.Name := _Manufacturer;
        Manufacturer.Insert();
    end;
}