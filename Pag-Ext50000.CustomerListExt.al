pageextension 50000 "Customer List Ext" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(HelloWorld)
            {
                Caption = 'Hello, World!';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;
                Image = BookingsLogo;

                trigger OnAction()
                var
                    v: Record Printer;
                begin
                    Message('Hello, ' + Rec.Name);
                end;
            }
        }
    }
}