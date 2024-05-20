codeunit 50105 "EDocument My" implements "E-Document"
{
    procedure Check(var SourceDocumentHeader: RecordRef; EDocumentService: Record "E-Document Service"; EDocumentProcessingPhase: enum Microsoft.eServices.EDocument."E-Document Processing Phase")
    var
        SalesHeader: Record "Sales Header";
        EDocPEPPOLBIS30: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        case SourceDocumentHeader.Number of
            Database::"Sales Header":
                case EDocumentProcessingPhase of
                    EDocumentProcessingPhase::Release:
                        begin
                            SourceDocumentHeader.SetTable(SalesHeader);
                            SalesHeader.TestField("Your Reference");
                        end;
                end;
        end;

        EDocPEPPOLBIS30.Check(SourceDocumentHeader, EDocumentService, EDocumentProcessingPhase);
    end;

    procedure Create(EDocumentService: Record "E-Document Service"; var EDocument: Record "E-Document"; var SourceDocumentHeader: RecordRef; var SourceDocumentLines: RecordRef; var TempBlob: codeunit System.Utilities."Temp Blob")
    var
        EDocPEPPOLBIS30: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        EDocPEPPOLBIS30.Create(EDocumentService, EDocument, SourceDocumentHeader, SourceDocumentLines, TempBlob);
    end;

    procedure CreateBatch(EDocumentService: Record "E-Document Service"; var EDocuments: Record "E-Document"; var SourceDocumentHeaders: RecordRef; var SourceDocumentsLines: RecordRef; var TempBlob: codeunit System.Utilities."Temp Blob")
    var
        EDocPEPPOLBIS30: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        EDocPEPPOLBIS30.CreateBatch(EDocumentService, EDocuments, SourceDocumentHeaders, SourceDocumentsLines, TempBlob);
    end;

    procedure GetBasicInfoFromReceivedDocument(var EDocument: Record "E-Document"; var TempBlob: codeunit System.Utilities."Temp Blob")
    var
        EDocPEPPOLBIS30: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        EDocPEPPOLBIS30.GetBasicInfoFromReceivedDocument(EDocument, TempBlob);
    end;

    procedure GetCompleteInfoFromReceivedDocument(var EDocument: Record "E-Document"; var CreatedDocumentHeader: RecordRef; var CreatedDocumentLines: RecordRef; var TempBlob: codeunit System.Utilities."Temp Blob")
    var
        EDocPEPPOLBIS30: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        EDocPEPPOLBIS30.GetCompleteInfoFromReceivedDocument(EDocument, CreatedDocumentHeader, CreatedDocumentLines, TempBlob);
    end;
}