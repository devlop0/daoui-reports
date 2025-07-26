unit PreviewU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.EditBox, FMX.NumberBox, FMX.Edit,system.Permissions,
  FMX.ComboEdit, FMX.Controls.Presentation,System.Generics.Collections,
  FMX.Printer, System.Actions, FMX.ActnList;
type
  TERPage = class(TImage)
  public
    X, Y: Byte;
 //   VerticalAnimation, HorizontalAnimation: TFloatAnimation;
   // SelectionEffect: TFloatAnimation;
    Npage:Integer
  end;
     TERPageList = TList<TERPage>;


 type
  TRectCell = class(TRectangle)
  public
    X, Y: Byte;
  //  RectVerticalAnimation, RectHorizontalAnimation: TFloatAnimation;
  //  RectSelectionEffect: TFloatAnimation;
  end;

  TRectCellList = TList<TRectCell>;
type
  TPreviewF = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    Button1: TButton;
    Label1: TLabel;
    ScrollBoxDM: TScrollBox;
    LayoutZOM: TLayout;
    Rectintercects: TRectangle;
    Layout1: TLayout;
    LabelNPge: TLabel;
    NumPage: TNumberBox;
    LabelNpaes: TText;
    ComboZOM: TComboEdit;
    ActionList1: TActionList;
    Actiontopdf: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboZOMChangeTracking(Sender: TObject);
    procedure ActiontopdfExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

  private
    { D�clarations priv�es }
    PermisionDO: integer;

    FPermissionReadExternalStorage,
    FPermissionWriteExternalStorage : string;
    procedure DisplayRationale(Sender: TObject; const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc);
    procedure LoadPicturePermissionRequestResult(Sender: TObject; const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);


  public
    { D�clarations publiques }
   ERPage : TERPage;
  Canprepar: Boolean ;
    exctep:Boolean;
  end;

var
  PreviewF: TPreviewF;
   FileName,ImageName,TxtName: string;

implementation

{$R *.fmx}
 uses
         {$IFDEF ANDROID}
 Winsoft.Android.Print,
     Androidapi.JNI.GraphicsContentViewText,
     Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.Helpers,
  FMX.Helpers.android,
  FMX.surfaces, Androidapi.JNI.Os,
      {$ENDIF}
        {$IFDEF MSWINDOWS}
        Winapi.ShellAPI,Winapi.Windows,
         Winapi.ActiveX,System.Win.ComObj,
          {$ENDIF MSWINDOWS}
 FMX.DialogService,System.IOUtils,DesignU,UnitMain;







procedure TPreviewF.ActiontopdfExecute(Sender: TObject);
var
  {$IFDEF ANDROID}
    Document: JPdfDocument;
  PageInfo: JPdfDocument_PageInfo;
  Page: JPdfDocument_Page;
  Canvas: JCanvas;
  Paint: JPaint;
  Recto: JRect;
  Rect: JRect;

  OutputStream: JFileOutputStream;
  Intent: JIntent;
  NativeBitmap: JBitmap;

  sBitMap: TBitmapSurface;
     {$ENDIF}
     datsav:string;
  i:Integer;
  imagepdf: timage;
begin



 datsav := inttostr(DateTimeToFileDate(now));

  {$IFDEF ANDROID}

 // create Pdf document
    Document := TJPdfDocument.JavaClass.init;
     try

    for I := 1 to LayoutZOM.ComponentCount do
   begin
   try
    // create page  1                           //(with,height,npage) a4

     imagepdf := TImage(LayoutZOM.FindComponent('ERPage'+IntToStr(i)));
   if Assigned(imagepdf) then
         begin
    PageInfo := TJPageInfo_Builder.JavaClass.init(imagepdf.Bitmap.Width,
     imagepdf.Bitmap.Height, i).create;


    Page := Document.startPage(PageInfo);

    Canvas := Page.getCanvas;
    Paint := TJPaint.JavaClass.init;

    Rect := TJRect.JavaClass.init;
    Rect.&set(0, 0, imagepdf.Bitmap.Width, imagepdf.Bitmap.Height);
    Recto := TJRect.JavaClass.init;
    Recto.&set(0, 0, imagepdf.Bitmap.Width, imagepdf.Bitmap.Height);
 //   Paint.setARGB($FF, $FF, 0, $FF);

    NativeBitmap := TJBitmap.JavaClass.createBitmap(imagepdf.Bitmap.Width,
      imagepdf.Bitmap.Height, TJBitmap_Config.JavaClass.ARGB_8888);
    sBitMap := TBitmapSurface.create;
    sBitMap.Assign(imagepdf.Bitmap);
    SurfaceToJBitmap(sBitMap, NativeBitmap);

    Canvas.drawBitmap(NativeBitmap, Recto, Rect, Paint);
         end;

   finally
     Document.finishPage(Page);
   end;
     Application.ProcessMessages;
   end;

   // write PDF document to file
    FileName := TPath.Combine(TPath.GetSharedDocumentsPath,TxtName+datsav +'.pdf'); //'ER'+datsav
 //   ImageName := TPath.Combine(TPath.GetSharedPicturesPath, 'ER'+datsav+'.jpg');
    OutputStream := TJFileOutputStream.JavaClass.init
      (StringToJString(FileName));
      sleep(10);
   //    imagepdf.bitmap.savetoFile( ImageName  );
      repeat
             Application.ProcessMessages;
              Continue;
              sleep(100);
             until (FileExists(FileName)=True);

    try
      Document.writeTo(OutputStream);
    finally

      OutputStream.close;
    end;
  finally
    Document.close;
  end;

  ShowMessage('OK');

  { Intent := TJIntent.JavaClass.init;
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  Intent.setDataAndType(FileNameToUri(FileName),
    StringToJString('application/pdf'));
  Intent.setFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NO_HISTORY or
    TJIntent.JavaClass.FLAG_ACTIVITY_CLEAR_TOP);
  SharedActivity.StartActivity(Intent); }
     {$ENDIF}


end;

procedure TPreviewF.Button1Click(Sender: TObject);
var
 imagee:TImage;
 SrcRect,DestRect: TRectF;
MyRect: TRectF;
scale: Double;
bitmap: TBitmap;
i:Integer;

begin
        {$IFDEF ANDROID}

imagee := TImage(LayoutZOM.FindComponent('ERPage'+IntToStr(Trunc(NumPage.Value))));
   if Assigned(imagee) then
         begin
    if SystemSupportsPrint then
    PrintBitmap(imagee.Bitmap, 'logo', TColorMode.Color, TOrientation.Landscape, TScaleMode.Fit)
  else
    ShowMessage('Printing is not supported on this device');
         end;
      {$ENDIF}
    {$IFDEF MSWINDOWS}

  try

    imagee := TImage(LayoutZOM.FindComponent('ERPage'+IntToStr(Trunc(NumPage.Value))));
   if Assigned(imagee) then
         begin

     Printer.Orientation:= TPrinterOrientation.poPortrait;
 Printer.Title:=TxtName;
  Printer.ActivePrinter.SelectDPI(1200,1200);
 // Printer.ActivePrinter.ActiveDPIIndex := 1;

  Printer.Canvas.Fill.Color := TAlphaColorRec.Black;
  Printer.Canvas.Fill.Kind := TBrushKind.Solid;
   Printer.BeginDoc;
  SrcRect := imagee.LocalRect;
  DestRect := TRectF.Create(0,0,Printer.PageWidth,Printer.PageHeight);
  Printer.Canvas.DrawBitmap(imagee.Bitmap,SrcRect,DestRect,1);
  Printer.EndDoc;
         end;

  finally

  end;

          {$ENDIF MSWINDOWS}
end;

procedure TPreviewF.ComboZOMChangeTracking(Sender: TObject);
var i:Integer;
hh,ww,htotl,v:Single;
begin
if TryStrToFloat(ComboZOM.Text,v) then
 begin
 if ((v >=25)and(v <=200)) then
 begin
   htotl:=0;
  hh:=Round((v*1754)/150);
   ww:=Round((v*1240)/150);
     LayoutZOM.Width:=ww;
   if LayoutZOM.ComponentCount >0 then
 begin
   for i := LayoutZOM.ComponentCount -1 downto 0 do
      begin
       if LayoutZOM.Components[i] is TImage then
          begin
      (LayoutZOM.Components[i] as TImage).Height:=hh;
      (LayoutZOM.Components[i] as TImage).Align:=TAlignLayout.Bottom;
       (LayoutZOM.Components[i] as TImage).Margins.Top:=15;
      end;

 end;
  LayoutZOM.Width:=ww;
   LayoutZOM.Height:=(LayoutZOM.ComponentCount * hh) +(16 * LayoutZOM.ComponentCount);
 end;
 end;
end;

end;

procedure TPreviewF.DisplayRationale(Sender: TObject;
  const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc);
 var
  I: Integer;
  RationaleMsg: string;
begin
   {$IFDEF ANDROID}
  for I := 0 to High(APermissions) do
  begin
    if APermissions[I] = FPermissionReadExternalStorage then
      RationaleMsg := RationaleMsg + 'The app needs to load photo files from your device' + SLineBreak + SLineBreak
    else
     if APermissions[I] = FPermissionWriteExternalStorage then
      RationaleMsg := RationaleMsg + 'The app needs to save photo files from your device';
  end;
  // Show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
  // After the user sees the explanation, invoke the post-rationale routine to request the permissions
  TDialogService.ShowMessage(RationaleMsg,
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end);
     {$ENDIF}

end;



   procedure TPreviewF.FormActivate(Sender: TObject);
begin
if exctep = true then
begin
  LabelNpaes.visible:=True;
TxtName:='Type Fish';
     DesignF.ReportQuery.Close;
DesignF.ReportQuery.SQL.Text:=FormMain.QuerySQL.SQL.Text;
DesignF.ReportQuery.Open;
DesignF.ReportQuery.Last;
DesignF.DESINGFACT(DesignF.ReportQuery.RecordCount) ;
 LabelNpaes.visible:=False;
 exctep := False;
end;
end;

procedure TPreviewF.FormCreate(Sender: TObject);
begin
   exctep :=False;

         {$IFDEF ANDROID}
// FPermissionCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);

     FPermissionReadExternalStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  FPermissionWriteExternalStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
//   self.FViewer := TExternalFileViewer.Factory(self, self);
  {$ENDIF}
end;

procedure TPreviewF.FormDestroy(Sender: TObject);
var
i,j:Byte;

begin

// Cleardd:= False;
try
   with PreviewF do
   begin
    if LayoutZOM.ChildrenCount >0 then
   begin

         for j := LayoutZOM.ChildrenCount -1   downto 0 do   // حذف الصور الثانةية
   begin
    if ((LayoutZOM.Children.Items[j]) is TImage) then
      if  ((LayoutZOM.Children.Items[j])  as TImage).Name <> 'Detail' then
     ((LayoutZOM.Children.Items[j]) as TImage).DisposeOf;
      application.ProcessMessages;
   end;


      end
      else
if LayoutZOM.ComponentCount >0 then         // حذف الصور الرئسية
 begin
   for i := LayoutZOM.ComponentCount -1 downto 0 do
      begin
       if LayoutZOM.Components[i] is TImage then
     (LayoutZOM.Components[i] as TImage).DisposeOf;
       application.ProcessMessages;
      end;
 end;
   end;
finally

  // Cleardd:= true;
end;

end;

  procedure TPreviewF.SpeedButton2Click(Sender: TObject);
begin
     {$IFDEF ANDROID}
    PermissionsService.RequestPermissions([FPermissionReadExternalStorage, FPermissionWriteExternalStorage], LoadPicturePermissionRequestResult, DisplayRationale);


         {$ENDIF}

end;

procedure TPreviewF.LoadPicturePermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
   {$IFDEF ANDROID}
      // 2 permissions involved: READ_EXTERNAL_STORAGE, WRITE_EXTERNAL_STORAGE
  if (Length(AGrantResults) = 2) and
     (AGrantResults[0] = TPermissionStatus.Granted) and
     (AGrantResults[1] = TPermissionStatus.Granted) then
   Actiontopdf.Execute
   else
   begin
     TDialogService.ShowMessage('Cannot do File editing because the required permissions are not granted');
    end;
    {$ENDIF}
end;




end.
