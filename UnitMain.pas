unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.Controls, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, Fmx.Bind.Navigator,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.Objects,
  Data.Bind.Components, Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FMX.Memo.Types, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TFormMain = class(TForm)
    BindNavigator1: TBindNavigator;      // أداة التنقل بين السجلات
    BindNavigator2: TBindNavigator;      // أداة تنقل ثانية
    Layout1: TLayout;
    Layout2: TLayout;
    Layout4: TLayout;
    Edit1: TEdit;                       // حقل إدخال نص (غير مستخدم حاليًا)
    Edit2: TEdit;                       // حقل إدخال نص (غير مستخدم حاليًا)
    Memo1: TMemo;                       // مذكرة لعرض رسائل أو نتائج
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    VertScrollBox1: TVertScrollBox;
    Layout5: TLayout;
    Layout3: TLayout;
    Button1: TButton;                   // زر للإغلاق
    Button2: TButton;                   // زر لعرض التقرير
    QuerySQL: TFDQuery;                 // استعلام SQL للبيانات
    BindSourceDB1: TBindSourceDB;       // مصدر الربط بين البيانات والواجهة
    BindingsList1: TBindingsList;       // قائمة الربط
    LinkControlToField1: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    Image1: TImage;
    Layout6: TLayout;
    Layout7: TLayout;
    Edit3: TEdit;                       // حقل إدخال نص (غير مستخدم حاليًا)
    Label3: TLabel;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    Text1: TText;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Layout8: TLayout;
    Label5: TLabel;                     // يعرض رقم السجل الحالي
    Button3: TButton;                   // زر لعرض SQL
    RectMasq: TRectangle;
    RectSQL: TRectangle;
    Layout9: TLayout;
    MemoSQL: TMemo;                     // مذكرة لإدخال استعلام SQL
    Layout10: TLayout;
    Button4: TButton;                   // زر لتنفيذ الاستعلام
    Button5: TButton;                   // زر مثال: عرض 28 سجل
    Button6: TButton;                   // زر لعرض إعدادات العناصر
    RectBande: TRectangle;
    Layout11: TLayout;
    Layout12: TLayout;
    Button7: TButton;                   // زر لإخفاء إعدادات العناصر
    CheckHeader: TCheckBox;             // إظهار/إخفاء رأس الصفحة
    CheckTitle: TCheckBox;              // إظهار/إخفاء العنوان
    CheckColumnH: TCheckBox;            // إظهار/إخفاء رأس الأعمدة
    CheckDetail: TCheckBox;             // إظهار/إخفاء تفاصيل السجل
    ChckSubDet: TCheckBox;              // إظهار/إخفاء التفاصيل الفرعية
    CheckSum: TCheckBox;                // إظهار/إخفاء الملخص
    CheckFooter: TCheckBox;             // إظهار/إخفاء تذييل الصفحة
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;       // اتصال بقاعدة البيانات
    procedure Button4Click(Sender: TObject);            // تنفيذ SQL
    procedure Button5Click(Sender: TObject);            // عرض مثال
    procedure QuerySQLAfterOpen(DataSet: TDataSet);     // بعد فتح الاستعلام
    procedure Button2Click(Sender: TObject);            // عرض التقرير
    procedure Button3Click(Sender: TObject);            // إظهار SQL
    procedure CheckHeaderChange(Sender: TObject);       // تغيير إعداد رأس الصفحة
    procedure CheckTitleChange(Sender: TObject);        // تغيير إعداد العنوان
    procedure CheckColumnHChange(Sender: TObject);      // تغيير إعداد رأس الأعمدة
    procedure CheckDetailChange(Sender: TObject);       // تغيير إعداد التفاصيل
    procedure ChckSubDetChange(Sender: TObject);        // تغيير إعداد التفاصيل الفرعية
    procedure CheckFooterChange(Sender: TObject);       // تغيير إعداد التذييل
    procedure CheckSumChange(Sender: TObject);          // تغيير إعداد الملخص
    procedure Button6Click(Sender: TObject);            // إظهار إعدادات العناصر
    procedure Button7Click(Sender: TObject);            // إخفاء إعدادات العناصر
    procedure DataSource1DataChange(Sender: TObject; Field: TField); // تغيير السجل
    procedure FormActivate(Sender: TObject);            // عند تفعيل النموذج
    procedure Button1Click(Sender: TObject);            // إغلاق النموذج
    procedure FormCreate(Sender: TObject);              // عند إنشاء النموذج
  private
    { Dclarations prives }
  public
    { Dclarations publiques }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}
 Uses IOUtils,DesignU,PreviewU;

// -------------------------------------------------------------------------
// الحدث: Button1Click
// الوظيفة: إغلاق النموذج الرئيسي
// Purpose: Close the main form
// -------------------------------------------------------------------------
procedure TFormMain.Button1Click(Sender: TObject);
begin
  close;
end;

// -------------------------------------------------------------------------
// الحدث: Button2Click
// الوظيفة: عرض نافذة المعاينة
// Purpose: Show the preview window
// يتم تعيين exctep لبدء توليد التقرير
// The exctep flag tells PreviewF to generate the report
// -------------------------------------------------------------------------
procedure TFormMain.Button2Click(Sender: TObject);
begin
  PreviewF.exctep := True;
  PreviewF.Show;
end;

// -------------------------------------------------------------------------
// الحدث: Button3Click
// الوظيفة: إظهار مربع SQL للتعديل
// Purpose: Show the SQL editing box
// -------------------------------------------------------------------------
procedure TFormMain.Button3Click(Sender: TObject);
begin
  RectMasq.Visible := True;
  RectSQL.Visible := True;
end;

// -------------------------------------------------------------------------
// الحدث: Button4Click
// الوظيفة: تنفيذ الاستعلام المكتوب في MemoSQL
// Purpose: Execute the SQL query written in MemoSQL
// يغلق الاستعلام القديم، يعيّن النص الجديد، ثم يفتحه
// Closes old query, sets new text, then opens it
// -------------------------------------------------------------------------
procedure TFormMain.Button4Click(Sender: TObject);
begin
  QuerySQL.Close;
  QuerySQL.SQL.Text := MemoSQL.Lines.Text;
  QuerySQL.Open;
end;

// -------------------------------------------------------------------------
// الحدث: Button5Click
// الوظيفة: مثال سريع: عرض أول 28 سجل من جدول ListFish
// Purpose: Quick example: Show first 28 records from ListFish table
// يستخدم نفس الكود في Button4Click
// Reuses the same logic as Button4Click
// -------------------------------------------------------------------------
procedure TFormMain.Button5Click(Sender: TObject);
begin
  memo1.Lines.Clear;
  memo1.Lines.Text := 'Select * from ListFish LIMIT 28 ';
  QuerySQL.Close;
  QuerySQL.SQL.Text := 'Select * from ListFish LIMIT 28 ';
  QuerySQL.Open;
end;

// -------------------------------------------------------------------------
// الحدث: Button6Click
// الوظيفة: إظهار إعدادات عناصر التقرير
// Purpose: Show report elements settings panel
// يُستخدم لتفعيل/إلغاء رؤية Header, Title, Detail...
// Used to toggle visibility of report sections
// -------------------------------------------------------------------------
procedure TFormMain.Button6Click(Sender: TObject);
begin
  RectMasq.Visible := True;
  RectBande.Visible := True;
end;

// -------------------------------------------------------------------------
// الحدث: Button7Click
// الوظيفة: إخفاء إعدادات عناصر التقرير
// Purpose: Hide report elements settings panel
// -------------------------------------------------------------------------
procedure TFormMain.Button7Click(Sender: TObject);
begin
  RectMasq.Visible := False;
  RectBande.Visible := False;
end;

// -------------------------------------------------------------------------
// الحدث: ChckSubDetChange
// الوظيفة: تحديث إعداد التفاصيل الفرعية في DesignF
// Purpose: Update SubDetail visibility in DesignF
// -------------------------------------------------------------------------
procedure TFormMain.ChckSubDetChange(Sender: TObject);
begin
  DesignF.SubDetailLayt := ChckSubDet.IsChecked;
  DesignF.SubDetail.visible := ChckSubDet.IsChecked;
end;

// -------------------------------------------------------------------------
// الحدث: CheckColumnHChange
// الوظيفة: تحديث إعداد رأس الأعمدة في DesignF
// Purpose: Update ColumnHeader visibility in DesignF
// -------------------------------------------------------------------------
procedure TFormMain.CheckColumnHChange(Sender: TObject);
begin
  DesignF.ColumnHeaderLayt := CheckColumnH.IsChecked;
  DesignF.ColumnHeader.visible := CheckColumnH.IsChecked;
end;

// -------------------------------------------------------------------------
// الحدث: CheckDetailChange
// الوظيفة: تحديث إعداد التفاصيل في DesignF
// Purpose: Update Detail visibility in DesignF
// -------------------------------------------------------------------------
procedure TFormMain.CheckDetailChange(Sender: TObject);
begin
  DesignF.ZoneDetail.Visible := CheckDetail.IsChecked;
end;

// -------------------------------------------------------------------------
// الحدث: CheckFooterChange
// الوظيفة: تحديث إعداد تذييل الصفحة في DesignF
// Purpose: Update PageFooter visibility in DesignF
// -------------------------------------------------------------------------
procedure TFormMain.CheckFooterChange(Sender: TObject);
begin
  DesignF.PageFooterLayt := CheckFooter.IsChecked;
  DesignF.PageFooter.visible := CheckFooter.IsChecked;
end;

// -------------------------------------------------------------------------
// الحدث: CheckHeaderChange
// الوظيفة: تحديث إعداد رأس الصفحة في DesignF
// Purpose: Update PageHeader visibility in DesignF
// -------------------------------------------------------------------------
procedure TFormMain.CheckHeaderChange(Sender: TObject);
begin
  DesignF.PageHeaderLayt := CheckHeader.IsChecked;
  DesignF.PageHeader.visible := CheckHeader.IsChecked;
end;

// -------------------------------------------------------------------------
// الحدث: CheckSumChange
// الوظيفة: تحديث إعداد الملخص في DesignF
// Purpose: Update Summary visibility in DesignF
// -------------------------------------------------------------------------
procedure TFormMain.CheckSumChange(Sender: TObject);
begin
  DesignF.SummaryLayt := CheckSum.IsChecked;
  DesignF.Summary.visible := CheckSum.IsChecked;
end;

// -------------------------------------------------------------------------
// الحدث: CheckTitleChange
// الوظيفة: تحديث إعداد العنوان في DesignF
// Purpose: Update Title visibility in DesignF
// -------------------------------------------------------------------------
procedure TFormMain.CheckTitleChange(Sender: TObject);
begin
  DesignF.TitleLayt := CheckTitle.IsChecked;
  DesignF.Title.visible := CheckTitle.IsChecked;
end;

// -------------------------------------------------------------------------
// الحدث: DataSource1DataChange
// الوظيفة: تحديث رقم السجل عند التبديل بين السجلات
// Purpose: Update record number when changing records
// يُظهر: 3/28 (السجل 3 من أصل 28)
// Shows: 3/28 (record 3 out of 28)
// -------------------------------------------------------------------------
procedure TFormMain.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Label5.Text := inttostr(QuerySQL.RecNo) + '/' + inttostr(QuerySQL.RecordCount);
end;

// -------------------------------------------------------------------------
// الحدث: FormActivate
// الوظيفة: فتح الاستعلام عند تفعيل النموذج
// Purpose: Open the query when the form is activated
// إذا لم يكن مفتوحًا بالفعل
// If it's not already open
// -------------------------------------------------------------------------
procedure TFormMain.FormActivate(Sender: TObject);
begin
  if not QuerySQL.Active then
    QuerySQL.Open;
end;

// -------------------------------------------------------------------------
// الحدث: FormCreate
// الوظيفة: تهيئة اتصال قاعدة البيانات عند إنشاء النموذج
// Purpose: Initialize database connection when form is created
// يدعم ويندوز وأندرويد
// Supports both Windows and Android
// -------------------------------------------------------------------------
procedure TFormMain.FormCreate(Sender: TObject);
begin
  {$IFDEF ANDROID}
  // على أندرويد: استخدم مجلد المستندات
  // On Android: Use documents folder
  FDConnection1.Params.Values['Database'] :=
    TPath.GetDocumentsPath + PathDelim + 'DBReport.db';
  {$ENDIF ANDROID}

  {$IFDEF MSWINDOWS}
  // على ويندوز: استخدم مجلد التطبيق
  // On Windows: Use application folder
  FDConnection1.Params.Values['Database'] := ExtractFileDir(ParamStr(0)) + '\DBReport.db';
  {$ENDIF MSWINDOWS}
end;

// -------------------------------------------------------------------------
// الحدث: QuerySQLAfterOpen
// الوظيفة: إخفاء مربعات التحرير بعد فتح الاستعلام
// Purpose: Hide editing boxes after query is opened
// لإظهار النتائج فقط
// To show results only
// -------------------------------------------------------------------------
procedure TFormMain.QuerySQLAfterOpen(DataSet: TDataSet);
begin
  RectMasq.Visible := false;
  RectSQL.Visible := false;
end;

end.
