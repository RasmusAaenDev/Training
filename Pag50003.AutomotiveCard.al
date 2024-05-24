page 50003 "Automotive Card"
{
    PageType = Card;
    SourceTable = Automotive;
    ApplicationArea = All;
    AboutTitle = 'About the Automotive Card';
    AboutText = 'The automotive details can help you setup a basic automotive, which can later be used for automotive rental.';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Configuration';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ToolTip = 'Specifies the value of the Fuel Type field.';
                    ApplicationArea = All;
                }
            }
            group(Configuration)
            {
                Caption = 'Configuration';
                AboutTitle = 'Manage the vehicle configuration';
                AboutText = 'Specify the exact model and manufacturer details, about the vehicle';

                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.';
                    ApplicationArea = All;
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ToolTip = 'Specifies the value of the Manufacturer field.';
                    ApplicationArea = All;
                    AboutTitle = 'Vehicle Manufacurer';
                    AboutText = 'Specifies the **exact manufacturer** of this vehicle, the manufacturer can be described in details on the specific manufacturer card.';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.';
                    ApplicationArea = All;
                }

            }
        }
    }
}