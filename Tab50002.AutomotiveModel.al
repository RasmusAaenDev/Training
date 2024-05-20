table 50002 "Automotive Model"
{
    Caption = 'Automotive Model';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Model Code"; Code[20])
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
        key(Key1; "Model Code")
        {
            Clustered = true;
        }
    }
}