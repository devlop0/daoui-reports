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
    BindNavigator1: TBindNavigator;
    BindNavigator2: TBindNavigator;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout4: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    VertScrollBox1: TVertScrollBox;
    Layout5: TLayout;
    Layout3: TLayout;
    Button1: TButton;
    Button2: TButton;
    QuerySQL: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    Image1: TImage;
    Layout6: TLayout;
    Layout7: TLayout;
    Edit3: TEdit;
    Label3: TLabel;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    Text1: TText;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Layout8: TLayout;
    Label5: TLabel;
    Button3: TButton;
    RectMasq: TRectangle;
    RectSQL: TRectangle;
    Layout9: TLayout;
    MemoSQL: TMemo;
    Layout10: TLayout;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    RectBande: TRectangle;
    Layout11: TLayout;
    Layout12: TLayout;
    Button7: TButton;
    CheckHeader: TCheckBox;
    CheckTitle: TCheckBox;
    CheckColumnH: TCheckBox;
    CheckDetail: TCheckBox;
    ChckSubDet: TCheckBox;
    CheckSum: TCheckBox;
    CheckFooter: TCheckBox;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure QuerySQLAfterOpen(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckHeaderChange(Sender: TObject);
    procedure CheckTitleChange(Sender: TObject);
    procedure CheckColumnHChange(Sender: TObject);
    procedure CheckDetailChange(Sender: TObject);
    procedure ChckSubDetChange(Sender: TObject);
    procedure CheckFooterChange(Sender: TObject);
    procedure CheckSumChange(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}
 uses IOUtils,DesignU,PreviewU;
procedure TFormMain.Button1Click(Sender: TObject);
begin
//showmessage( ExtractFileDir(ParamStr(0)) + '\DBReport.db')
close;
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
    PreviewF.exctep := True;
    PreviewF.Show;


end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
 RectMasq.Visible := True;
 RectSQL.Visible:=True;
end;

procedure TFormMain.Button4Click(Sender: TObject);
begin
  QuerySQL.Close;
  QuerySQL.SQL.Text:= MemoSQL.Lines.Text;
QuerySQL.Open;
end;

procedure TFormMain.Button5Click(Sender: TObject);
begin

memo1.Lines.Clear;
memo1.Lines.Text:= 'Select * from ListFish LIMIT 28 ';
 QuerySQL.Close;
QuerySQL.SQL.Text:= 'Select * from ListFish LIMIT 28 ';
 QuerySQL.Open;


end;

procedure TFormMain.Button6Click(Sender: TObject);
begin
 RectMasq.Visible := True;
  RectBande.Visible:=True;

end;

procedure TFormMain.Button7Click(Sender: TObject);
begin
     RectMasq.Visible := False;
  RectBande.Visible := False;
end;

procedure TFormMain.ChckSubDetChange(Sender: TObject);
begin
  DesignF.SubDetailLayt := ChckSubDet.IsChecked;
        DesignF.SubDetail.visible:= ChckSubDet.IsChecked;

end;

procedure TFormMain.CheckColumnHChange(Sender: TObject);
begin
 DesignF.ColumnHeaderLayt := CheckColumnH.IsChecked;
    DesignF.ColumnHeader.visible:= CheckColumnH.IsChecked;

end;

procedure TFormMain.CheckDetailChange(Sender: TObject);
begin
 DesignF.ZoneDetail.Visible := CheckDetail.IsChecked;


end;

procedure TFormMain.CheckFooterChange(Sender: TObject);
begin
    DesignF.PageFooterLayt := CheckFooter.IsChecked;
      DesignF.PageFooter.visible := CheckFooter.IsChecked;

end;

procedure TFormMain.CheckHeaderChange(Sender: TObject);
begin
DesignF.PageHeaderLayt:= CheckHeader.IsChecked;
DesignF.PageHeader.visible:= CheckHeader.IsChecked;

end;

procedure TFormMain.CheckSumChange(Sender: TObject);
begin
 DesignF.SummaryLayt := CheckSum.IsChecked;
 DesignF.Summary.visible := CheckSum.IsChecked;

end;

procedure TFormMain.CheckTitleChange(Sender: TObject);
begin
   DesignF.TitleLayt:= CheckTitle.IsChecked;
   DesignF.Title.visible:= CheckTitle.IsChecked;

end;

procedure TFormMain.DataSource1DataChange(Sender: TObject; Field: TField);
begin
   Label5.Text:= inttostr(QuerySQL.RecNo)+'/'+inttostr(QuerySQL.RecordCount);
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
if not QuerySQL.Active then

  QuerySQL.Open;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
       {$IFDEF ANDROID}
 FDConnection1.Params.Values['Database'] :=
 TPath.GetDocumentsPath + PathDelim + 'DBReport.db';

      {$ENDIF ANDROID}

       {$IFDEF MSWINDOWS}
 FDConnection1.Params.Values['Database'] := ExtractFileDir(ParamStr(0)) + '\DBReport.db';
   //   FDConnection1.Params.Password:='1d*kMb#dAoUi/m-96+v>£qsMln*89+j79ùj%#vxy80µhsq2019coved19';
          {$ENDIF MSWINDOWS}

end;

procedure TFormMain.QuerySQLAfterOpen(DataSet: TDataSet);
begin
    RectMasq.Visible:=false;
 RectSQL.Visible:=false;
end;

end.
