codeunit 50000 "Car Factory"
{
    procedure InsertGasolineCar(No: Code[20]; Description: Text; Manufacturer: Code[20]; Model: Code[20]; Year: Integer)
    var
        CarFactoryImpl: Codeunit "Car Factory Impl.";
    begin
        CarFactoryImpl.InsertGasolineCar(No, Description, Manufacturer, Model, Year);
    end;
}