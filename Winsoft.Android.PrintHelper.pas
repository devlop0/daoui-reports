unit Winsoft.Android.PrintHelper;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os;

type
  {Class forward declarations}
  JPrintHelper_1 = interface; {android/support/v4/print/PrintHelper$1}
  JPrintHelper_OnPrintFinishCallback = interface; {android/support/v4/print/PrintHelper$OnPrintFinishCallback}
  JPrintHelper_PrintHelperKitkatImpl_1 = interface; {android/support/v4/print/PrintHelper$PrintHelperKitkatImpl$1}
  JPrintHelper_PrintHelperKitkatImpl_2 = interface; {android/support/v4/print/PrintHelper$PrintHelperKitkatImpl$2}
  JPrintHelper_PrintHelperKitkatImpl = interface; {android/support/v4/print/PrintHelper$PrintHelperKitkatImpl}
  JPrintHelper_PrintHelperStubImpl = interface; {android/support/v4/print/PrintHelper$PrintHelperStubImpl}
  JPrintHelper_PrintHelperVersionImpl = interface; {android/support/v4/print/PrintHelper$PrintHelperVersionImpl}
  JPrintHelper = interface; {android/support/v4/print/PrintHelper}
  JPrintHelperKitkat_1 = interface; {android/support/v4/print/PrintHelperKitkat$1}
  JPrintHelperKitkat_2_1_1 = interface; {android/support/v4/print/PrintHelperKitkat$2$1$1}
  JPrintHelperKitkat_2_1 = interface; {android/support/v4/print/PrintHelperKitkat$2$1}
  JPrintHelperKitkat_2 = interface; {android/support/v4/print/PrintHelperKitkat$2}
  JPrintHelperKitkat_OnPrintFinishCallback = interface; {android/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback}
  JPrintHelperKitkat = interface; {android/support/v4/print/PrintHelperKitkat}

  JPrintHelper_1Class = interface(JObjectClass)
    ['{96AE004E-CF30-4BF1-84A8-DB620C7DFD17}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelper$1')]
  JPrintHelper_1 = interface(JObject)
    ['{8FF90EB2-E262-4039-B7D0-FF74A20F2165}']
  end;

  TJPrintHelper_1 = class(TJavaGenericImport<JPrintHelper_1Class, JPrintHelper_1>)
  end;

  JPrintHelper_OnPrintFinishCallbackClass = interface(IJavaClass)
    ['{818AAC36-96CE-492F-A146-BFE9868CBA71}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelper$OnPrintFinishCallback')]
  JPrintHelper_OnPrintFinishCallback = interface(IJavaInstance)
    ['{3E430096-C1DD-49C7-9F23-E920BD65E9D0}']
    {Methods}
    procedure onFinish; cdecl;
  end;

  TJPrintHelper_OnPrintFinishCallback = class(TJavaGenericImport<JPrintHelper_OnPrintFinishCallbackClass, JPrintHelper_OnPrintFinishCallback>)
  end;

  JPrintHelper_PrintHelperKitkatImpl_1Class = interface(JObjectClass)
    ['{045F6D81-196C-4C66-A22C-033317FB62BE}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelper$PrintHelperKitkatImpl$1')]
  JPrintHelper_PrintHelperKitkatImpl_1 = interface(JObject)
    ['{432756DA-5156-4E4E-87BC-17305E7A0288}']
    {Methods}
    procedure onFinish; cdecl;
  end;

  TJPrintHelper_PrintHelperKitkatImpl_1 = class(TJavaGenericImport<JPrintHelper_PrintHelperKitkatImpl_1Class, JPrintHelper_PrintHelperKitkatImpl_1>)
  end;

  JPrintHelper_PrintHelperKitkatImpl_2Class = interface(JObjectClass)
    ['{33576B58-5A74-471C-AFBA-9CB5F8492318}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelper$PrintHelperKitkatImpl$2')]
  JPrintHelper_PrintHelperKitkatImpl_2 = interface(JObject)
    ['{55B14ADB-A847-4D69-B34E-39670749EE8F}']
    {Methods}
    procedure onFinish; cdecl;
  end;

  TJPrintHelper_PrintHelperKitkatImpl_2 = class(TJavaGenericImport<JPrintHelper_PrintHelperKitkatImpl_2Class, JPrintHelper_PrintHelperKitkatImpl_2>)
  end;

  JPrintHelper_PrintHelperKitkatImplClass = interface(JObjectClass)
    ['{E50381A7-3816-48AE-999A-B1C3BDD65097}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelper$PrintHelperKitkatImpl')]
  JPrintHelper_PrintHelperKitkatImpl = interface(JObject)
    ['{A664D0D7-7F8A-4B58-8BB3-95E559F86DEE}']
    {Methods}
    function getColorMode: Integer; cdecl;
    function getOrientation: Integer; cdecl;
    function getScaleMode: Integer; cdecl;
    procedure printBitmap(jobName: JString; bitmap: JBitmap; callback: JPrintHelper_OnPrintFinishCallback); cdecl; overload;
    procedure printBitmap(jobName: JString; imageFile: Jnet_Uri; callback: JPrintHelper_OnPrintFinishCallback); cdecl; overload;
    procedure setColorMode(colorMode: Integer); cdecl;
    procedure setOrientation(orientation: Integer); cdecl;
    procedure setScaleMode(scaleMode: Integer); cdecl;
  end;

  TJPrintHelper_PrintHelperKitkatImpl = class(TJavaGenericImport<JPrintHelper_PrintHelperKitkatImplClass, JPrintHelper_PrintHelperKitkatImpl>)
  end;

  JPrintHelper_PrintHelperStubImplClass = interface(JObjectClass)
    ['{89B0A874-279C-4337-97CB-38BACF439D56}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelper$PrintHelperStubImpl')]
  JPrintHelper_PrintHelperStubImpl = interface(JObject)
    ['{0A988A4A-289A-4C37-AEA7-5A9A69038A06}']
    {Methods}
    function getColorMode: Integer; cdecl;
    function getOrientation: Integer; cdecl;
    function getScaleMode: Integer; cdecl;
    procedure printBitmap(jobName: JString; bitmap: JBitmap; callback: JPrintHelper_OnPrintFinishCallback); cdecl; overload;
    procedure printBitmap(jobName: JString; imageFile: Jnet_Uri; callback: JPrintHelper_OnPrintFinishCallback); cdecl; overload;
    procedure setColorMode(colorMode: Integer); cdecl;
    procedure setOrientation(orientation: Integer); cdecl;
    procedure setScaleMode(scaleMode: Integer); cdecl;
  end;

  TJPrintHelper_PrintHelperStubImpl = class(TJavaGenericImport<JPrintHelper_PrintHelperStubImplClass, JPrintHelper_PrintHelperStubImpl>)
  end;

  JPrintHelper_PrintHelperVersionImplClass = interface(IJavaClass)
    ['{6FB8705B-0B90-4028-BF92-34C7D0878CE9}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelper$PrintHelperVersionImpl')]
  JPrintHelper_PrintHelperVersionImpl = interface(IJavaInstance)
    ['{3DD36CA9-E49F-4F90-A6A7-1252EF16BAB6}']
    {Methods}
    function getColorMode: Integer; cdecl;
    function getOrientation: Integer; cdecl;
    function getScaleMode: Integer; cdecl;
    procedure printBitmap(Param0: JString; Param1: JBitmap; Param2: JPrintHelper_OnPrintFinishCallback); cdecl; overload;
    procedure printBitmap(Param0: JString; Param1: Jnet_Uri; Param2: JPrintHelper_OnPrintFinishCallback); cdecl; overload;
    procedure setColorMode(Param0: Integer); cdecl;
    procedure setOrientation(Param0: Integer); cdecl;
    procedure setScaleMode(Param0: Integer); cdecl;
  end;

  TJPrintHelper_PrintHelperVersionImpl = class(TJavaGenericImport<JPrintHelper_PrintHelperVersionImplClass, JPrintHelper_PrintHelperVersionImpl>)
  end;

  JPrintHelperClass = interface(JObjectClass)
    ['{21D83B9D-FC42-42AB-B484-63E09DED4481}']
    {Property methods}
    function _GetCOLOR_MODE_COLOR: Integer;
    function _GetCOLOR_MODE_MONOCHROME: Integer;
    function _GetORIENTATION_LANDSCAPE: Integer;
    function _GetORIENTATION_PORTRAIT: Integer;
    function _GetSCALE_MODE_FILL: Integer;
    function _GetSCALE_MODE_FIT: Integer;
    {Methods}
    function init(context: JContext): JPrintHelper; cdecl;
    function systemSupportsPrint: Boolean; cdecl;
    {Properties}
    property COLOR_MODE_COLOR: Integer read _GetCOLOR_MODE_COLOR;
    property COLOR_MODE_MONOCHROME: Integer read _GetCOLOR_MODE_MONOCHROME;
    property ORIENTATION_LANDSCAPE: Integer read _GetORIENTATION_LANDSCAPE;
    property ORIENTATION_PORTRAIT: Integer read _GetORIENTATION_PORTRAIT;
    property SCALE_MODE_FILL: Integer read _GetSCALE_MODE_FILL;
    property SCALE_MODE_FIT: Integer read _GetSCALE_MODE_FIT;
  end;

  [JavaSignature('android/support/v4/print/PrintHelper')]
  JPrintHelper = interface(JObject)
    ['{80C55A8B-070E-43DA-BBBF-330E9FD2675C}']
    {Methods}
    function getColorMode: Integer; cdecl;
    function getOrientation: Integer; cdecl;
    function getScaleMode: Integer; cdecl;
    procedure printBitmap(jobName: JString; bitmap: JBitmap); cdecl; overload;
    procedure printBitmap(jobName: JString; bitmap: JBitmap; callback: JPrintHelper_OnPrintFinishCallback); cdecl; overload;
    procedure printBitmap(jobName: JString; imageFile: Jnet_Uri); cdecl; overload;
    procedure printBitmap(jobName: JString; imageFile: Jnet_Uri; callback: JPrintHelper_OnPrintFinishCallback); cdecl; overload;
    procedure setColorMode(colorMode: Integer); cdecl;
    procedure setOrientation(orientation: Integer); cdecl;
    procedure setScaleMode(scaleMode: Integer); cdecl;
  end;

  TJPrintHelper = class(TJavaGenericImport<JPrintHelperClass, JPrintHelper>)
  end;

  JPrintHelperKitkat_1Class = interface(JObjectClass)
    ['{F493AAA7-A5C7-4CF7-9C44-33BCC82C6E6A}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelperKitkat$1')]
  JPrintHelperKitkat_1 = interface(JObject)
    ['{172602B8-25B7-434A-9A52-6AF81C320BB7}']
    {Methods}
    procedure onFinish; cdecl;
    procedure onLayout(oldPrintAttributes: JObject {android/print/PrintAttributes}; newPrintAttributes: JObject {android/print/PrintAttributes}; cancellationSignal: JCancellationSignal; layoutResultCallback: JObject {android/print/PrintDocumentAdapter_LayoutResultCallback}; bundle: JBundle); cdecl;
    procedure onWrite(page: TJavaObjectArray<JObject {android/print/PageRange}>; content: JParcelFileDescriptor; matrix: JCancellationSignal; ioe: JObject {android/print/PrintDocumentAdapter_WriteResultCallback}); cdecl;
  end;

  TJPrintHelperKitkat_1 = class(TJavaGenericImport<JPrintHelperKitkat_1Class, JPrintHelperKitkat_1>)
  end;

  JPrintHelperKitkat_2_1_1Class = interface(JObjectClass)
    ['{D4B91B9D-21F4-4C78-BC87-5537A6C3D87A}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelperKitkat$2$1$1')]
  JPrintHelperKitkat_2_1_1 = interface(JObject)
    ['{EC99CBE8-C5E5-4EC4-857D-39C3FD1B1DCE}']
    {Methods}
    procedure onCancel; cdecl;
  end;

  TJPrintHelperKitkat_2_1_1 = class(TJavaGenericImport<JPrintHelperKitkat_2_1_1Class, JPrintHelperKitkat_2_1_1>)
  end;

  JPrintHelperKitkat_2_1Class = interface(JObjectClass)
    ['{1445ED00-87B2-48C8-B7E0-C63C661FC4A7}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelperKitkat$2$1')]
  JPrintHelperKitkat_2_1 = interface(JObject)
    ['{AF0D1EE6-B9A0-4AE2-8307-CCE7C9BF5A48}']
  end;

  TJPrintHelperKitkat_2_1 = class(TJavaGenericImport<JPrintHelperKitkat_2_1Class, JPrintHelperKitkat_2_1>)
  end;

  JPrintHelperKitkat_2Class = interface(JObjectClass)
    ['{6C67AB94-6122-4360-8032-37B4CE11E631}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelperKitkat$2')]
  JPrintHelperKitkat_2 = interface(JObject)
    ['{F8595C08-C88D-4A19-BBC1-1B29C84DACEC}']
    {Methods}
    procedure onFinish; cdecl;
    procedure onLayout(changed: JObject {android/print/PrintAttributes}; this: JObject {android/print/PrintAttributes}; oldPrintAttributes: JCancellationSignal; newPrintAttributes: JObject {android/print/PrintDocumentAdapter_LayoutResultCallback}; cancellationSignal: JBundle); cdecl;
    procedure onWrite(page: TJavaObjectArray<JObject {android/print/PageRange}>; content: JParcelFileDescriptor; matrix: JCancellationSignal; ioe: JObject {android/print/PrintDocumentAdapter_WriteResultCallback}); cdecl;
  end;

  TJPrintHelperKitkat_2 = class(TJavaGenericImport<JPrintHelperKitkat_2Class, JPrintHelperKitkat_2>)
  end;

  JPrintHelperKitkat_OnPrintFinishCallbackClass = interface(IJavaClass)
    ['{6469E794-1CAB-43B7-A9E1-47811905295C}']
  end;

  [JavaSignature('android/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback')]
  JPrintHelperKitkat_OnPrintFinishCallback = interface(IJavaInstance)
    ['{D0D746B5-563D-4A09-98B9-BA9AF00A1B5A}']
    {Methods}
    procedure onFinish; cdecl;
  end;

  TJPrintHelperKitkat_OnPrintFinishCallback = class(TJavaGenericImport<JPrintHelperKitkat_OnPrintFinishCallbackClass, JPrintHelperKitkat_OnPrintFinishCallback>)
  end;

  JPrintHelperKitkatClass = interface(JObjectClass)
    ['{E29700F4-18DB-4589-81E6-5861767A3FB9}']
    {Property methods}
    function _GetCOLOR_MODE_COLOR: Integer;
    function _GetCOLOR_MODE_MONOCHROME: Integer;
    function _GetORIENTATION_LANDSCAPE: Integer;
    function _GetORIENTATION_PORTRAIT: Integer;
    function _GetSCALE_MODE_FILL: Integer;
    function _GetSCALE_MODE_FIT: Integer;
    {Properties}
    property COLOR_MODE_COLOR: Integer read _GetCOLOR_MODE_COLOR;
    property COLOR_MODE_MONOCHROME: Integer read _GetCOLOR_MODE_MONOCHROME;
    property ORIENTATION_LANDSCAPE: Integer read _GetORIENTATION_LANDSCAPE;
    property ORIENTATION_PORTRAIT: Integer read _GetORIENTATION_PORTRAIT;
    property SCALE_MODE_FILL: Integer read _GetSCALE_MODE_FILL;
    property SCALE_MODE_FIT: Integer read _GetSCALE_MODE_FIT;
  end;

  [JavaSignature('android/support/v4/print/PrintHelperKitkat')]
  JPrintHelperKitkat = interface(JObject)
    ['{F7D880B5-EDF4-44A4-A1ED-D9B01300ED8C}']
    {Methods}
    function getColorMode: Integer; cdecl;
    function getOrientation: Integer; cdecl;
    function getScaleMode: Integer; cdecl;
    procedure printBitmap(jobName: JString; bitmap: JBitmap; callback: JPrintHelperKitkat_OnPrintFinishCallback); cdecl; overload;
    procedure printBitmap(jobName: JString; imageFile: Jnet_Uri; callback: JPrintHelperKitkat_OnPrintFinishCallback); cdecl; overload;
    procedure setColorMode(colorMode: Integer); cdecl;
    procedure setOrientation(orientation: Integer); cdecl;
    procedure setScaleMode(scaleMode: Integer); cdecl;
  end;

  TJPrintHelperKitkat = class(TJavaGenericImport<JPrintHelperKitkatClass, JPrintHelperKitkat>)
  end;

const
  TJPrintHelper_COLOR_MODE_COLOR = 2;
  TJPrintHelper_COLOR_MODE_MONOCHROME = 1;
  TJPrintHelper_ORIENTATION_LANDSCAPE = 1;
  TJPrintHelper_ORIENTATION_PORTRAIT = 2;
  TJPrintHelper_SCALE_MODE_FILL = 2;
  TJPrintHelper_SCALE_MODE_FIT = 1;

  TJPrintHelperKitkat_COLOR_MODE_COLOR = 2;
  TJPrintHelperKitkat_COLOR_MODE_MONOCHROME = 1;
  TJPrintHelperKitkat_ORIENTATION_LANDSCAPE = 1;
  TJPrintHelperKitkat_ORIENTATION_PORTRAIT = 2;
  TJPrintHelperKitkat_SCALE_MODE_FILL = 2;
  TJPrintHelperKitkat_SCALE_MODE_FIT = 1;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelper_1', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelper_1));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelper_OnPrintFinishCallback', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelper_OnPrintFinishCallback));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperKitkatImpl_1', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperKitkatImpl_1));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperKitkatImpl_2', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperKitkatImpl_2));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperKitkatImpl', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperKitkatImpl));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperStubImpl', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperStubImpl));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperVersionImpl', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelper_PrintHelperVersionImpl));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelper', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelper));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelperKitkat_1', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelperKitkat_1));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelperKitkat_2_1_1', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelperKitkat_2_1_1));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelperKitkat_2_1', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelperKitkat_2_1));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelperKitkat_2', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelperKitkat_2));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelperKitkat_OnPrintFinishCallback', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelperKitkat_OnPrintFinishCallback));
  TRegTypes.RegisterType('Winsoft.Android.PrintHelper.JPrintHelperKitkat', TypeInfo(Winsoft.Android.PrintHelper.JPrintHelperKitkat));
end;

initialization
  RegisterTypes;
end.