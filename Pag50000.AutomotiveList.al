page 50000 "Automotive List"
{
    Caption = 'Automotive List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Automotive;
    Editable = false;
    CardPageId = "Automotive Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MyXMLPort)
            {
                ApplicationArea = All;
                RunObject = xmlport MyXmlport;
            }

            action(ExportContacts)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                    XmlExportContact: XmlPort "Export Contact";
                    InStr: InStream;
                    OutStr: OutStream;
                    FileName: Text;
                begin
                    begin
                        FileName := 'ExportContacts.xml';

                        TempBlob.CreateOutStream(OutStr);
                        XmlExportContact.SetDestination(OutStr);
                        XmlExportContact.Export();

                        TempBlob.CreateInStream(InStr);
                        File.DownloadFromStream(InStr, 'Download XML Export', '',
                                                FileManagement.GetToFilterText('', FileName),
                                                FileName);
                    end;
                end;
            }
        }
    }
}