table 50100 "Automotive"
{
    Caption = 'Automotive';
    DataClassification = CustomerContent;
    DataCaptionFields = "No.", Description;
    LookupPageId = "Automotive List";
    DrillDownPageId = "Automotive List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            TableRelation = "Automotive Manufacturer";
        }
        field(4; Model; Code[20])
        {
            Caption = 'Model';
            TableRelation = "Automotive Model";
        }
        field(5; "Year"; Integer)
        {
            Caption = 'Year';
            Description = 'Manufacturing Year';
            InitValue = 2024;
        }
        field(6; "Fuel Type"; Enum "Fuel Type")
        {
            Caption = 'Fuel Type';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key2; Manufacturer, Model)
        {

        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, Manufacturer)
        { }
        fieldgroup(Brick; "No.", Description, Manufacturer, Model)
        { }
    }
}