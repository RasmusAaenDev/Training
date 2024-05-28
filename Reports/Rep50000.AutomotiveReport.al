report 50000 AutomotiveReport
{
    Caption = 'Automotive Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;

    dataset
    {
        dataitem(Automotive; Automotive)
        {

            column(No_Automotive; "No.")
            {
            }
            column(Description_Automotive; Description)
            {
            }
            column(Manufacturer_Automotive; Manufacturer)
            {
            }
            column(Model_Automotive; Model)
            {
            }
            column(FuelType_Automotive; "Fuel Type")
            {
            }
            column(Year_Automotive; Year)
            {
            }
            column(No_AutomotiveCpt; FieldCaption("No."))
            {
            }
            column(Description_AutomotiveCpt; FieldCaption(Description))
            {
            }
            column(Manufacturer_AutomotiveCpt; FieldCaption(Manufacturer))
            {
            }
            column(Model_AutomotiveCpt; FieldCaption(Model))
            {
            }
            column(FuelType_AutomotiveCpt; FieldCaption("Fuel Type"))
            {
            }
            column(Year_AutomotiveCpt; FieldCaption(Year))
            {
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.Language := LanguageCU.GetLanguageIdOrDefault('DK');
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Automotive)
                {
                    field(Name; Automotive.Manufacturer)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = './Reports/Automotives.docx';
        }

        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = './Reports/Automotives.xlsx';
        }
    }
    labels
    {
        DocumentTitle = 'Registered Automotives';
    }
    var
        LanguageCU: Codeunit Language;
}