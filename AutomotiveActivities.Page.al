page 50102 "Automotive Activities"
{
    PageType = CardPart;
    SourceTable = "Activities Cue";
    RefreshOnActivate = true;
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup("Activities")
            {
                field("Total Automotives"; Rec."Total Automotives")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Automotive List";
                }
                field("Sales This Month"; Rec."Sales This Month")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }
                field("Ongoing Sales Orders"; Rec."Ongoing Sales Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }
                field("Ongoing Sales Quotes"; Rec."Ongoing Sales Quotes")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Quotes";
                }
                field("Ongoing Sales Invoices"; Rec."Ongoing Sales Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Invoice List";
                }
            }
        }
    }
}