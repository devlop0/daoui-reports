unit PrintingAdapters;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os;

type
  {Class forward declarations}
  JPrintPdfDocumentAdapter = interface; {sk/winsoft/android/printing/PrintPdfDocumentAdapter}
  JPrintPdfFileDocumentAdapter = interface; {sk/winsoft/android/printing/PrintPdfFileDocumentAdapter}

  JPrintPdfDocumentAdapterClass = interface(JObjectClass)
    ['{F14009C3-C4D8-40CE-8091-116E01647959}']
    {Methods}
    function init(param0: JPdfDocument {android/graphics/pdf/PdfDocument}): JPrintPdfDocumentAdapter; cdecl;
  end;

  [JavaSignature('sk/winsoft/android/printing/PrintPdfDocumentAdapter')]
  JPrintPdfDocumentAdapter = interface(JObject)
    ['{5958CD08-8625-420F-B3B5-34045AB4A346}']
    {Methods}
    procedure onLayout(param0: JObject {android/print/PrintAttributes}; param1: JObject {android/print/PrintAttributes}; param2: JCancellationSignal; param3: JObject {android/print/PrintDocumentAdapter_LayoutResultCallback}; param4: JBundle); cdecl;
    procedure onWrite(param0: TJavaObjectArray<JObject {android/print/PageRange}>; param1: JParcelFileDescriptor; param2: JCancellationSignal; param3: JObject {android/print/PrintDocumentAdapter_WriteResultCallback}); cdecl;
  end;

  TJPrintPdfDocumentAdapter = class(TJavaGenericImport<JPrintPdfDocumentAdapterClass, JPrintPdfDocumentAdapter>)
  end;

  JPrintPdfFileDocumentAdapterClass = interface(JObjectClass)
    ['{8301964E-EA4A-4E50-93FC-241BD2E1DED7}']
    {Methods}
    function init(param0: JString): JPrintPdfFileDocumentAdapter; cdecl;
  end;

  [JavaSignature('sk/winsoft/android/printing/PrintPdfFileDocumentAdapter')]
  JPrintPdfFileDocumentAdapter = interface(JObject)
    ['{649E5DB4-6509-4961-AFF5-E97580847ABA}']
    {Methods}
    procedure onLayout(param0: JObject {android/print/PrintAttributes}; param1: JObject {android/print/PrintAttributes}; param2: JCancellationSignal; param3: JObject {android/print/PrintDocumentAdapter_LayoutResultCallback}; param4: JBundle); cdecl;
    procedure onWrite(param0: TJavaObjectArray<JObject {android/print/PageRange}>; param1: JParcelFileDescriptor; param2: JCancellationSignal; param3: JObject {android/print/PrintDocumentAdapter_WriteResultCallback}); cdecl;
  end;

  TJPrintPdfFileDocumentAdapter = class(TJavaGenericImport<JPrintPdfFileDocumentAdapterClass, JPrintPdfFileDocumentAdapter>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('PrintingAdapters.JPrintPdfDocumentAdapter', TypeInfo(PrintingAdapters.JPrintPdfDocumentAdapter));
  TRegTypes.RegisterType('PrintingAdapters.JPrintPdfFileDocumentAdapter', TypeInfo(PrintingAdapters.JPrintPdfFileDocumentAdapter));
end;

initialization
  RegisterTypes;
end.