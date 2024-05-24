page 50005 "Automotive Setup"
{

    PageType = Card;
    SourceTable = "Automotive Setup";
    Caption = 'Automotive Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
