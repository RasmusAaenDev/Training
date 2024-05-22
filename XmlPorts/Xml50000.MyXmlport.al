xmlport 50000 MyXmlport
{
    Direction = Export;
    FileName = 'MyXMLFile.xml';

    schema
    {
        textelement(NodeName1)
        {
            XmlName = 'root';

            tableelement(Automotive; Automotive)
            {
                // AutoUpdate = true;
                // AutoReplace = true;
                // AutoSave = true; 

                fieldattribute(No; Automotive."No.") { }

                fieldelement(Description; Automotive.Description)
                {
                    // MinOccurs = 1;
                }

                fieldelement(FuelType; Automotive."Fuel Type") { }

                textelement(Spec)
                {
                    XmlName = 'Spec';

                    fieldelement(Model; Automotive.Model)
                    {
                        fieldattribute(Year; Automotive.Year) { }
                        fieldattribute(Manufacturer; Automotive.Manufacturer) { }
                    }
                }
            }
        }
    }
}