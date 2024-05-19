codeunit 50101 "Create Sales Order"
{
    Subtype = Test;

    var
        BCPTTestContext: Codeunit "BCPT Test Context";

    trigger OnRun();
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
    begin
        BCPTTestContext.StartScenario('Add Order');
        Customer.FindFirst();
        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader.Insert(true);
        BCPTTestContext.EndScenario('Add Order');
        BCPTTestContext.UserWait();
        BCPTTestContext.StartScenario('Enter Account No.');
        SalesHeader.Validate("Sell-to Customer No.", Customer."No.");
        SalesHeader.Modify(true);
        BCPTTestContext.EndScenario('Enter Account No.');
        BCPTTestContext.UserWait();
    end;
}