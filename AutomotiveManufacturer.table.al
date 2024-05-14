table 50101 "Automotive Manufacturer"
{
    Caption = 'Automotive Manufacturer';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Manufacturer Code"; Code[20])
        {
            DataClassification = SystemMetadata;

        }
        field(2; Description; Text[100])
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Manufacturer Code")
        {
            Clustered = true;
        }
    }
}