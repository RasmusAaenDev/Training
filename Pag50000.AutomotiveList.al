page 50000 "Automotive List"
{
    Caption = 'Automotive List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Automotive;
    Editable = false;
    CardPageId = "Automotive Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}