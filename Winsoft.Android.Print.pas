unit Winsoft.Android.Print;

//{$define TRIAL}

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Winsoft.Android.PrintHelper,
  Androidapi.JNI.Net,
  FMX.Graphics;

type
  JPageRange = interface; {android/print/PageRange}
  JPrintAttributes = interface; {android/print/PrintAttributes}
  JPrintAttributes_Builder = interface; {android/print/PrintAttributes$Builder}
  JPrintAttributes_Margins = interface; {android/print/PrintAttributes$Margins}
  JPrintAttributes_MediaSize = interface; {android/print/PrintAttributes$MediaSize}
  JPrintAttributes_Resolution = interface; {android/print/PrintAttributes$Resolution}
  JPrintDocumentAdapter = interface; {android/print/PrintDocumentAdapter}
  JPrintDocumentAdapter_LayoutResultCallback = interface; {android/print/PrintDocumentAdapter$LayoutResultCallback}
  JPrintDocumentAdapter_WriteResultCallback = interface; {android/print/PrintDocumentAdapter$WriteResultCallback}
  JPrintDocumentInfo = interface; {android/print/PrintDocumentInfo}
  JPrintDocumentInfo_Builder = interface; {android/print/PrintDocumentInfo$Builder}
  JPrintedPdfDocument = interface; {android/print/pdf/PrintedPdfDocument}
  JPrinterCapabilitiesInfo = interface; {android/print/PrinterCapabilitiesInfo}
  JPrinterCapabilitiesInfo_Builder = interface; {android/print/PrinterCapabilitiesInfo$Builder}
  JPrinterId = interface; {android/print/PrinterId}
  JPrinterInfo = interface; {android/print/PrinterInfo}
  JPrinterInfo_Builder = interface; {android/print/PrinterInfo$Builder}
  JPrintJob = interface; {android/print/PrintJob}
  JPrintJobId = interface; {android/print/PrintJobId}
  JPrintJobInfo = interface; {android/print/PrintJobInfo}
  JPrintJobInfo_Builder = interface; {android/print/PrintJobInfo$Builder}
  JPrintManager = interface; {android/print/PrintManager}

  JPageRangeClass = interface(JObjectClass)
    ['{2446BB33-2374-44C6-9B72-F48B676A68AB}']
    function _GetALL_PAGES: JPageRange;
    procedure _SetALL_PAGES(Value: JPageRange);
    function _GetCREATOR: JParcelable_Creator;
    procedure _SetCREATOR(Value: JParcelable_Creator);
    function init(start: Integer; &end: Integer): JPageRange; cdecl;
    property ALL_PAGES: JPageRange read _GetALL_PAGES write _SetALL_PAGES;
    property CREATOR: JParcelable_Creator read _GetCREATOR write _SetCREATOR;
  end;

  [JavaSignature('android/print/PageRange')]
  JPageRange = interface(JObject)
    ['{F8F786A8-E24C-40E5-A8C3-5DF12C3B14F8}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getEnd: Integer; cdecl;
    function getStart: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;

  TJPageRange = class(TJavaGenericImport<JPageRangeClass, JPageRange>)
  end;

  JPrintAttributesClass = interface(JObjectClass)
    ['{619831B2-DC08-4380-A0F6-3E4121C1B860}']
    function _GetCOLOR_MODE_COLOR: Integer;
    function _GetCOLOR_MODE_MONOCHROME: Integer;
    function _GetCREATOR: JParcelable_Creator;
    procedure _SetCREATOR(Value: JParcelable_Creator);
    function _GetDUPLEX_MODE_LONG_EDGE: Integer;
    function _GetDUPLEX_MODE_NONE: Integer;
    function _GetDUPLEX_MODE_SHORT_EDGE: Integer;
    property COLOR_MODE_COLOR: Integer read _GetCOLOR_MODE_COLOR;
    property COLOR_MODE_MONOCHROME: Integer read _GetCOLOR_MODE_MONOCHROME;
    property CREATOR: JParcelable_Creator read _GetCREATOR write _SetCREATOR;
    property DUPLEX_MODE_LONG_EDGE: Integer read _GetDUPLEX_MODE_LONG_EDGE;
    property DUPLEX_MODE_NONE: Integer read _GetDUPLEX_MODE_NONE;
    property DUPLEX_MODE_SHORT_EDGE: Integer read _GetDUPLEX_MODE_SHORT_EDGE;
  end;

  [JavaSignature('android/print/PrintAttributes')]
  JPrintAttributes = interface(JObject)
    ['{DB62CBAF-D48D-4CC4-A35C-3580C55E880D}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getColorMode: Integer; cdecl;
    function getDuplexMode: Integer; cdecl;
    function getMediaSize: JPrintAttributes_MediaSize; cdecl;
    function getMinMargins: JPrintAttributes_Margins; cdecl;
    function getResolution: JPrintAttributes_Resolution; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;

  TJPrintAttributes = class(TJavaGenericImport<JPrintAttributesClass, JPrintAttributes>)
  end;

  JPrintAttributes_BuilderClass = interface(JObjectClass)
    ['{47672EB9-CF01-4ABE-80FD-3E07435F5430}']
    function init: JPrintAttributes_Builder; cdecl;
  end;

  [JavaSignature('android/print/PrintAttributes$Builder')]
  JPrintAttributes_Builder = interface(JObject)
    ['{0173B28E-2EC4-42C5-BB45-41CC43673B70}']
    function build: JPrintAttributes; cdecl;
    function setColorMode(colorMode: Integer): JPrintAttributes_Builder; cdecl;
    function setDuplexMode(duplexMode: Integer): JPrintAttributes_Builder; cdecl;
    function setMediaSize(mediaSize: JPrintAttributes_MediaSize): JPrintAttributes_Builder; cdecl;
    function setMinMargins(margins: JPrintAttributes_Margins): JPrintAttributes_Builder; cdecl;
    function setResolution(resolution: JPrintAttributes_Resolution): JPrintAttributes_Builder; cdecl;
  end;

  TJPrintAttributes_Builder = class(TJavaGenericImport<JPrintAttributes_BuilderClass, JPrintAttributes_Builder>)
  end;

  JPrintAttributes_MarginsClass = interface(JObjectClass)
    ['{E5EDF420-B439-4944-A8A0-594A65797582}']
    function _GetNO_MARGINS: JPrintAttributes_Margins;
    procedure _SetNO_MARGINS(Value: JPrintAttributes_Margins);
    function init(leftMils: Integer; topMils: Integer; rightMils: Integer; bottomMils: Integer): JPrintAttributes_Margins; cdecl;
    property NO_MARGINS: JPrintAttributes_Margins read _GetNO_MARGINS write _SetNO_MARGINS;
  end;

  [JavaSignature('android/print/PrintAttributes$Margins')]
  JPrintAttributes_Margins = interface(JObject)
    ['{1A182360-A5F7-429A-82C3-4DD61B173659}']
    function equals(obj: JObject): Boolean; cdecl;
    function getBottomMils: Integer; cdecl;
    function getLeftMils: Integer; cdecl;
    function getRightMils: Integer; cdecl;
    function getTopMils: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJPrintAttributes_Margins = class(TJavaGenericImport<JPrintAttributes_MarginsClass, JPrintAttributes_Margins>)
  end;

  JPrintAttributes_MediaSizeClass = interface(JObjectClass)
    ['{84257E67-5E0D-48C8-8789-AD716502F472}']
    function _GetISO_A0: JPrintAttributes_MediaSize;
    procedure _SetISO_A0(Value: JPrintAttributes_MediaSize);
    function _GetISO_A1: JPrintAttributes_MediaSize;
    procedure _SetISO_A1(Value: JPrintAttributes_MediaSize);
    function _GetISO_A10: JPrintAttributes_MediaSize;
    procedure _SetISO_A10(Value: JPrintAttributes_MediaSize);
    function _GetISO_A2: JPrintAttributes_MediaSize;
    procedure _SetISO_A2(Value: JPrintAttributes_MediaSize);
    function _GetISO_A3: JPrintAttributes_MediaSize;
    procedure _SetISO_A3(Value: JPrintAttributes_MediaSize);
    function _GetISO_A4: JPrintAttributes_MediaSize;
    procedure _SetISO_A4(Value: JPrintAttributes_MediaSize);
    function _GetISO_A5: JPrintAttributes_MediaSize;
    procedure _SetISO_A5(Value: JPrintAttributes_MediaSize);
    function _GetISO_A6: JPrintAttributes_MediaSize;
    procedure _SetISO_A6(Value: JPrintAttributes_MediaSize);
    function _GetISO_A7: JPrintAttributes_MediaSize;
    procedure _SetISO_A7(Value: JPrintAttributes_MediaSize);
    function _GetISO_A8: JPrintAttributes_MediaSize;
    procedure _SetISO_A8(Value: JPrintAttributes_MediaSize);
    function _GetISO_A9: JPrintAttributes_MediaSize;
    procedure _SetISO_A9(Value: JPrintAttributes_MediaSize);
    function _GetISO_B0: JPrintAttributes_MediaSize;
    procedure _SetISO_B0(Value: JPrintAttributes_MediaSize);
    function _GetISO_B1: JPrintAttributes_MediaSize;
    procedure _SetISO_B1(Value: JPrintAttributes_MediaSize);
    function _GetISO_B10: JPrintAttributes_MediaSize;
    procedure _SetISO_B10(Value: JPrintAttributes_MediaSize);
    function _GetISO_B2: JPrintAttributes_MediaSize;
    procedure _SetISO_B2(Value: JPrintAttributes_MediaSize);
    function _GetISO_B3: JPrintAttributes_MediaSize;
    procedure _SetISO_B3(Value: JPrintAttributes_MediaSize);
    function _GetISO_B4: JPrintAttributes_MediaSize;
    procedure _SetISO_B4(Value: JPrintAttributes_MediaSize);
    function _GetISO_B5: JPrintAttributes_MediaSize;
    procedure _SetISO_B5(Value: JPrintAttributes_MediaSize);
    function _GetISO_B6: JPrintAttributes_MediaSize;
    procedure _SetISO_B6(Value: JPrintAttributes_MediaSize);
    function _GetISO_B7: JPrintAttributes_MediaSize;
    procedure _SetISO_B7(Value: JPrintAttributes_MediaSize);
    function _GetISO_B8: JPrintAttributes_MediaSize;
    procedure _SetISO_B8(Value: JPrintAttributes_MediaSize);
    function _GetISO_B9: JPrintAttributes_MediaSize;
    procedure _SetISO_B9(Value: JPrintAttributes_MediaSize);
    function _GetISO_C0: JPrintAttributes_MediaSize;
    procedure _SetISO_C0(Value: JPrintAttributes_MediaSize);
    function _GetISO_C1: JPrintAttributes_MediaSize;
    procedure _SetISO_C1(Value: JPrintAttributes_MediaSize);
    function _GetISO_C10: JPrintAttributes_MediaSize;
    procedure _SetISO_C10(Value: JPrintAttributes_MediaSize);
    function _GetISO_C2: JPrintAttributes_MediaSize;
    procedure _SetISO_C2(Value: JPrintAttributes_MediaSize);
    function _GetISO_C3: JPrintAttributes_MediaSize;
    procedure _SetISO_C3(Value: JPrintAttributes_MediaSize);
    function _GetISO_C4: JPrintAttributes_MediaSize;
    procedure _SetISO_C4(Value: JPrintAttributes_MediaSize);
    function _GetISO_C5: JPrintAttributes_MediaSize;
    procedure _SetISO_C5(Value: JPrintAttributes_MediaSize);
    function _GetISO_C6: JPrintAttributes_MediaSize;
    procedure _SetISO_C6(Value: JPrintAttributes_MediaSize);
    function _GetISO_C7: JPrintAttributes_MediaSize;
    procedure _SetISO_C7(Value: JPrintAttributes_MediaSize);
    function _GetISO_C8: JPrintAttributes_MediaSize;
    procedure _SetISO_C8(Value: JPrintAttributes_MediaSize);
    function _GetISO_C9: JPrintAttributes_MediaSize;
    procedure _SetISO_C9(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B0: JPrintAttributes_MediaSize;
    procedure _SetJIS_B0(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B1: JPrintAttributes_MediaSize;
    procedure _SetJIS_B1(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B10: JPrintAttributes_MediaSize;
    procedure _SetJIS_B10(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B2: JPrintAttributes_MediaSize;
    procedure _SetJIS_B2(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B3: JPrintAttributes_MediaSize;
    procedure _SetJIS_B3(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B4: JPrintAttributes_MediaSize;
    procedure _SetJIS_B4(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B5: JPrintAttributes_MediaSize;
    procedure _SetJIS_B5(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B6: JPrintAttributes_MediaSize;
    procedure _SetJIS_B6(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B7: JPrintAttributes_MediaSize;
    procedure _SetJIS_B7(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B8: JPrintAttributes_MediaSize;
    procedure _SetJIS_B8(Value: JPrintAttributes_MediaSize);
    function _GetJIS_B9: JPrintAttributes_MediaSize;
    procedure _SetJIS_B9(Value: JPrintAttributes_MediaSize);
    function _GetJIS_EXEC: JPrintAttributes_MediaSize;
    procedure _SetJIS_EXEC(Value: JPrintAttributes_MediaSize);
    function _GetJPN_CHOU2: JPrintAttributes_MediaSize;
    procedure _SetJPN_CHOU2(Value: JPrintAttributes_MediaSize);
    function _GetJPN_CHOU3: JPrintAttributes_MediaSize;
    procedure _SetJPN_CHOU3(Value: JPrintAttributes_MediaSize);
    function _GetJPN_CHOU4: JPrintAttributes_MediaSize;
    procedure _SetJPN_CHOU4(Value: JPrintAttributes_MediaSize);
    function _GetJPN_HAGAKI: JPrintAttributes_MediaSize;
    procedure _SetJPN_HAGAKI(Value: JPrintAttributes_MediaSize);
    function _GetJPN_KAHU: JPrintAttributes_MediaSize;
    procedure _SetJPN_KAHU(Value: JPrintAttributes_MediaSize);
    function _GetJPN_KAKU2: JPrintAttributes_MediaSize;
    procedure _SetJPN_KAKU2(Value: JPrintAttributes_MediaSize);
    function _GetJPN_OUFUKU: JPrintAttributes_MediaSize;
    procedure _SetJPN_OUFUKU(Value: JPrintAttributes_MediaSize);
    function _GetJPN_YOU4: JPrintAttributes_MediaSize;
    procedure _SetJPN_YOU4(Value: JPrintAttributes_MediaSize);
    function _GetNA_FOOLSCAP: JPrintAttributes_MediaSize;
    procedure _SetNA_FOOLSCAP(Value: JPrintAttributes_MediaSize);
    function _GetNA_GOVT_LETTER: JPrintAttributes_MediaSize;
    procedure _SetNA_GOVT_LETTER(Value: JPrintAttributes_MediaSize);
    function _GetNA_INDEX_3X5: JPrintAttributes_MediaSize;
    procedure _SetNA_INDEX_3X5(Value: JPrintAttributes_MediaSize);
    function _GetNA_INDEX_4X6: JPrintAttributes_MediaSize;
    procedure _SetNA_INDEX_4X6(Value: JPrintAttributes_MediaSize);
    function _GetNA_INDEX_5X8: JPrintAttributes_MediaSize;
    procedure _SetNA_INDEX_5X8(Value: JPrintAttributes_MediaSize);
    function _GetNA_JUNIOR_LEGAL: JPrintAttributes_MediaSize;
    procedure _SetNA_JUNIOR_LEGAL(Value: JPrintAttributes_MediaSize);
    function _GetNA_LEDGER: JPrintAttributes_MediaSize;
    procedure _SetNA_LEDGER(Value: JPrintAttributes_MediaSize);
    function _GetNA_LEGAL: JPrintAttributes_MediaSize;
    procedure _SetNA_LEGAL(Value: JPrintAttributes_MediaSize);
    function _GetNA_LETTER: JPrintAttributes_MediaSize;
    procedure _SetNA_LETTER(Value: JPrintAttributes_MediaSize);
    function _GetNA_MONARCH: JPrintAttributes_MediaSize;
    procedure _SetNA_MONARCH(Value: JPrintAttributes_MediaSize);
    function _GetNA_QUARTO: JPrintAttributes_MediaSize;
    procedure _SetNA_QUARTO(Value: JPrintAttributes_MediaSize);
    function _GetNA_TABLOID: JPrintAttributes_MediaSize;
    procedure _SetNA_TABLOID(Value: JPrintAttributes_MediaSize);
    function _GetOM_DAI_PA_KAI: JPrintAttributes_MediaSize;
    procedure _SetOM_DAI_PA_KAI(Value: JPrintAttributes_MediaSize);
    function _GetOM_JUURO_KU_KAI: JPrintAttributes_MediaSize;
    procedure _SetOM_JUURO_KU_KAI(Value: JPrintAttributes_MediaSize);
    function _GetOM_PA_KAI: JPrintAttributes_MediaSize;
    procedure _SetOM_PA_KAI(Value: JPrintAttributes_MediaSize);
    function _GetPRC_1: JPrintAttributes_MediaSize;
    procedure _SetPRC_1(Value: JPrintAttributes_MediaSize);
    function _GetPRC_10: JPrintAttributes_MediaSize;
    procedure _SetPRC_10(Value: JPrintAttributes_MediaSize);
    function _GetPRC_16K: JPrintAttributes_MediaSize;
    procedure _SetPRC_16K(Value: JPrintAttributes_MediaSize);
    function _GetPRC_2: JPrintAttributes_MediaSize;
    procedure _SetPRC_2(Value: JPrintAttributes_MediaSize);
    function _GetPRC_3: JPrintAttributes_MediaSize;
    procedure _SetPRC_3(Value: JPrintAttributes_MediaSize);
    function _GetPRC_4: JPrintAttributes_MediaSize;
    procedure _SetPRC_4(Value: JPrintAttributes_MediaSize);
    function _GetPRC_5: JPrintAttributes_MediaSize;
    procedure _SetPRC_5(Value: JPrintAttributes_MediaSize);
    function _GetPRC_6: JPrintAttributes_MediaSize;
    procedure _SetPRC_6(Value: JPrintAttributes_MediaSize);
    function _GetPRC_7: JPrintAttributes_MediaSize;
    procedure _SetPRC_7(Value: JPrintAttributes_MediaSize);
    function _GetPRC_8: JPrintAttributes_MediaSize;
    procedure _SetPRC_8(Value: JPrintAttributes_MediaSize);
    function _GetPRC_9: JPrintAttributes_MediaSize;
    procedure _SetPRC_9(Value: JPrintAttributes_MediaSize);
    function _GetROC_16K: JPrintAttributes_MediaSize;
    procedure _SetROC_16K(Value: JPrintAttributes_MediaSize);
    function _GetROC_8K: JPrintAttributes_MediaSize;
    procedure _SetROC_8K(Value: JPrintAttributes_MediaSize);
    function _GetUNKNOWN_LANDSCAPE: JPrintAttributes_MediaSize;
    procedure _SetUNKNOWN_LANDSCAPE(Value: JPrintAttributes_MediaSize);
    function _GetUNKNOWN_PORTRAIT: JPrintAttributes_MediaSize;
    procedure _SetUNKNOWN_PORTRAIT(Value: JPrintAttributes_MediaSize);
    function init(id: JString; &label: JString; widthMils: Integer; heightMils: Integer): JPrintAttributes_MediaSize; cdecl;
    property ISO_A0: JPrintAttributes_MediaSize read _GetISO_A0 write _SetISO_A0;
    property ISO_A1: JPrintAttributes_MediaSize read _GetISO_A1 write _SetISO_A1;
    property ISO_A10: JPrintAttributes_MediaSize read _GetISO_A10 write _SetISO_A10;
    property ISO_A2: JPrintAttributes_MediaSize read _GetISO_A2 write _SetISO_A2;
    property ISO_A3: JPrintAttributes_MediaSize read _GetISO_A3 write _SetISO_A3;
    property ISO_A4: JPrintAttributes_MediaSize read _GetISO_A4 write _SetISO_A4;
    property ISO_A5: JPrintAttributes_MediaSize read _GetISO_A5 write _SetISO_A5;
    property ISO_A6: JPrintAttributes_MediaSize read _GetISO_A6 write _SetISO_A6;
    property ISO_A7: JPrintAttributes_MediaSize read _GetISO_A7 write _SetISO_A7;
    property ISO_A8: JPrintAttributes_MediaSize read _GetISO_A8 write _SetISO_A8;
    property ISO_A9: JPrintAttributes_MediaSize read _GetISO_A9 write _SetISO_A9;
    property ISO_B0: JPrintAttributes_MediaSize read _GetISO_B0 write _SetISO_B0;
    property ISO_B1: JPrintAttributes_MediaSize read _GetISO_B1 write _SetISO_B1;
    property ISO_B10: JPrintAttributes_MediaSize read _GetISO_B10 write _SetISO_B10;
    property ISO_B2: JPrintAttributes_MediaSize read _GetISO_B2 write _SetISO_B2;
    property ISO_B3: JPrintAttributes_MediaSize read _GetISO_B3 write _SetISO_B3;
    property ISO_B4: JPrintAttributes_MediaSize read _GetISO_B4 write _SetISO_B4;
    property ISO_B5: JPrintAttributes_MediaSize read _GetISO_B5 write _SetISO_B5;
    property ISO_B6: JPrintAttributes_MediaSize read _GetISO_B6 write _SetISO_B6;
    property ISO_B7: JPrintAttributes_MediaSize read _GetISO_B7 write _SetISO_B7;
    property ISO_B8: JPrintAttributes_MediaSize read _GetISO_B8 write _SetISO_B8;
    property ISO_B9: JPrintAttributes_MediaSize read _GetISO_B9 write _SetISO_B9;
    property ISO_C0: JPrintAttributes_MediaSize read _GetISO_C0 write _SetISO_C0;
    property ISO_C1: JPrintAttributes_MediaSize read _GetISO_C1 write _SetISO_C1;
    property ISO_C10: JPrintAttributes_MediaSize read _GetISO_C10 write _SetISO_C10;
    property ISO_C2: JPrintAttributes_MediaSize read _GetISO_C2 write _SetISO_C2;
    property ISO_C3: JPrintAttributes_MediaSize read _GetISO_C3 write _SetISO_C3;
    property ISO_C4: JPrintAttributes_MediaSize read _GetISO_C4 write _SetISO_C4;
    property ISO_C5: JPrintAttributes_MediaSize read _GetISO_C5 write _SetISO_C5;
    property ISO_C6: JPrintAttributes_MediaSize read _GetISO_C6 write _SetISO_C6;
    property ISO_C7: JPrintAttributes_MediaSize read _GetISO_C7 write _SetISO_C7;
    property ISO_C8: JPrintAttributes_MediaSize read _GetISO_C8 write _SetISO_C8;
    property ISO_C9: JPrintAttributes_MediaSize read _GetISO_C9 write _SetISO_C9;
    property JIS_B0: JPrintAttributes_MediaSize read _GetJIS_B0 write _SetJIS_B0;
    property JIS_B1: JPrintAttributes_MediaSize read _GetJIS_B1 write _SetJIS_B1;
    property JIS_B10: JPrintAttributes_MediaSize read _GetJIS_B10 write _SetJIS_B10;
    property JIS_B2: JPrintAttributes_MediaSize read _GetJIS_B2 write _SetJIS_B2;
    property JIS_B3: JPrintAttributes_MediaSize read _GetJIS_B3 write _SetJIS_B3;
    property JIS_B4: JPrintAttributes_MediaSize read _GetJIS_B4 write _SetJIS_B4;
    property JIS_B5: JPrintAttributes_MediaSize read _GetJIS_B5 write _SetJIS_B5;
    property JIS_B6: JPrintAttributes_MediaSize read _GetJIS_B6 write _SetJIS_B6;
    property JIS_B7: JPrintAttributes_MediaSize read _GetJIS_B7 write _SetJIS_B7;
    property JIS_B8: JPrintAttributes_MediaSize read _GetJIS_B8 write _SetJIS_B8;
    property JIS_B9: JPrintAttributes_MediaSize read _GetJIS_B9 write _SetJIS_B9;
    property JIS_EXEC: JPrintAttributes_MediaSize read _GetJIS_EXEC write _SetJIS_EXEC;
    property JPN_CHOU2: JPrintAttributes_MediaSize read _GetJPN_CHOU2 write _SetJPN_CHOU2;
    property JPN_CHOU3: JPrintAttributes_MediaSize read _GetJPN_CHOU3 write _SetJPN_CHOU3;
    property JPN_CHOU4: JPrintAttributes_MediaSize read _GetJPN_CHOU4 write _SetJPN_CHOU4;
    property JPN_HAGAKI: JPrintAttributes_MediaSize read _GetJPN_HAGAKI write _SetJPN_HAGAKI;
    property JPN_KAHU: JPrintAttributes_MediaSize read _GetJPN_KAHU write _SetJPN_KAHU;
    property JPN_KAKU2: JPrintAttributes_MediaSize read _GetJPN_KAKU2 write _SetJPN_KAKU2;
    property JPN_OUFUKU: JPrintAttributes_MediaSize read _GetJPN_OUFUKU write _SetJPN_OUFUKU;
    property JPN_YOU4: JPrintAttributes_MediaSize read _GetJPN_YOU4 write _SetJPN_YOU4;
    property NA_FOOLSCAP: JPrintAttributes_MediaSize read _GetNA_FOOLSCAP write _SetNA_FOOLSCAP;
    property NA_GOVT_LETTER: JPrintAttributes_MediaSize read _GetNA_GOVT_LETTER write _SetNA_GOVT_LETTER;
    property NA_INDEX_3X5: JPrintAttributes_MediaSize read _GetNA_INDEX_3X5 write _SetNA_INDEX_3X5;
    property NA_INDEX_4X6: JPrintAttributes_MediaSize read _GetNA_INDEX_4X6 write _SetNA_INDEX_4X6;
    property NA_INDEX_5X8: JPrintAttributes_MediaSize read _GetNA_INDEX_5X8 write _SetNA_INDEX_5X8;
    property NA_JUNIOR_LEGAL: JPrintAttributes_MediaSize read _GetNA_JUNIOR_LEGAL write _SetNA_JUNIOR_LEGAL;
    property NA_LEDGER: JPrintAttributes_MediaSize read _GetNA_LEDGER write _SetNA_LEDGER;
    property NA_LEGAL: JPrintAttributes_MediaSize read _GetNA_LEGAL write _SetNA_LEGAL;
    property NA_LETTER: JPrintAttributes_MediaSize read _GetNA_LETTER write _SetNA_LETTER;
    property NA_MONARCH: JPrintAttributes_MediaSize read _GetNA_MONARCH write _SetNA_MONARCH;
    property NA_QUARTO: JPrintAttributes_MediaSize read _GetNA_QUARTO write _SetNA_QUARTO;
    property NA_TABLOID: JPrintAttributes_MediaSize read _GetNA_TABLOID write _SetNA_TABLOID;
    property OM_DAI_PA_KAI: JPrintAttributes_MediaSize read _GetOM_DAI_PA_KAI write _SetOM_DAI_PA_KAI;
    property OM_JUURO_KU_KAI: JPrintAttributes_MediaSize read _GetOM_JUURO_KU_KAI write _SetOM_JUURO_KU_KAI;
    property OM_PA_KAI: JPrintAttributes_MediaSize read _GetOM_PA_KAI write _SetOM_PA_KAI;
    property PRC_1: JPrintAttributes_MediaSize read _GetPRC_1 write _SetPRC_1;
    property PRC_10: JPrintAttributes_MediaSize read _GetPRC_10 write _SetPRC_10;
    property PRC_16K: JPrintAttributes_MediaSize read _GetPRC_16K write _SetPRC_16K;
    property PRC_2: JPrintAttributes_MediaSize read _GetPRC_2 write _SetPRC_2;
    property PRC_3: JPrintAttributes_MediaSize read _GetPRC_3 write _SetPRC_3;
    property PRC_4: JPrintAttributes_MediaSize read _GetPRC_4 write _SetPRC_4;
    property PRC_5: JPrintAttributes_MediaSize read _GetPRC_5 write _SetPRC_5;
    property PRC_6: JPrintAttributes_MediaSize read _GetPRC_6 write _SetPRC_6;
    property PRC_7: JPrintAttributes_MediaSize read _GetPRC_7 write _SetPRC_7;
    property PRC_8: JPrintAttributes_MediaSize read _GetPRC_8 write _SetPRC_8;
    property PRC_9: JPrintAttributes_MediaSize read _GetPRC_9 write _SetPRC_9;
    property ROC_16K: JPrintAttributes_MediaSize read _GetROC_16K write _SetROC_16K;
    property ROC_8K: JPrintAttributes_MediaSize read _GetROC_8K write _SetROC_8K;
    property UNKNOWN_LANDSCAPE: JPrintAttributes_MediaSize read _GetUNKNOWN_LANDSCAPE write _SetUNKNOWN_LANDSCAPE;
    property UNKNOWN_PORTRAIT: JPrintAttributes_MediaSize read _GetUNKNOWN_PORTRAIT write _SetUNKNOWN_PORTRAIT;
  end;

  [JavaSignature('android/print/PrintAttributes$MediaSize')]
  JPrintAttributes_MediaSize = interface(JObject)
    ['{9A31CA3B-6518-4AA8-965C-59F9045A9D73}']
    function asLandscape: JPrintAttributes_MediaSize; cdecl;
    function asPortrait: JPrintAttributes_MediaSize; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getHeightMils: Integer; cdecl;
    function getId: JString; cdecl;
    function getLabel(packageManager: JPackageManager): JString; cdecl;
    function getWidthMils: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isPortrait: Boolean; cdecl;
    function toString: JString; cdecl;
  end;

  TJPrintAttributes_MediaSize = class(TJavaGenericImport<JPrintAttributes_MediaSizeClass, JPrintAttributes_MediaSize>)
  end;

  JPrintAttributes_ResolutionClass = interface(JObjectClass)
    ['{609ECA6D-5AE2-4C04-9716-5D4C19D0F16C}']
    function init(id: JString; &label: JString; horizontalDpi: Integer; verticalDpi: Integer): JPrintAttributes_Resolution; cdecl;
  end;

  [JavaSignature('android/print/PrintAttributes$Resolution')]
  JPrintAttributes_Resolution = interface(JObject)
    ['{F742005A-362F-406A-AF61-0BB8EC9BABBF}']
    function equals(obj: JObject): Boolean; cdecl;
    function getHorizontalDpi: Integer; cdecl;
    function getId: JString; cdecl;
    function getLabel: JString; cdecl;
    function getVerticalDpi: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJPrintAttributes_Resolution = class(TJavaGenericImport<JPrintAttributes_ResolutionClass, JPrintAttributes_Resolution>)
  end;

  JPrintDocumentAdapterClass = interface(JObjectClass)
    ['{EB5C1324-7E7A-4A77-9EDC-62BB2C0DAE99}']
    function _GetEXTRA_PRINT_PREVIEW: JString;
    function init: JPrintDocumentAdapter; cdecl;
    property EXTRA_PRINT_PREVIEW: JString read _GetEXTRA_PRINT_PREVIEW;
  end;

  [JavaSignature('android/print/PrintDocumentAdapter')]
  JPrintDocumentAdapter = interface(JObject)
    ['{BC7154EA-5A24-4452-819D-F8EB3539035A}']
    procedure onFinish; cdecl;
    procedure onLayout(param0: JPrintAttributes; param1: JPrintAttributes; param2: JCancellationSignal; param3: JPrintDocumentAdapter_LayoutResultCallback; param4: JBundle); cdecl;
    procedure onStart; cdecl;
    procedure onWrite(param0: TJavaObjectArray<JPageRange>; param1: JParcelFileDescriptor; param2: JCancellationSignal; param3: JPrintDocumentAdapter_WriteResultCallback); cdecl;
  end;

  TJPrintDocumentAdapter = class(TJavaGenericImport<JPrintDocumentAdapterClass, JPrintDocumentAdapter>)
  end;

  JPrintDocumentAdapter_LayoutResultCallbackClass = interface(JObjectClass)
    ['{BD859B10-343B-490B-A843-C2C36A999451}']
  end;

  [JavaSignature('android/print/PrintDocumentAdapter$LayoutResultCallback')]
  JPrintDocumentAdapter_LayoutResultCallback = interface(JObject)
    ['{4147E8AB-F1D7-4457-86D5-1F08D5A35161}']
    procedure onLayoutCancelled; cdecl;
    procedure onLayoutFailed(error: JCharSequence); cdecl;
    procedure onLayoutFinished(info: JPrintDocumentInfo; changed: Boolean); cdecl;
  end;

  TJPrintDocumentAdapter_LayoutResultCallback = class(TJavaGenericImport<JPrintDocumentAdapter_LayoutResultCallbackClass, JPrintDocumentAdapter_LayoutResultCallback>)
  end;

  JPrintDocumentAdapter_WriteResultCallbackClass = interface(JObjectClass)
    ['{C59DC2E5-C950-46C1-9B4D-500F39D903EB}']
  end;

  [JavaSignature('android/print/PrintDocumentAdapter$WriteResultCallback')]
  JPrintDocumentAdapter_WriteResultCallback = interface(JObject)
    ['{70329275-8EE9-4F52-B70E-0627D16242D2}']
    procedure onWriteCancelled; cdecl;
    procedure onWriteFailed(error: JCharSequence); cdecl;
    procedure onWriteFinished(pages: TJavaObjectArray<JPageRange>); cdecl;
  end;

  TJPrintDocumentAdapter_WriteResultCallback = class(TJavaGenericImport<JPrintDocumentAdapter_WriteResultCallbackClass, JPrintDocumentAdapter_WriteResultCallback>)
  end;

  JPrintDocumentInfoClass = interface(JObjectClass)
    ['{25BC6FF4-75B7-43E8-9610-8DF62E9BF1AF}']
    function _GetCONTENT_TYPE_DOCUMENT: Integer;
    function _GetCONTENT_TYPE_PHOTO: Integer;
    function _GetCONTENT_TYPE_UNKNOWN: Integer;
    function _GetCREATOR: JParcelable_Creator;
    procedure _SetCREATOR(Value: JParcelable_Creator);
    function _GetPAGE_COUNT_UNKNOWN: Integer;
    property CONTENT_TYPE_DOCUMENT: Integer read _GetCONTENT_TYPE_DOCUMENT;
    property CONTENT_TYPE_PHOTO: Integer read _GetCONTENT_TYPE_PHOTO;
    property CONTENT_TYPE_UNKNOWN: Integer read _GetCONTENT_TYPE_UNKNOWN;
    property CREATOR: JParcelable_Creator read _GetCREATOR write _SetCREATOR;
    property PAGE_COUNT_UNKNOWN: Integer read _GetPAGE_COUNT_UNKNOWN;
  end;

  [JavaSignature('android/print/PrintDocumentInfo')]
  JPrintDocumentInfo = interface(JObject)
    ['{64C3891D-622F-4935-977F-EDD28132421A}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getContentType: Integer; cdecl;
    function getDataSize: Int64; cdecl;
    function getName: JString; cdecl;
    function getPageCount: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;

  TJPrintDocumentInfo = class(TJavaGenericImport<JPrintDocumentInfoClass, JPrintDocumentInfo>)
  end;

  JPrintDocumentInfo_BuilderClass = interface(JObjectClass)
    ['{5C2B0559-5360-435B-8D27-0F09223D6B89}']
    function init(name: JString): JPrintDocumentInfo_Builder; cdecl;
  end;

  [JavaSignature('android/print/PrintDocumentInfo$Builder')]
  JPrintDocumentInfo_Builder = interface(JObject)
    ['{2960459C-CFC3-47AA-89E6-8A5FFEE64FFA}']
    function build: JPrintDocumentInfo; cdecl;
    function setContentType(&type: Integer): JPrintDocumentInfo_Builder; cdecl;
    function setPageCount(pageCount: Integer): JPrintDocumentInfo_Builder; cdecl;
  end;

  TJPrintDocumentInfo_Builder = class(TJavaGenericImport<JPrintDocumentInfo_BuilderClass, JPrintDocumentInfo_Builder>)
  end;

  JPrintedPdfDocumentClass = interface(JObjectClass {android/graphics/pdf/PdfDocument})
    ['{77C51B6B-CC96-4181-A834-0B9D22F90D50}']
    function init(context: JContext; attributes: JPrintAttributes): JPrintedPdfDocument; cdecl;
  end;

  [JavaSignature('android/print/pdf/PrintedPdfDocument')]
  JPrintedPdfDocument = interface(JObject {android/graphics/pdf/PdfDocument})
    ['{8BF9EDB9-8C03-4020-AD1D-30E2D883AC14}']
    function getPageContentRect: JRect; cdecl;
    function getPageHeight: Integer; cdecl;
    function getPageWidth: Integer; cdecl;
    function startPage(pageNumber: Integer): JObject {android/graphics/pdf/PdfDocument_Page}; cdecl;
  end;

  TJPrintedPdfDocument = class(TJavaGenericImport<JPrintedPdfDocumentClass, JPrintedPdfDocument>)
  end;

  JPrinterCapabilitiesInfoClass = interface(JObjectClass)
    ['{0EC42A7C-84AD-42EA-826E-C11811E42BB6}']
    function _GetCREATOR: JParcelable_Creator;
    procedure _SetCREATOR(Value: JParcelable_Creator);
    property CREATOR: JParcelable_Creator read _GetCREATOR write _SetCREATOR;
  end;

  [JavaSignature('android/print/PrinterCapabilitiesInfo')]
  JPrinterCapabilitiesInfo = interface(JObject)
    ['{B40A2A0B-5A74-4A11-A439-5CC06839ACB3}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getColorModes: Integer; cdecl;
    function getDefaults: JPrintAttributes; cdecl;
    function getDuplexModes: Integer; cdecl;
    function getMediaSizes: JList; cdecl;
    function getMinMargins: JPrintAttributes_Margins; cdecl;
    function getResolutions: JList; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;

  TJPrinterCapabilitiesInfo = class(TJavaGenericImport<JPrinterCapabilitiesInfoClass, JPrinterCapabilitiesInfo>)
  end;

  JPrinterCapabilitiesInfo_BuilderClass = interface(JObjectClass)
    ['{AD399828-A9D3-4062-8C1E-4B248E899B67}']
    function init(printerId: JPrinterId): JPrinterCapabilitiesInfo_Builder; cdecl;
  end;

  [JavaSignature('android/print/PrinterCapabilitiesInfo$Builder')]
  JPrinterCapabilitiesInfo_Builder = interface(JObject)
    ['{433AF2A1-0EC2-4923-B5D4-C130BF78894C}']
    function addMediaSize(mediaSize: JPrintAttributes_MediaSize; isDefault: Boolean): JPrinterCapabilitiesInfo_Builder; cdecl;
    function addResolution(resolution: JPrintAttributes_Resolution; isDefault: Boolean): JPrinterCapabilitiesInfo_Builder; cdecl;
    function build: JPrinterCapabilitiesInfo; cdecl;
    function setColorModes(colorModes: Integer; defaultColorMode: Integer): JPrinterCapabilitiesInfo_Builder; cdecl;
    function setDuplexModes(duplexModes: Integer; defaultDuplexMode: Integer): JPrinterCapabilitiesInfo_Builder; cdecl;
    function setMinMargins(margins: JPrintAttributes_Margins): JPrinterCapabilitiesInfo_Builder; cdecl;
  end;

  TJPrinterCapabilitiesInfo_Builder = class(TJavaGenericImport<JPrinterCapabilitiesInfo_BuilderClass, JPrinterCapabilitiesInfo_Builder>)
  end;

  JPrinterIdClass = interface(JObjectClass)
    ['{E41DFA7F-588A-4AEB-BD72-7D983B751A1B}']
    function _GetCREATOR: JParcelable_Creator;
    procedure _SetCREATOR(Value: JParcelable_Creator);
    property CREATOR: JParcelable_Creator read _GetCREATOR write _SetCREATOR;
  end;

  [JavaSignature('android/print/PrinterId')]
  JPrinterId = interface(JObject)
    ['{7DF68AD8-3F60-4CD0-B217-1C00AC4F9639}']
    function describeContents: Integer; cdecl;
    function equals(&object: JObject): Boolean; cdecl;
    function getLocalId: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;

  TJPrinterId = class(TJavaGenericImport<JPrinterIdClass, JPrinterId>)
  end;

  JPrinterInfoClass = interface(JObjectClass)
    ['{49FAB099-0125-42C3-9E48-3A74C621395A}']
    function _GetCREATOR: JParcelable_Creator;
    procedure _SetCREATOR(Value: JParcelable_Creator);
    function _GetSTATUS_BUSY: Integer;
    function _GetSTATUS_IDLE: Integer;
    function _GetSTATUS_UNAVAILABLE: Integer;
    property CREATOR: JParcelable_Creator read _GetCREATOR write _SetCREATOR;
    property STATUS_BUSY: Integer read _GetSTATUS_BUSY;
    property STATUS_IDLE: Integer read _GetSTATUS_IDLE;
    property STATUS_UNAVAILABLE: Integer read _GetSTATUS_UNAVAILABLE;
  end;

  [JavaSignature('android/print/PrinterInfo')]
  JPrinterInfo = interface(JObject)
    ['{7BF51B8C-FD6C-453B-8F5C-F324FBB69E15}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getCapabilities: JPrinterCapabilitiesInfo; cdecl;
    function getDescription: JString; cdecl;
    function getId: JPrinterId; cdecl;
    function getName: JString; cdecl;
    function getStatus: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;

  TJPrinterInfo = class(TJavaGenericImport<JPrinterInfoClass, JPrinterInfo>)
  end;

  JPrinterInfo_BuilderClass = interface(JObjectClass)
    ['{26087AE9-19D2-40EC-8D04-5BD14DA0D5EF}']
    function init(printerId: JPrinterId; name: JString; status: Integer): JPrinterInfo_Builder; cdecl; overload;
    function init(other: JPrinterInfo): JPrinterInfo_Builder; cdecl; overload;
  end;

  [JavaSignature('android/print/PrinterInfo$Builder')]
  JPrinterInfo_Builder = interface(JObject)
    ['{AFE511FD-5AE8-434F-98A2-4F1575629B6B}']
    function build: JPrinterInfo; cdecl;
    function setCapabilities(capabilities: JPrinterCapabilitiesInfo): JPrinterInfo_Builder; cdecl;
    function setDescription(description: JString): JPrinterInfo_Builder; cdecl;
    function setHasCustomPrinterIcon(hasCustomPrinterIcon: Boolean): JPrinterInfo_Builder; cdecl;
    function setIconResourceId(iconResourceId: Integer): JPrinterInfo_Builder; cdecl;
    function setInfoIntent(infoIntent: JPendingIntent): JPrinterInfo_Builder; cdecl;
    function setName(name: JString): JPrinterInfo_Builder; cdecl;
    function setStatus(status: Integer): JPrinterInfo_Builder; cdecl;
  end;

  TJPrinterInfo_Builder = class(TJavaGenericImport<JPrinterInfo_BuilderClass, JPrinterInfo_Builder>)
  end;

  JPrintJobClass = interface(JObjectClass)
    ['{D70157FE-F149-4D97-9B42-99B542DED1A7}']
  end;

  [JavaSignature('android/print/PrintJob')]
  JPrintJob = interface(JObject)
    ['{213F6AC2-612C-419C-A159-1593DBEC3896}']
    procedure cancel; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getId: JPrintJobId; cdecl;
    function getInfo: JPrintJobInfo; cdecl;
    function hashCode: Integer; cdecl;
    function isBlocked: Boolean; cdecl;
    function isCancelled: Boolean; cdecl;
    function isCompleted: Boolean; cdecl;
    function isFailed: Boolean; cdecl;
    function isQueued: Boolean; cdecl;
    function isStarted: Boolean; cdecl;
    procedure restart; cdecl;
  end;

  TJPrintJob = class(TJavaGenericImport<JPrintJobClass, JPrintJob>)
  end;

  JPrintJobIdClass = interface(JObjectClass)
    ['{31BB93C1-FC10-4194-92EA-62779F44EE4B}']
    function _GetCREATOR: JParcelable_Creator;
    procedure _SetCREATOR(Value: JParcelable_Creator);
    property CREATOR: JParcelable_Creator read _GetCREATOR write _SetCREATOR;
  end;

  [JavaSignature('android/print/PrintJobId')]
  JPrintJobId = interface(JObject)
    ['{4A2DE514-831D-4478-B3C3-F27D770E5D45}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;

  TJPrintJobId = class(TJavaGenericImport<JPrintJobIdClass, JPrintJobId>)
  end;

  JPrintJobInfoClass = interface(JObjectClass)
    ['{FABF912E-03CA-4EFC-B2D0-BDBEC3D251F0}']
    function _GetCREATOR: JParcelable_Creator;
    procedure _SetCREATOR(Value: JParcelable_Creator);
    function _GetSTATE_BLOCKED: Integer;
    function _GetSTATE_CANCELED: Integer;
    function _GetSTATE_COMPLETED: Integer;
    function _GetSTATE_CREATED: Integer;
    function _GetSTATE_FAILED: Integer;
    function _GetSTATE_QUEUED: Integer;
    function _GetSTATE_STARTED: Integer;
    property CREATOR: JParcelable_Creator read _GetCREATOR write _SetCREATOR;
    property STATE_BLOCKED: Integer read _GetSTATE_BLOCKED;
    property STATE_CANCELED: Integer read _GetSTATE_CANCELED;
    property STATE_COMPLETED: Integer read _GetSTATE_COMPLETED;
    property STATE_CREATED: Integer read _GetSTATE_CREATED;
    property STATE_FAILED: Integer read _GetSTATE_FAILED;
    property STATE_QUEUED: Integer read _GetSTATE_QUEUED;
    property STATE_STARTED: Integer read _GetSTATE_STARTED;
  end;

  [JavaSignature('android/print/PrintJobInfo')]
  JPrintJobInfo = interface(JObject)
    ['{BA7F5D8A-6CCA-4596-891D-04460583B573}']
    function describeContents: Integer; cdecl;
    function getAdvancedIntOption(key: JString): Integer; cdecl;
    function getAdvancedStringOption(key: JString): JString; cdecl;
    function getAttributes: JPrintAttributes; cdecl;
    function getCopies: Integer; cdecl;
    function getCreationTime: Int64; cdecl;
    function getId: JPrintJobId; cdecl;
    function getLabel: JString; cdecl;
    function getPages: TJavaObjectArray<JPageRange>; cdecl;
    function getPrinterId: JPrinterId; cdecl;
    function getState: Integer; cdecl;
    function hasAdvancedOption(key: JString): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;

  TJPrintJobInfo = class(TJavaGenericImport<JPrintJobInfoClass, JPrintJobInfo>)
  end;

  JPrintJobInfo_BuilderClass = interface(JObjectClass)
    ['{8F562511-ED31-492E-AFC0-9F4A572727DD}']
    function init(prototype: JPrintJobInfo): JPrintJobInfo_Builder; cdecl;
  end;

  [JavaSignature('android/print/PrintJobInfo$Builder')]
  JPrintJobInfo_Builder = interface(JObject)
    ['{76FAF1F4-26F9-468C-AD3D-FE029140D6FB}']
    function build: JPrintJobInfo; cdecl;
    procedure putAdvancedOption(key: JString; value: JString); cdecl; overload;
    procedure putAdvancedOption(key: JString; value: Integer); cdecl; overload;
    procedure setAttributes(attributes: JPrintAttributes); cdecl;
    procedure setCopies(copies: Integer); cdecl;
    procedure setPages(pages: TJavaObjectArray<JPageRange>); cdecl;
  end;

  TJPrintJobInfo_Builder = class(TJavaGenericImport<JPrintJobInfo_BuilderClass, JPrintJobInfo_Builder>)
  end;

  JPrintManagerClass = interface(JObjectClass)
    ['{552B9F86-5C2F-4D10-A41B-C4805E775025}']
  end;

  [JavaSignature('android/print/PrintManager')]
  JPrintManager = interface(JObject)
    ['{688F88FD-818A-405C-8F27-63B9A3AA8916}']
    function getPrintJobs: JList; cdecl;
    function print(printJobName: JString; documentAdapter: JPrintDocumentAdapter; attributes: JPrintAttributes): JPrintJob; cdecl;
  end;

  TJPrintManager = class(TJavaGenericImport<JPrintManagerClass, JPrintManager>)
  end;

const
  TJPrintAttributes_COLOR_MODE_COLOR = 2;
  TJPrintAttributes_COLOR_MODE_MONOCHROME = 1;
  TJPrintAttributes_DUPLEX_MODE_LONG_EDGE = 2;
  TJPrintAttributes_DUPLEX_MODE_NONE = 1;
  TJPrintAttributes_DUPLEX_MODE_SHORT_EDGE = 4;

  TJPrintDocumentAdapter_EXTRA_PRINT_PREVIEW = 'EXTRA_PRINT_PREVIEW';

  TJPrintDocumentInfo_CONTENT_TYPE_DOCUMENT = 0;
  TJPrintDocumentInfo_CONTENT_TYPE_PHOTO = 1;
  TJPrintDocumentInfo_CONTENT_TYPE_UNKNOWN = -1;
  TJPrintDocumentInfo_PAGE_COUNT_UNKNOWN = -1;

  TJPrinterInfo_STATUS_BUSY = 2;
  TJPrinterInfo_STATUS_IDLE = 1;
  TJPrinterInfo_STATUS_UNAVAILABLE = 3;

  TJPrintJobInfo_STATE_BLOCKED = 4;
  TJPrintJobInfo_STATE_CANCELED = 7;
  TJPrintJobInfo_STATE_COMPLETED = 5;
  TJPrintJobInfo_STATE_CREATED = 1;
  TJPrintJobInfo_STATE_FAILED = 6;
  TJPrintJobInfo_STATE_QUEUED = 2;
  TJPrintJobInfo_STATE_STARTED = 3;

type
  TColorMode = (Color = TJPrintHelper_COLOR_MODE_COLOR, Monochrome = TJPrintHelper_COLOR_MODE_MONOCHROME);
  TOrientation = (Landscape = TJPrintHelper_ORIENTATION_LANDSCAPE, Portrait = TJPrintHelper_ORIENTATION_PORTRAIT);
  TScaleMode = (Fill = TJPrintHelper_SCALE_MODE_FILL, Fit = TJPrintHelper_SCALE_MODE_FIT);

function GetPrintManager: JPrintManager;

function GetPrintAttributesBuilder(ColorMode: TColorMode): JPrintAttributes_Builder;

function SystemSupportsPrint: Boolean;

procedure PrintBitmap(Bitmap: JBitmap; const JobName: string;
  ColorMode: TColorMode = TColorMode.Color;
  Orientation: TOrientation = TOrientation.Landscape;
  ScaleMode: TScaleMode = TScaleMode.Fill); overload;

function PrintBitmap(Bitmap: TBitmap; const JobName: string;
  ColorMode: TColorMode = TColorMode.Color;
  Orientation: TOrientation = TOrientation.Landscape;
  ScaleMode: TScaleMode = TScaleMode.Fill): Boolean; overload;

procedure PrintImage(ImageFile: Jnet_Uri; const JobName: string;
  ColorMode: TColorMode = TColorMode.Color;
  Orientation: TOrientation = TOrientation.Landscape;
  ScaleMode: TScaleMode = TScaleMode.Fill); overload;

procedure PrintImage(const ImageUri, JobName: string;
  ColorMode: TColorMode = TColorMode.Color;
  Orientation: TOrientation = TOrientation.Landscape;
  ScaleMode: TScaleMode = TScaleMode.Fill); overload;

procedure PrintImageFile(const ImageFileName, JobName: string;
  ColorMode: TColorMode = TColorMode.Color;
  Orientation: TOrientation = TOrientation.Landscape;
  ScaleMode: TScaleMode = TScaleMode.Fill);

procedure PrintHtml(const Url, JobName: string; ColorMode: TColorMode = TColorMode.Color);

procedure PrintPdfFile(const PdfFileName, JobName: string; ColorMode: TColorMode = TColorMode.Color);

procedure PrintPdfDocument(PdfDocument: JPdfDocument; const JobName: string; ColorMode: TColorMode = TColorMode.Color);

implementation

uses FMX.Surfaces, FMX.Helpers.Android, Androidapi.Helpers, Androidapi.JNI.Webkit,
  Androidapi.JNI.Embarcadero {$ifdef TRIAL}, FMX.Dialogs {$endif TRIAL},
  PrintingAdapters;

{$ifdef TRIAL}
procedure TrialMessage; forward;
{$endif TRIAL}

function GetPrintManager: JPrintManager;
var PrintManagerService: JObject;
begin
  PrintManagerService := SharedActivityContext.getSystemService(TJContext.JavaClass.PRINT_SERVICE);
  Result := TJPrintManager.Wrap((PrintManagerService as ILocalObject).GetObjectID);
end;

function GetPrintAttributesBuilder(ColorMode: TColorMode): JPrintAttributes_Builder;
begin
  Result := TJPrintAttributes_Builder.JavaClass.init;
  Result.setColorMode(Ord(ColorMode));
end;

function SystemSupportsPrint: Boolean;
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}
  Result := TJPrintHelper.JavaClass.systemSupportsPrint;
end;

procedure PrintBitmap(Bitmap: JBitmap; const JobName: string;
  ColorMode: TColorMode; Orientation: TOrientation; ScaleMode: TScaleMode); overload;
var PrintHelper: JPrintHelper;
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}
  PrintHelper := TJPrintHelper.JavaClass.init(SharedActivityContext);
  PrintHelper.setColorMode(Ord(ColorMode));
  PrintHelper.setOrientation(Ord(Orientation));
  PrintHelper.setScaleMode(Ord(ScaleMode));
  PrintHelper.printBitmap(StringToJString(JobName), Bitmap);
end;

function PrintBitmap(Bitmap: TBitmap; const JobName: string;
  ColorMode: TColorMode; Orientation: TOrientation; ScaleMode: TScaleMode): Boolean; overload;
var
  Surface: TBitmapSurface;
  JavaBitmap: JBitmap;
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}
  Surface := TBitmapSurface.Create;
  Surface.Assign(Bitmap);

  JavaBitmap := TJBitmap.JavaClass.createBitmap(Surface.Width, Surface.Height, TJBitmap_Config.JavaClass.ARGB_8888);
  Result := SurfaceToJBitmap(Surface, JavaBitmap);
  if Result then
    PrintBitmap(JavaBitmap, JobName, ColorMode, Orientation, ScaleMode);
end;

procedure PrintImage(ImageFile: Jnet_Uri; const JobName: string;
  ColorMode: TColorMode; Orientation: TOrientation; ScaleMode: TScaleMode); overload;
var PrintHelper: JPrintHelper;
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}
  PrintHelper := TJPrintHelper.JavaClass.init(SharedActivityContext);
  PrintHelper.setColorMode(Ord(ColorMode));
  PrintHelper.setOrientation(Ord(Orientation));
  PrintHelper.setScaleMode(Ord(ScaleMode));
  PrintHelper.printBitmap(StringToJString(JobName), ImageFile);
end;

procedure PrintImage(const ImageUri, JobName: string;
  ColorMode: TColorMode; Orientation: TOrientation; ScaleMode: TScaleMode); overload;
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}
  PrintImage(StrToJURI(ImageUri), JobName, ColorMode, Orientation, ScaleMode);
end;

function FileNameToUri(const FileName: string): Jnet_Uri;
var JavaFile: JFile;
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}
  JavaFile := TJFile.JavaClass.init(StringToJString(FileName));
  Result := TJnet_Uri.JavaClass.fromFile(JavaFile);
end;

procedure PrintImageFile(const ImageFileName, JobName: string;
  ColorMode: TColorMode; Orientation: TOrientation; ScaleMode: TScaleMode);
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}
  PrintImage(FileNameToUri(ImageFileName), JobName, ColorMode, Orientation, ScaleMode);
end;

type
  TOnWebViewListener = class(TJavaLocal, JOnWebViewListener)
  private
    FJobName: string;
    FColorMode: TColorMode;
  public
    procedure doUpdateVisitedHistory(view: JWebView; url: JString; isReload: Boolean); cdecl;
    procedure onFormResubmission(view: JWebView; dontResend: JMessage; resend: JMessage); cdecl;
    procedure onLoadResource(view: JWebView; url: JString); cdecl;
    procedure onPageFinished(view: JWebView; url: JString); cdecl;
    procedure onPageStarted(view: JWebView; url: JString; favicon: JBitmap); cdecl;
    procedure onReceivedError(view: JWebView; errorCode: Integer; description: JString; failingUrl: JString); cdecl;
    procedure onReceivedHttpAuthRequest(view: JWebView; handler: JHttpAuthHandler; host: JString; realm: JString); cdecl;
    procedure onReceivedSslError(view: JWebView; handler: JSslErrorHandler; error: JSslError); cdecl;
    procedure onScaleChanged(view: JWebView; oldScale: Single; newScale: Single); cdecl;
    procedure onUnhandledKeyEvent(view: JWebView; event: JKeyEvent); cdecl;
    function shouldOverrideKeyEvent(view: JWebView; event: JKeyEvent): Boolean; cdecl;
    function shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean; cdecl;
    property JobName: string read FJobName write FJobName;
    property ColorMode: TColorMode read FColorMode write FColorMode;
  end;

procedure TOnWebViewListener.doUpdateVisitedHistory(view: JWebView; url: JString; isReload: Boolean); cdecl;
begin
end;

procedure TOnWebViewListener.onFormResubmission(view: JWebView; dontResend: JMessage; resend: JMessage); cdecl;
begin
end;

procedure TOnWebViewListener.onLoadResource(view: JWebView; url: JString); cdecl;
begin
end;

procedure TOnWebViewListener.onPageFinished(view: JWebView; url: JString); cdecl;
begin
  GetPrintManager.print(StringToJString(JobName), JPrintDocumentAdapter(View.createPrintDocumentAdapter), GetPrintAttributesBuilder(ColorMode).build);
end;

procedure TOnWebViewListener.onPageStarted(view: JWebView; url: JString; favicon: JBitmap); cdecl;
begin
end;

procedure TOnWebViewListener.onReceivedError(view: JWebView; errorCode: Integer; description: JString; failingUrl: JString); cdecl;
begin
end;

procedure TOnWebViewListener.onReceivedHttpAuthRequest(view: JWebView; handler: JHttpAuthHandler; host: JString; realm: JString); cdecl;
begin
end;

procedure TOnWebViewListener.onReceivedSslError(view: JWebView; handler: JSslErrorHandler; error: JSslError); cdecl;
begin
end;

procedure TOnWebViewListener.onScaleChanged(view: JWebView; oldScale: Single; newScale: Single); cdecl;
begin
end;

procedure TOnWebViewListener.onUnhandledKeyEvent(view: JWebView; event: JKeyEvent); cdecl;
begin
end;

function TOnWebViewListener.shouldOverrideKeyEvent(view: JWebView; event: JKeyEvent): Boolean; cdecl;
begin
  Result := False;
end;

function TOnWebViewListener.shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean; cdecl;
begin
  Result := False;
end;

var OnWebViewListener: TOnWebViewListener;

procedure PrintHtml(const Url, JobName: string; ColorMode: TColorMode);
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}

  CallInUIThreadAndWaitFinishing(
    procedure
    var
      WebView: JWebView;
      WebClient: JWebClient;
    begin
      WebView := TJWebView.JavaClass.init(SharedActivity);
      WebClient := TJWebClient.JavaClass.init;
      if OnWebViewListener = nil then
        OnWebViewListener := TOnWebViewListener.Create;
      OnWebViewListener.JobName := JobName;
      OnWebViewListener.ColorMode := ColorMode;
      WebClient.SetWebViewListener(OnWebViewListener);
      WebView.setWebViewClient(WebClient);
      WebView.loadUrl(StringToJString(Url));
    end);
end;

procedure PrintPdfFile(const PdfFileName, JobName: string; ColorMode: TColorMode);
var PrintPdfFileDocumentAdapter: JPrintPdfFileDocumentAdapter;
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}

  PrintPdfFileDocumentAdapter := TJPrintPdfFileDocumentAdapter.JavaClass.init(StringToJString(PdfFileName));
  GetPrintManager.print(StringToJString(JobName), JPrintDocumentAdapter(PrintPdfFileDocumentAdapter), GetPrintAttributesBuilder(ColorMode).build);
end;

procedure PrintPdfDocument(PdfDocument: JPdfDocument; const JobName: string; ColorMode: TColorMode = TColorMode.Color);
var PrintPdfDocumentAdapter: JPrintPdfDocumentAdapter;
begin
{$ifdef TRIAL}
  TrialMessage;
{$endif TRIAL}

  PrintPdfDocumentAdapter := TJPrintPdfDocumentAdapter.JavaClass.init(PdfDocument);
  GetPrintManager.print(StringToJString(JobName), JPrintDocumentAdapter(PrintPdfDocumentAdapter), GetPrintAttributesBuilder(ColorMode).build);
end;

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Winsoft.Android.Print.JPageRange', TypeInfo(Winsoft.Android.Print.JPageRange));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintedPdfDocument', TypeInfo(Winsoft.Android.Print.JPrintedPdfDocument));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintAttributes_Builder', TypeInfo(Winsoft.Android.Print.JPrintAttributes_Builder));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintAttributes_Margins', TypeInfo(Winsoft.Android.Print.JPrintAttributes_Margins));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintAttributes_MediaSize', TypeInfo(Winsoft.Android.Print.JPrintAttributes_MediaSize));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintAttributes_Resolution', TypeInfo(Winsoft.Android.Print.JPrintAttributes_Resolution));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintAttributes', TypeInfo(Winsoft.Android.Print.JPrintAttributes));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintDocumentAdapter_LayoutResultCallback', TypeInfo(Winsoft.Android.Print.JPrintDocumentAdapter_LayoutResultCallback));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintDocumentAdapter_WriteResultCallback', TypeInfo(Winsoft.Android.Print.JPrintDocumentAdapter_WriteResultCallback));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintDocumentAdapter', TypeInfo(Winsoft.Android.Print.JPrintDocumentAdapter));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintDocumentInfo_Builder', TypeInfo(Winsoft.Android.Print.JPrintDocumentInfo_Builder));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintDocumentInfo', TypeInfo(Winsoft.Android.Print.JPrintDocumentInfo));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrinterCapabilitiesInfo_Builder', TypeInfo(Winsoft.Android.Print.JPrinterCapabilitiesInfo_Builder));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrinterCapabilitiesInfo', TypeInfo(Winsoft.Android.Print.JPrinterCapabilitiesInfo));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrinterId', TypeInfo(Winsoft.Android.Print.JPrinterId));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrinterInfo_Builder', TypeInfo(Winsoft.Android.Print.JPrinterInfo_Builder));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrinterInfo', TypeInfo(Winsoft.Android.Print.JPrinterInfo));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintJob', TypeInfo(Winsoft.Android.Print.JPrintJob));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintJobId', TypeInfo(Winsoft.Android.Print.JPrintJobId));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintJobInfo_Builder', TypeInfo(Winsoft.Android.Print.JPrintJobInfo_Builder));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintJobInfo', TypeInfo(Winsoft.Android.Print.JPrintJobInfo));
  TRegTypes.RegisterType('Winsoft.Android.Print.JPrintManager', TypeInfo(Winsoft.Android.Print.JPrintManager));
end;

{$ifdef TRIAL}
var WasTrialMessage: Boolean;

procedure TrialMessage;
begin
  if WasTrialMessage then
    Exit;

  ShowMessage(
    'Printing Library for Android 2.5' + #13#10 +
    'Copyright (c) 2015-2020 WINSOFT' + #13#10#13#10 +
    'A trial version of Printing Library for Android started.' + #13#10#13#10 +
    'Please note that trial version is supposed to be used for evaluation only. ' +
    'If you wish to distribute Printing Library for Android as part of your application, ' +
    'you must register from website at https://www.winsoft.sk.' + #13#10#13#10 +
    'Thank you for trialing Printing Library for Android.');
  WasTrialMessage := True;
end;
{$endif TRIAL}

initialization
  RegisterTypes;
end.