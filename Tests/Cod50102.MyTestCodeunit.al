codeunit 50102 MyTestCodeunit
{
    Subtype = Test;

    [Test]
    procedure "CustomerNameExists_CustomerIsAddedToSalesDoc_CustomerNameIsOnSalesDoc"()
    var
        CustomerNo: Code[20];
        SalesDocNo: Code[20];
    begin
        // [GIVEN] CustomerNameExists 
        CustomerNo := 'TESTCUST';
        InsertCustomerWithName(CustomerNo);
        // [WHEN] CustomerIsAddedToSalesDoc 
        SalesDocNo := SalesDocWithCustomer(CustomerNo);
        // [THEN] CustomerNameIsOnSalesDoc 
        VerifyCustomerNameIsOnSalesDoc(SalesDocNo);
    end;

    local procedure InsertCustomerWithName(CustomerNo: Code[20])
    var
        Customer: Record Customer;
    begin
        Customer.Init();
        Customer.Validate("No.", CustomerNo);
        Customer.Validate(Name, CustomerNo);
        Customer.Validate("Gen. Bus. Posting Group", GetGenBusPostingGroup());
        Customer.Validate("Customer Posting Group", GetCustomerPostingGroup());
        Customer.Insert(true);
    end;

    local procedure SalesDocWithCustomer(CustomerNo: Code[20]): Code[20]
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader."No." := 'testorder';
        SalesHeader.Insert(true);

        SalesHeader.Validate("Sell-to Customer No.", CustomerNo);
        SalesHeader.Modify(true);
        exit(SalesHeader."No.");
    end;

    local procedure VerifyCustomerNameIsOnSalesDoc(SalesDocNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Get(SalesHeader."Document Type"::Invoice, SalesDocNo);
        if SalesHeader."Sell-to Customer Name" = '' then
            Error('The Customer Name has not been added on the sales document');
    end;

    local procedure GetGenBusPostingGroup(): Code[20]
    var
        GenBusinessPostingGroup: Record "Gen. Business Posting Group";
    begin
        GenBusinessPostingGroup.FindFirst();
        exit(GenBusinessPostingGroup.Code);
    end;

    local procedure GetCustomerPostingGroup(): Code[20]
    var
        CustomerPostingGroup: Record "Customer Posting Group";
    begin
        CustomerPostingGroup.FindFirst();
        exit(CustomerPostingGroup.Code);
    end;
}