codeunit 50101 "Car Factory Impl."
{
    Access = Internal;

    procedure InsertGasolineCar(No: Code[20]; Description: Text; Manufacturer: Code[20]; Model: Code[20]; Year: Integer)
    var
        Automotive: Record Automotive;
    begin
        Automotive.Init();
        Automotive.Validate("No.", No);
        Automotive.Validate(Description, Description);
        Automotive.Validate(Manufacturer, Manufacturer);
        Automotive.Validate(Model, Model);
        Automotive.Validate(Year, Year);
        Automotive.Validate("Fuel Type", "Fuel Type"::Gasoline);
        Automotive.Insert();
    end;
}