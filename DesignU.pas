unit DesignU;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.TextLayout, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, Datasnap.DBClient;

type
  TDesignF = class(TForm)
    EReport1: TLayout;         // المنطقة الرئيسية للتقرير (Main report area)
    ERRectPage: TRectangle;    // مربع الخلفية للصفحة (Page background rectangle)
    LayoCadrConti: TLayout;
    PageHeader: TLayout;       // رأس الصفحة (يظهر في بداية كل صفحة)
    RectPageHeader: TRectangle;
    Text10: TText;
    PageFooter: TLayout;       // تذييل الصفحة (يظهر في نهاية كل صفحة)
    RectPageFooter: TRectangle;
    Text9: TText;
    Title: TLayout;            // عنوان التقرير (يظهر مرة واحدة في الأعلى)
    Text4: TText;
    Text19: TText;
    ColumnHeader: TLayout;     // رأس الجدول (لإظهار أسماء الأعمدة)
    Rectangle10: TRectangle;
    Text5: TText;
    Rectangle7: TRectangle;
    Text24: TText;
    Text23: TText;
    SubDetail: TLayout;        // تفاصيل فرعية (مثل المجموع الجزئي لكل مجموعة)
    RectSubDetail: TRectangle;
    Text3: TText;
    TextSubSum: TText;
    Summary: TLayout;          // ملخص التقرير (المجموع الكلي)
    RectSummary: TRectangle;
    TextSummary: TText;
    Text11: TText;
    ZoneDetail: TLayout;       // المنطقة التي تُكرر لكل سجل في الجدول
    Detail: TLayout;           // القالب المرئي لعنصر التفاصيل (يتم نسخه لكل سجل)
    RectDetail: TRectangle;
    TextRecNo: TText;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Text2: TText;
    Text25: TText;
    ReportQuery: TFDQuery;
    BindingsList1: TBindingsList;
    DataSource1: TDataSource;
    EndPagee: TLine;           // خط وهمي يُستخدم للكشف عن نهاية الصفحة
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Text1: TText;
    Text12: TText;
    Rectangle1: TRectangle;
    BindSourceDB2: TBindSourceDB;
    Rectangle2: TRectangle;
    Text21: TText;
    Text13: TText;
    Rectangle3: TRectangle;
    Text14: TText;
    Rectangle4: TRectangle;
    Text15: TText;
    Layout4: TLayout;
    Layout5: TLayout;
    ReportQuerycls: TFDAutoIncField;
    ReportQueryCategory: TWideMemoField;
    ReportQuerySpeciesNameField: TWideMemoField;
    ReportQueryLengthCmField: TFloatField;
    ReportQueryCommonNameField: TWideMemoField;
    ReportQueryNotesField: TWideMemoField;
    ReportQueryGraphicField: TBlobField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    Rectangle5: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Dclarations prives }
    totl, total0, Gtotl, Canclcc: single; // متغيرات للإجماليات (الصفحة، السجل، الكل)
    function gethighMemo(memo: TMemo; memoWidh: Single; txte: string; RectHigh: Single): Single;
    function gethighlabel(labl: TLabel; lablWidh: Single; txte: string; RectHigh: Single): Single;
    function gethighTText(labl: TText; lablWidh: Single; txte: string; RectHigh: Single): Single;
  public
    { Dclarations publiques }
    PageHeaderLayt: boolean;    // إظهار/إخفاء رأس الصفحة
    TitleLayt: boolean;         // إظهار/إخفاء العنوان الرئيسي
    ColumnHeaderLayt: boolean;  // إظهار/إخفاء رأس الأعمدة
    SubDetailLayt: boolean;     // إظهار/إخفاء التفاصيل الفرعية
    SummaryLayt: boolean;       // إظهار/إخفاء الملخص
    PageFooterLayt: boolean;    // إظهار/إخفاء تذييل الصفحة
    function ClerReport: Boolean; // حذف الصفحات السابقة من المعاينة
    function ClerDetail: Boolean; // حذف عناصر Detail السابقة
    function PreparReport(npae: Integer): Boolean; // إنشاء صفحة جديدة في المعاينة
    function DESINGFACT(TableRecordCount: Integer): Boolean; // الدالة الرئيسية لتوليد التقرير
  end;

var
  DesignF: TDesignF;
  FileName: string;
  N: Integer;
  Cleardd: Boolean = False;     // علامة للانتظار حتى تنتهي العمليات
  canCalcul: Boolean = False;
  pross1, nrcd, precdnL, precdnT: Integer;
  NewPagee: Boolean = False;
  PositionPrior: Integer;

implementation

{$R *.fmx}

uses PreviewU, UnitMain;

{ TForm10 }

// -------------------------------------------------------------------------
// الدالة: ClerDetail
// الوظيفة: حذف جميع عناصر TRectangle من ZoneDetail
// Purpose: Remove all TRectangle elements from ZoneDetail
// تستخدم لتنظيف العرض قبل بدء تقرير جديد
// Used to clean up the display before starting a new report
// -------------------------------------------------------------------------
function TDesignF.ClerDetail: Boolean;
var
  i, j: Byte;
begin
  result := False;
  Cleardd := False;
  try
    if ZoneDetail.ChildrenCount > 0 then // حذف المربعات الثانوية
    begin
      for j := ZoneDetail.ChildrenCount - 1 downto 0 do
      begin
        if ((ZoneDetail.Children.Items[j]) is TRectangle) then
          ((ZoneDetail.Children.Items[j]) as TRectangle).DisposeOf;
        Application.ProcessMessages;
      end;
    end
    else if ZoneDetail.ComponentCount > 0 then // حذف المربعات الرئسية
    begin
      for i := ZoneDetail.ComponentCount - 1 downto 0 do
      begin
        if ZoneDetail.Components[i] is TRectangle then
          (ZoneDetail.Components[i] as TRectangle).DisposeOf;
        Application.ProcessMessages;
      end;
    end;
  finally
    result := True;
    Cleardd := True;
  end;
end;

// -------------------------------------------------------------------------
// الدالة: ClerReport
// الوظيفة: حذف جميع صور الصفحات من LayoutZOM في نافذة المعاينة
// Purpose: Clear all page images from LayoutZOM in the preview window
// تُستخدم قبل عرض تقرير جديد
// Used before displaying a new report
// -------------------------------------------------------------------------
function TDesignF.ClerReport: Boolean;
var
  i, j: Byte;
begin
  result := False;
  Cleardd := False;
  try
    with PreviewF do
    begin
      if LayoutZOM.ChildrenCount > 0 then
      begin
        for j := LayoutZOM.ChildrenCount - 1 downto 0 do
        begin
          if ((LayoutZOM.Children.Items[j]) is TImage) then
            if ((LayoutZOM.Children.Items[j]) as TImage).Name <> 'Detail' then
              ((LayoutZOM.Children.Items[j]) as TImage).DisposeOf;
          Application.ProcessMessages;
        end;
      end
      else if LayoutZOM.ComponentCount > 0 then
      begin
        for i := LayoutZOM.ComponentCount - 1 downto 0 do
        begin
          if LayoutZOM.Components[i] is TImage then
            (LayoutZOM.Components[i] as TImage).DisposeOf;
          Application.ProcessMessages;
        end;
      end;
    end;
  finally
    result := True;
    Cleardd := True;
  end;
end;

// -------------------------------------------------------------------------
// الحدث: DataSource1DataChange
// الوظيفة: تحديث عناصر واجهة المستخدم عند تغيير السجل
// Purpose: Update UI elements when the record changes
// يُظهر رقم السجل، والمجموع الجزئي، والمجموع الكلي
// Shows record number, subtotal, and total
// -------------------------------------------------------------------------
procedure TDesignF.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  TextRecNo.Text := IntToStr(ReportQuery.RecNo); // رقم السجل الحالي
  TextSubSum.Text := FormatFloat('##,##0.00', totl); // المجموع الجزئي للصفحة
  TextSummary.Text := FormatFloat('##,##0.00', Gtotl); // المجموع الكلي
  if ReportQueryLengthCmField.Value < 0 then
    Text14.TextSettings.FontColor := TAlphaColors.Red
  else
    Text14.TextSettings.FontColor := TAlphaColors.Darkred;
end;

// -------------------------------------------------------------------------
// الدالة: DESINGFACT
// الوظيفة: توليد التقرير النهائي (القلب النابض للمشروع)
// Purpose: Generate the final report (the heart of the project)
// تُكرر Detail لكل سجل، وتُنشئ صفحات متعددة عند الحاجة
// Repeats Detail for each record and creates multiple pages if needed
// -------------------------------------------------------------------------
function TDesignF.DESINGFACT(TableRecordCount: Integer): Boolean;
const
  offset = 4;
var
  ERect: TRect;
  EText: string;
  ELabbl: TLabel;
  i, j, k, cn: Byte;
  Rectd: TRectangle;
  defuHig, wwidth, hheight, DetalHieght, hh: Single;
  HeightFotPae, HeightSum, HieghtSubDtil, TolHigh, TestHig: Single;
  ttxt: string;
  Np, reccnt, frstTit, reccntglb: Integer;
begin
  Cleardd := False;
  ClerDetail; // تنظيف ZoneDetail من العناصر القديمة
  repeat
    Application.ProcessMessages;
    Continue;
  until (Cleardd = true);
  Cleardd := False;
  Application.ProcessMessages;
  ClerReport; // تنظيف LayoutZOM من الصفحات القديمة
  repeat
    Application.ProcessMessages;
    Continue;
  until (Cleardd = true);

  reccntglb := TableRecordCount;
  frstTit := 0;
  defuHig := Detail.Height;
  DetalHieght := 0;
  cn := 0;
  reccnt := 0;
  Np := 0;
  Gtotl := 0;
  totl := 0;
  Canclcc := 1;
  nrcd := 1;
  Pross1 := Round((nrcd * 100) / reccntglb);

  // -------------------------------------------------------------------------
  // الحالة 1: لا يوجد جدول (تقرير ثابت)
  // Case 1: No data table (static report)
  // يتم عرض الصفحة كما هي بدون تكرار
  // The page is displayed as-is without repetition
  // -------------------------------------------------------------------------
  if ZoneDetail.Visible = False then
  begin
    np := 1;
    Cleardd := False;
    PreparReport(np);
    repeat
      Application.ProcessMessages;
      Continue;
    until (Cleardd = true);
  end
  else
  begin
    // -------------------------------------------------------------------------
    // الحالة 2: يوجد جدول (تقرير ديناميكي)
    // Case 2: Data table exists (dynamic report)
    // يتم تكرار Detail لكل سجل، مع دعم تقسيم الصفحات
    // Repeat Detail for each record, with page break support
    // -------------------------------------------------------------------------
    ReportQuery.First;
    while (not ReportQuery.Eof) do
    begin
      Pross1 := Round((nrcd * 100) / reccntglb);
      ZoneDetail.BeginUpdate;
      Rectd := TRectangle.Create(ZoneDetail);
      Rectd.Parent := ZoneDetail;
      try
        Rectd.Name := 'ERrctDital' + IntToStr(cn);
        Rectd.Width := Detail.Width;
        Rectd.Fill.Kind := TBrushKind.Bitmap;
        Rectd.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
        Rectd.Stroke.Kind := TBrushKind.None;
        Rectd.Position.X := 0;
        Detail.Height := defuHig;

        // -------------------------------------------------------------------------
        // حساب الارتفاع الديناميكي لكل عنصر في Detail
        // Calculate dynamic height for each component in Detail
        // بناءً على النصوص الطويلة أو التفاف الكلمات
        // Based on long text or word wrapping
        // -------------------------------------------------------------------------
        if Detail.ChildrenCount > 0 then
        begin
          for j := Detail.ChildrenCount - 1 downto 0 do
          begin
            Application.ProcessMessages;
            if (Detail.Children.Items[j] is TText) then
            begin
              ((Detail.Children.Items[j]) as TText).WordWrap := True;
              ((Detail.Children.Items[j]) as TText).AutoSize := False;
              wwidth := ((Detail.Children.Items[j]) as TText).Width;
              ttxt := Trim(((Detail.Children.Items[j]) as TText).Text);
              if (ttxt) = '' then
                ttxt := '!';
              Detail.Height := gethighTText((Detail.Children.Items[j] as TText), wwidth, ttxt, Detail.Height);
            end
            else if (Detail.Children.Items[j] is TMemo) then
            begin
              hh := (Detail.Children.Items[j] as TMemo).ContentBounds.Height + offset;
              if hh > Detail.Height then
                Detail.Height := hh;
            end
            else if (Detail.Children.Items[j] is TLabel) then
            begin
              ((Detail.Children.Items[j]) as TLabel).WordWrap := True;
              ((Detail.Children.Items[j]) as TLabel).AutoSize := False;
              wwidth := ((Detail.Children.Items[j]) as TLabel).Width;
              ttxt := Trim(((Detail.Children.Items[j]) as TLabel).Text);
              if (ttxt) = '' then
                ttxt := '!';
              Detail.Height := gethighlabel((Detail.Children.Items[j] as TLabel), wwidth, ttxt, Detail.Height);
            end;

            // -------------------------------------------------------------------------
            // التحقق من العناصر الفرعية (مثلاً داخل TLayout)
            // Check child components (e.g., inside a TLayout)
            // -------------------------------------------------------------------------
            if Detail.Children.Items[j].ChildrenCount > 0 then
              for k := Detail.Children.Items[j].ChildrenCount - 1 downto 0 do
              begin
                Application.ProcessMessages;
                if (Detail.Children.Items[j].Children.Items[k] is TText) then
                begin
                  ((Detail.Children.Items[j].Children.Items[k]) as TText).WordWrap := True;
                  ((Detail.Children.Items[j].Children.Items[k]) as TText).AutoSize := False;
                  wwidth := ((Detail.Children.Items[j].Children.Items[k]) as TText).Width;
                  ttxt := Trim(((Detail.Children.Items[j].Children.Items[k]) as TText).Text);
                  if (ttxt) = '' then
                    ttxt := '!';
                  Detail.Height := gethighTText((Detail.Children.Items[j].Children.Items[k] as TText), wwidth, ttxt, Detail.Height);
                end
                else if (Detail.Children.Items[j].Children.Items[k] is TMemo) then
                begin
                  hh := (Detail.Children.Items[j].Children.Items[k] as TMemo).ContentBounds.Height + offset;
                  if hh > Detail.Height then
                    Detail.Height := hh;
                end
                else if (Detail.Children.Items[j].Children.Items[k] is TLabel) then
                begin
                  ((Detail.Children.Items[j].Children.Items[k]) as TLabel).WordWrap := True;
                  ((Detail.Children.Items[j].Children.Items[k]) as TLabel).AutoSize := False;
                  wwidth := ((Detail.Children.Items[j].Children.Items[k]) as TLabel).Width;
                  ttxt := Trim(((Detail.Children.Items[j].Children.Items[k]) as TLabel).Text);
                  if (ttxt) = '' then
                    ttxt := '!';
                  Detail.Height := gethighlabel((Detail.Children.Items[j].Children.Items[k] as TLabel), wwidth, ttxt, Detail.Height);
                end;
              end;
            Application.ProcessMessages;
          end;
        end;
      finally
        ZoneDetail.EndUpdate;
      end;

      // -------------------------------------------------------------------------
      // إنشاء مستطيل جديد بارتفاع ديناميكي
      // Create a new rectangle with dynamic height
      // التقاط صورة للـ Detail ووضعها في المستطيل
      // Take a screenshot of Detail and assign it to the rectangle
      // -------------------------------------------------------------------------
      Rectd.Height := Detail.Height;
      Rectd.Position.Y := DetalHieght;
      DetalHieght := DetalHieght + Rectd.Height;
      ZoneDetail.Height := DetalHieght;
      Rectd.Fill.Bitmap.Bitmap.Assign(Detail.MakeScreenshot);
      Detail.Visible := False;

      // -------------------------------------------------------------------------
      // إظهار أو إخفاء عناصر التقرير حسب الإعدادات
      // Show or hide report sections based on settings
      // -------------------------------------------------------------------------
      PageHeader.Visible := PageHeaderLayt = True;
      if frstTit = 0 then
        Title.Visible := TitleLayt = True;
      ColumnHeader.Visible := ColumnHeaderLayt = True;
      SubDetail.Visible := SubDetailLayt = True;
      Summary.Visible := SummaryLayt = True;
      PageFooter.Visible := PageFooterLayt = True;
      Summary.Visible := False;

      total0 := ReportQueryLengthCmField.Value;
      Gtotl := Gtotl + total0;
      totl := totl + total0;

      // -------------------------------------------------------------------------
      // التحقق من تجاوز الصفحة باستخدام PageFooter أو EndPagee
      // Check if page needs to break using PageFooter or EndPagee
      // إذا تداخل ZoneDetail مع PageFooter، فافتح صفحة جديدة
      // If ZoneDetail intersects with PageFooter, create a new page
      // -------------------------------------------------------------------------
      if PageFooterLayt = True then
      begin
        if SubDetailLayt = true then
        begin
          DetalHieght := DetalHieght + SubDetail.Height;
          ZoneDetail.Height := DetalHieght;
          if not (ZoneDetail.BoundsRect.IntersectsWith(PageFooter.BoundsRect)) then
          begin
            DetalHieght := DetalHieght - SubDetail.Height;
            ZoneDetail.Height := DetalHieght;
          end;
        end;
        if (ZoneDetail.BoundsRect.IntersectsWith(PageFooter.BoundsRect)) then
        begin
          ZoneDetail.Height := ZoneDetail.Height - Rectd.Height;
          DetalHieght := 0;
          if SubDetailLayt = true then
          begin
            totl := totl - total0;
            ZoneDetail.Height := ZoneDetail.Height - (SubDetail.Height);
          end;
          Rectd.Visible := false;
          reccnt := 1;
          frstTit := 1;
          Canclcc := 0;
        end;
        if (reccnt = 1) then
        begin
          SubDetail.Position.Y := ZoneDetail.Position.y + (ZoneDetail.Height);
          reccnt := 0;
          np := np + 1;
          Cleardd := False;
          PreparReport(np);
          repeat
            Application.ProcessMessages;
            Continue;
          until (Cleardd = true);
          Title.Visible := False;
          Application.ProcessMessages;
          Cleardd := False;
          if ZoneDetail.ChildrenCount > 0 then
          begin
            for j := ZoneDetail.ChildrenCount - 1 downto 0 do
            begin
              if ((ZoneDetail.Children.Items[j]) is TRectangle) then
                if ((ZoneDetail.Children.Items[j]) as TRectangle).Name <> Rectd.Name then
                  ((ZoneDetail.Children.Items[j]) as TRectangle).DisposeOf;
              Application.ProcessMessages;
            end;
            Cleardd := True;
          end;
          totl := totl + total0;
          Rectd.Visible := True;
          Rectd.Position.Y := 0;
          ZoneDetail.Height := Rectd.Height;
          DetalHieght := Rectd.Height;
        end;
      end
      else
      begin
        // نفس المنطق مع EndPagee
        if SubDetailLayt = true then
        begin
          DetalHieght := DetalHieght + SubDetail.Height;
          ZoneDetail.Height := DetalHieght;
          if not (ZoneDetail.BoundsRect.IntersectsWith(EndPagee.BoundsRect)) then
          begin
            DetalHieght := DetalHieght - SubDetail.Height;
            ZoneDetail.Height := DetalHieght;
          end;
        end;
        if (ZoneDetail.BoundsRect.IntersectsWith(EndPagee.BoundsRect)) then
        begin
          ZoneDetail.Height := ZoneDetail.Height - Rectd.Height;
          DetalHieght := 0;
          if SubDetailLayt = true then
          begin
            totl := totl - total0;
            ZoneDetail.Height := ZoneDetail.Height - (SubDetail.Height);
          end;
          Rectd.Visible := false;
          reccnt := 1;
          frstTit := 1;
          Canclcc := 0;
        end;
        if (reccnt = 1) then
        begin
          SubDetail.Position.Y := ZoneDetail.Position.y + (ZoneDetail.Height);
          reccnt := 0;
          np := np + 1;
          Cleardd := False;
          PreparReport(np);
          repeat
            Application.ProcessMessages;
            Continue;
          until (Cleardd = true);
          Title.Visible := False;
          Application.ProcessMessages;
          Cleardd := False;
          if ZoneDetail.ChildrenCount > 0 then
          begin
            for j := ZoneDetail.ChildrenCount - 1 downto 0 do
            begin
              if ((ZoneDetail.Children.Items[j]) is TRectangle) then
                if ((ZoneDetail.Children.Items[j]) as TRectangle).Name <> Rectd.Name then
                  ((ZoneDetail.Children.Items[j]) as TRectangle).DisposeOf;
              Application.ProcessMessages;
            end;
            Cleardd := True;
          end;
          totl := totl + total0;
          Rectd.Visible := True;
          Rectd.Position.Y := 0;
          ZoneDetail.Height := Rectd.Height;
          DetalHieght := Rectd.Height;
        end;
      end;

      // -------------------------------------------------------------------------
      // عند الوصول للسجل الأخير
      // When reaching the last record
      // إضافة SubDetail وSummary وفتح صفحة جديدة
      // Add SubDetail, Summary, and create new page
      // -------------------------------------------------------------------------
      if (ReportQuery.RecNo = TableRecordCount) then
      begin
        if SubDetailLayt = true then
        begin
          SubDetail.Position.Y := ZoneDetail.Position.y + (ZoneDetail.Height);
          ZoneDetail.Height := ZoneDetail.Height + SubDetail.Height;
        end;
        if SummaryLayt = true then
        begin
          ZoneDetail.Height := ZoneDetail.Height + Summary.Height;
          if not (ZoneDetail.BoundsRect.IntersectsWith(PageFooter.BoundsRect)) then
          begin
            Summary.Visible := True;
            Summary.Position.Y := ZoneDetail.Position.y + (ZoneDetail.Height - Summary.Height);
            np := np + 1;
            Cleardd := False;
            PreparReport(np);
            repeat
              Application.ProcessMessages;
              Continue;
            until (Cleardd = true);
            Title.Visible := False;
            Application.ProcessMessages;
          end
          else
          begin
            ZoneDetail.Height := ZoneDetail.Height - Summary.Height;
            Summary.Visible := False;
            np := np + 1;
            Cleardd := False;
            PreparReport(np);
            repeat
              Application.ProcessMessages;
              Continue;
            until (Cleardd = true);
            Title.Visible := False;
            Application.ProcessMessages;
            if ZoneDetail.ChildrenCount > 0 then
            begin
              for j := ZoneDetail.ChildrenCount - 1 downto 0 do
              begin
                if ((ZoneDetail.Children.Items[j]) is TRectangle) then
                  ((ZoneDetail.Children.Items[j]) as TRectangle).DisposeOf;
                Application.ProcessMessages;
              end;
              Cleardd := True;
            end;
            ColumnHeader.visible := False;
            ZoneDetail.Height := 1;
            Summary.visible := True;
            Summary.Position.Y := ZoneDetail.Position.y;
            np := np + 1;
            Cleardd := False;
            PreparReport(np);
            repeat
              Application.ProcessMessages;
              Continue;
            until (Cleardd = true);
            Title.Visible := False;
            Application.ProcessMessages;
          end;
        end
        else
        begin
          np := np + 1;
          Cleardd := False;
          PreparReport(np);
          repeat
            Application.ProcessMessages;
            Continue;
          until (Cleardd = true);
          Title.Visible := False;
          Application.ProcessMessages;
        end;
      end;

      repeat
        Application.ProcessMessages;
        Continue;
      until (Cleardd = true);
      inc(cn);
      ReportQuery.Next;
      nrcd := ReportQuery.RecNo;
    end;
  end;
end;

// -------------------------------------------------------------------------
// الحدث: FormCreate
// الوظيفة: تهيئة إعدادات عناصر التقرير عند إنشاء النموذج
// Purpose: Initialize report section settings when the form is created
// -------------------------------------------------------------------------
procedure TDesignF.FormCreate(Sender: TObject);
begin
  totl := 0;
  Gtotl := 0;
  Canclcc := 0;
  PageHeaderLayt := PageHeader.visible;
  TitleLayt := Title.visible;
  ColumnHeaderLayt := ColumnHeader.visible;
  SubDetailLayt := SubDetail.visible;
  SummaryLayt := Summary.visible;
  PageFooterLayt := PageFooter.visible;
end;

// -------------------------------------------------------------------------
// الدالة: gethighlabel
// الوظيفة: حساب الارتفاع الديناميكي لعنصر TLabel بناءً على النص
// Purpose: Calculate dynamic height of TLabel based on text content
// تُستخدم لضمان عدم قطع النص
// Used to ensure text is not cut off
// -------------------------------------------------------------------------
function TDesignF.gethighlabel(labl: TLabel; lablWidh: Single; txte: string; RectHigh: Single): Single;
var
  Layout: TTextLayout;
begin
  Layout := TTextLayoutManager.DefaultTextLayout.Create;
  try
    Layout.BeginUpdate;
    try
      Layout.Font.Assign(labl.Font);
      Layout.VerticalAlign := labl.VertTextAlign;
      Layout.HorizontalAlign := labl.TextAlign;
      Layout.WordWrap := labl.WordWrap;
      Layout.Trimming := labl.Trimming;
      Layout.MaxSize := TPointF.Create(lablWidh, TTextLayout.MaxLayoutSize.Y);
      Layout.Text := txte;
    finally
      Layout.EndUpdate;
    end;
    Result := Round(Layout.Height);
    Layout.Text := 'm';
    Result := Result + Round(Layout.Height);
    if Result > RectHigh then
      Result := Result
    else
      Result := RectHigh;
  finally
    Layout.Free;
  end;
end;

function TDesignF.gethighMemo(memo: TMemo; memoWidh: Single; txte: string;
  RectHigh: Single): Single;
begin

end;

// -------------------------------------------------------------------------
// الدالة: gethighTText
// الوظيفة: حساب الارتفاع الديناميكي لعنصر TText بناءً على النص
// Purpose: Calculate dynamic height of TText based on text content
// -------------------------------------------------------------------------
function TDesignF.gethighTText(labl: TText; lablWidh: Single; txte: string; RectHigh: Single): Single;
var
  Layout: TTextLayout;
begin
  Layout := TTextLayoutManager.DefaultTextLayout.Create;
  try
    Layout.BeginUpdate;
    try
      Layout.Font.Assign(labl.Font);
      Layout.VerticalAlign := labl.VertTextAlign;
      Layout.HorizontalAlign := labl.HorzTextAlign;
      Layout.WordWrap := labl.WordWrap;
      Layout.Trimming := labl.Trimming;
      Layout.MaxSize := TPointF.Create(lablWidh, TTextLayout.MaxLayoutSize.Y);
      Layout.Text := txte;
    finally
      Layout.EndUpdate;
    end;
    Result := Round(Layout.Height);
    Layout.Text := 'm';
    Result := Result + Round(Layout.Height);
    if Result > RectHigh then
      Result := Result
    else
      Result := RectHigh;
  finally
    Layout.Free;
  end;
end;

// -------------------------------------------------------------------------
// الدالة: PreparReport
// الوظيفة: إنشاء صفحة جديدة في نافذة المعاينة
// Purpose: Create a new page in the preview window
// تُستخدم عند بدء صفحة جديدة
// Used when starting a new page
// -------------------------------------------------------------------------
function TDesignF.PreparReport(npae: Integer): Boolean;
begin
  ReportQuery.edit;
  result := False;
  Cleardd := False;
  PreviewF.LayoutZOM.BeginUpdate;
  try
    PreviewF.ERPage := TERPage.Create(PreviewF.LayoutZOM);
    PreviewF.ERPage.Parent := PreviewF.LayoutZOM;
    PreviewF.ERPage.Name := 'ERPage' + IntToStr(npae);
    PreviewF.ERPage.Npage := npae;
    PreviewF.ERPage.WrapMode := TImageWrapMode.Stretch;
    PreviewF.ERPage.Height := Round(EReport1.Height);
    PreviewF.ERPage.Width := Round(EReport1.Width);
    PreviewF.ERPage.Bitmap.Height := Round(EReport1.Height);
    PreviewF.ERPage.Bitmap.Width := Round(EReport1.Width);
    PreviewF.LayoutZOM.Height := Round(((EReport1.Height * npae)) + (15 * npae));
    PreviewF.ERPage.Position.Y := PreviewF.LayoutZOM.Height - Round(EReport1.Height);
    PreviewF.ERPage.Position.x := 0;
    PreviewF.ERPage.Bitmap := EReport1.MakeScreenshot;
  finally
    totl := 0;
    Canclcc := 1;
    NewPagee := True;
    PreviewF.LayoutZOM.EndUpdate;
    result := True;
    Cleardd := True;
    PreviewF.LabelNPge.Text := IntToStr(npae);
    PreviewF.NumPage.Max := PreviewF.LayoutZOM.ComponentCount;
    PreviewF.LabelNpaes.Text := IntToStr(Pross1) + '% Page 1  : ' + IntToStr(npae);
    ReportQuery.cancel;
  end;
end;

end.
