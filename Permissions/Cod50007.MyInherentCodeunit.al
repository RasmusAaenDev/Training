codeunit 50007 MyInherentCodeunit
{
    [InherentPermissions(PermissionObjectType::TableData, Database::Automotive, 'r', InherentPermissionsScope::Both)]
    procedure GetAutomotiveFuelType(AutomotiveCode: Code[20]): Text
    var
        Automotive: Record Automotive;
    begin
        Automotive.Get(AutomotiveCode);
        exit(Format(Automotive."Fuel Type"));
    end;
}