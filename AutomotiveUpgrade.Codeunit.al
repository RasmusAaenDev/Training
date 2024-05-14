codeunit 50102 "Automotive Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        Automotive: Record Automotive;
        AutomotiveManufacturer: Record "Automotive Manufacturer";
        AutomotiveModel: Record "Automotive Model";
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(GetAutomotiveModelMakeUpgradeTag()) then
            exit;

        if Automotive.FindSet() then
            repeat
                if not AutomotiveManufacturer.Get(Automotive.Manufacturer) then
                    InsertAutomotiveManufacturer(Automotive.Manufacturer);

                if not AutomotiveModel.Get(Automotive.Model) then
                    InsertAutomotiveModel(Automotive.Model);
            until Automotive.Next() = 0;

        UpgradeTag.SetUpgradeTag(GetAutomotiveModelMakeUpgradeTag());
    end;

    local procedure InsertAutomotiveManufacturer(Manufacturer: Code[20])
    var
        AutomotiveManufacturer: Record "Automotive Manufacturer";
    begin
        AutomotiveManufacturer.Init();
        AutomotiveManufacturer."Manufacturer Code" := Manufacturer;
        AutomotiveManufacturer.Description := Manufacturer;
        AutomotiveManufacturer.Insert();
    end;

    local procedure InsertAutomotiveModel(Model: Code[20])
    var
        AutomotiveModel: Record "Automotive Model";
    begin
        AutomotiveModel.Init();
        AutomotiveModel."Model Code" := Model;
        AutomotiveModel.Description := Model;
        AutomotiveModel.Insert();
    end;

    procedure GetAutomotiveModelMakeUpgradeTag(): Code[250]
    begin
        exit('Automotive-Model-Make-20240523');
    end;
}