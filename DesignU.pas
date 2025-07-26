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
  Data.Bind.DBScope,FMX.TextLayout, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, Datasnap.DBClient;

type
  TDesignF = class(TForm)
    EReport1: TLayout;
    ERRectPage: TRectangle;
    LayoCadrConti: TLayout;
    PageHeader: TLayout;
    RectPageHeader: TRectangle;
    Text10: TText;
    PageFooter: TLayout;
    RectPageFooter: TRectangle;
    Text9: TText;
    Title: TLayout;
    Text4: TText;
    Text19: TText;
    ColumnHeader: TLayout;
    Rectangle10: TRectangle;
    Text5: TText;
    Rectangle7: TRectangle;
    Text24: TText;
    Text23: TText;
    SubDetail: TLayout;
    RectSubDetail: TRectangle;
    Text3: TText;
    TextSubSum: TText;
    Summary: TLayout;
    RectSummary: TRectangle;
    TextSummary: TText;
    Text11: TText;
    ZoneDetail: TLayout;
    Detail: TLayout;
    RectDetail: TRectangle;
    TextRecNo: TText;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Text2: TText;
    Text25: TText;
    ReportQuery: TFDQuery;
    BindingsList1: TBindingsList;
    DataSource1: TDataSource;
    EndPagee: TLine;
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
    { D�clarations priv�es }
    totl,total0,Gtotl,Canclcc:single;

    function gethighMemo(memo:TMemo;memoWidh: Single; txte: string; RectHigh: Single): Single;
function gethighlabel(labl:TLabel;lablWidh:Single;txte:string;RectHigh:Single ): Single;
function gethighTText(labl:TText;lablWidh:Single;txte:string;RectHigh:Single ): Single;

  public
    { D�clarations publiques }
     PageHeaderLayt : boolean;
 TitleLayt: boolean;
 ColumnHeaderLayt : boolean;
 SubDetailLayt : boolean;
 SummaryLayt : boolean;
 PageFooterLayt : boolean;
     function ClerReport :Boolean;
 function ClerDetail : Boolean;
    { D�clarations publiques }
 function PreparReport(npae:Integer) :Boolean;
 function DESINGFACT(TableRecordCount:Integer): Boolean;
  end;

var
  DesignF: TDesignF;
       FileName: string;
     N: Integer;
     Cleardd: Boolean = False ;
     canCalcul: Boolean = False ;
     pross1,nrcd,precdnL,precdnT:Integer ;
     NewPagee:Boolean = False ;
     PositionPrior : Integer;
implementation

{$R *.fmx}
 uses PreviewU,UnitMain;

{ TForm10 }


              ////////////////   من اجل حذف الجدول تفاصيل
function TDesignF.ClerDetail: Boolean;
var
i,j:Byte;

begin
  result:=False;
 Cleardd:= False;
 try
   // with FormDesigner do
   begin

  if ZoneDetail.ChildrenCount >0 then  // حذف المربعات الثانوية
   begin
   for j := ZoneDetail.ChildrenCount -1   downto 0 do
   begin
    if ((ZoneDetail.Children.Items[j]) is TRectangle) then
     // if  ((ZoneDetail.Children.Items[j])  as TLayout).Name <> 'Detail' then
       ((ZoneDetail.Children.Items[j]) as TRectangle).DisposeOf;
    application.ProcessMessages;
   end;

   end
   else
if ZoneDetail.ComponentCount >0 then   // حذف المربعات الرئسية
 begin

   for i := ZoneDetail.ComponentCount -1 downto 0 do
      begin
       if ZoneDetail.Components[i] is TRectangle then
    // if  (ZoneDetail.Components[i] as TLayout).Name <> 'Detail' then
      (ZoneDetail.Components[i] as TRectangle).DisposeOf;
      application.ProcessMessages;
      end;
 end;
   // if precdn>-1 then
   // ((Detail.Children.Items[precdn]) as TLabel).Text:='RecNo';
   end
 finally
    result:=true;
   Cleardd:= true;
 end;


end;

function TDesignF.ClerReport: Boolean;
var
i,j:Byte;

begin
 result:=False;
 Cleardd:= False;
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
   result:=true;
   Cleardd:= true;
end;



end;

procedure TDesignF.DataSource1DataChange(Sender: TObject; Field: TField);

begin

   TextRecNo.Text:= inttostr(ReportQuery.RecNo); // Show Record Number Position #

  TextSubSum.Text := formatfloat('##,##0.00',totl);// Sum in Page
  TextSummary.Text:=  formatfloat('##,##0.00',Gtotl); // sum in All Pages
  if ReportQueryLengthCmField.Value < 0 then
  Text14.TextSettings.FontColor:=TalphaColors.Red
  else
  Text14.TextSettings.FontColor:=TalphaColors.Darkred;
end;




function TDesignF.DESINGFACT(TableRecordCount: Integer): Boolean;
 const
offset = 4;
 var
 ERect : TRect;
 EText : string;
  ELabbl:tlabel;
    i,j,k,cn: Byte;
  Rectd: TRectangle;
 // RectdPrior: TFmxObject;
 defuHig,wwidth,hheight,DetalHieght,hh:Single;
 HeightFotPae,HeightSum,HieghtSubDtil,TolHigh,TestHig:Single;
 ttxt :string;
 Np,reccnt,frstTit,reccntglb:Integer;
begin
  Cleardd := False;
  ClerDetail;
 repeat
   Application.ProcessMessages;
   Continue;
 until (Cleardd = true);

 Cleardd := False;
 Application.ProcessMessages;
ClerReport;
 repeat
   Application.ProcessMessages;
   Continue;
 until (Cleardd = true);
   reccntglb:=TableRecordCount;
 frstTit:=0;
defuHig:= Detail.Height; DetalHieght:=0;
   cn:=0;   reccnt:=0;   Np:=0;
   Gtotl:=0;   totl:=0; Canclcc:=1;
   nrcd:=1;
   Pross1:=round((nrcd *100)/reccntglb) ;
 if ZoneDetail.Visible = False then
 begin
      np:=1;
   Cleardd := False;
   PreparReport(np);
    repeat
     Application.ProcessMessages;
     Continue;
    until (Cleardd = true);
 end
 else
begin

 ReportQuery.First;

 while
 (not ReportQuery.Eof) do
 begin
 Pross1:=round((nrcd *100)/reccntglb) ;
    ZoneDetail.BeginUpdate;
        Rectd := TRectangle.Create(ZoneDetail);
        Rectd.Parent := ZoneDetail;
        try
        Rectd.Name :='ERrctDital'+IntToStr(cn);
        Rectd.Width := Detail.Width;

        Rectd.Fill.Kind:= TBrushKind.Bitmap;
        Rectd.Fill.Bitmap.WrapMode:=TWrapMode.TileStretch;
        Rectd.Stroke.Kind:=TBrushKind.None;

        Rectd.Position.X := 0;

       Detail.Height:= defuHig ;

      if Detail.ChildrenCount >0 then
      begin
         for j := Detail.ChildrenCount -1   downto 0 do
      begin
       application.ProcessMessages;
             /// if use Text
   if (Detail.Children.Items[j] is TText) then
       begin

  ((Detail.Children.Items[j]) as TText).WordWrap:=True;
       ((Detail.Children.Items[j]) as TText).AutoSize:=False;

      wwidth:=((Detail.Children.Items[j]) as TText).Width;

      ttxt:=Trim(((Detail.Children.Items[j]) as TText).Text);
       if (ttxt)='' then
       begin
            ttxt:='!';
            end;
     Detail.Height:= gethighTText((Detail.Children.Items[j] as TText),
      wwidth,ttxt, Detail.Height);//+2


      end
      else
      if (Detail.Children.Items[j] is TMemo) then
      begin

         hh:=(Detail.Children.Items[j] as TMemo).ContentBounds.Height +offset;
       if hh >  Detail.Height then
        Detail.Height := hh;

      end
      else
            /// if use label
        if (Detail.Children.Items[j] is TLabel) then
       begin
       ((Detail.Children.Items[j]) as TLabel).WordWrap:=True;
       ((Detail.Children.Items[j]) as TLabel).AutoSize:=False;
       wwidth:=((Detail.Children.Items[j]) as TLabel).Width;
        ttxt:=Trim(((Detail.Children.Items[j]) as TLabel).Text);
       if (ttxt)='' then
       begin
            ttxt:='!';
            end;
     Detail.Height:= gethighlabel((Detail.Children.Items[j] as TLabel),
      wwidth,ttxt, Detail.Height);// +2
      end;
      ///////////////////////////// sous rectangle ///////////////////////////////////////////////
       if Detail.Children.Items[j].ChildrenCount >0 then
        for k := Detail.Children.Items[j].ChildrenCount -1   downto 0 do
         begin
           application.ProcessMessages;
             /// if use Text
   if (Detail.Children.Items[j].Children.Items[k] is TText) then
       begin

  ((Detail.Children.Items[j].Children.Items[k]) as TText).WordWrap:=True;
       ((Detail.Children.Items[j].Children.Items[k]) as TText).AutoSize:=False;

      wwidth:=((Detail.Children.Items[j].Children.Items[k]) as TText).Width;

      ttxt:=Trim(((Detail.Children.Items[j].Children.Items[k]) as TText).Text);
       if (ttxt)='' then
       begin
            ttxt:='!';
            end;
     Detail.Height:= gethighTText((Detail.Children.Items[j].Children.Items[k] as TText),
      wwidth,ttxt, Detail.Height);//+2

        end
      else
      if (Detail.Children.Items[j].Children.Items[k] is TMemo) then
      begin

         hh:=(Detail.Children.Items[j].Children.Items[k] as TMemo).ContentBounds.Height +offset;
       if hh >  Detail.Height then
        Detail.Height := hh;

      end
      else
            /// if use label
        if (Detail.Children.Items[j].Children.Items[k] is TLabel) then
       begin
       ((Detail.Children.Items[j].Children.Items[k]) as TLabel).WordWrap:=True;
       ((Detail.Children.Items[j].Children.Items[k]) as TLabel).AutoSize:=False;
       wwidth:=((Detail.Children.Items[j].Children.Items[k]) as TLabel).Width;
        ttxt:=Trim(((Detail.Children.Items[j].Children.Items[k]) as TLabel).Text);
       if (ttxt)='' then
       begin
            ttxt:='!';
            end;
     Detail.Height:= gethighlabel((Detail.Children.Items[j].Children.Items[k] as TLabel),
      wwidth,ttxt, Detail.Height);// +2
      end;
      end;

      //////////////////////////////////////////////////////////////////////////////

         Application.ProcessMessages;
      end;

      end ;


     finally
       ZoneDetail.endupdate;

      end;

       //  Detail.align:=TAlignLayout.none;
      Rectd.Height :=Detail.Height;
      Rectd.Position.Y := DetalHieght ;
      DetalHieght := DetalHieght + Rectd.Height ;
      ZoneDetail.Height := DetalHieght;

        Rectd.Fill.Bitmap.Bitmap.Assign(Detail.MakeScreenshot);
       Detail.Visible := False;

 PageHeader.visible:= PageHeaderLayt = True;
 if frstTit = 0 then
  Title.visible:= TitleLayt = True;
 ColumnHeader.visible:= ColumnHeaderLayt = True;
   ColumnHeader.Align:=TAlignLayout.Bottom;
  ColumnHeader.Align:=TAlignLayout.MostTop;
 SubDetail.visible:= SubDetailLayt = True;
 Summary.visible:= SummaryLayt = True;
 PageFooter.visible:= PageFooterLayt = True;

     Summary.visible:= False;
   total0 :=  ReportQueryLengthCmField.Value;
   Gtotl:= Gtotl + total0;
   totl:= totl + total0;
 if PageFooterLayt = True then
    begin
    if SubDetailLayt = true then
    begin
      DetalHieght := DetalHieght + SubDetail.Height ;
      ZoneDetail.Height := DetalHieght;
     if not (ZoneDetail.BoundsRect.IntersectsWith(PageFooter.BoundsRect)) then
     begin
      DetalHieght := DetalHieght - SubDetail.Height ;
      ZoneDetail.Height := DetalHieght;
     end;

    end;


   if  (ZoneDetail.BoundsRect.IntersectsWith(PageFooter.BoundsRect)) then
     begin
     ZoneDetail.Height:=  ZoneDetail.Height - Rectd.Height ;
     DetalHieght:= 0;

     if SubDetailLayt = true then
     begin
     totl:=totl - total0;

     ZoneDetail.Height:=  ZoneDetail.Height - (SubDetail.Height);
   //  DetalHieght:= Rectd.Height;
     end;

      Rectd.Visible:=false;
      reccnt:=1;  frstTit:=1;
      Canclcc := 0;
     end;

     if  (reccnt = 1) then
                begin

   SubDetail.Position.Y :=  ZoneDetail.Position.y + (ZoneDetail.Height);

                 reccnt:=0;
                   np:=np +1;
                   Cleardd := False;
                   PreparReport(np);
                       repeat
                       Application.ProcessMessages;
                       Continue;
                     until (Cleardd = true);

                     Title.Visible :=False;
                   Application.ProcessMessages;
                     Cleardd := False;
             if ZoneDetail.ChildrenCount >0 then
            begin
                  for j := ZoneDetail.ChildrenCount -1   downto 0 do
            begin
           if ((ZoneDetail.Children.Items[j]) is TRectangle) then
       if  ((ZoneDetail.Children.Items[j])  as TRectangle).Name <> Rectd.Name then
       ((ZoneDetail.Children.Items[j]) as TRectangle).DisposeOf;
           Application.ProcessMessages;///////////////////////////////////sino sup
            end;
               Cleardd := True;

           end;
               totl:=totl + total0;
               Rectd.Visible := True;
               Rectd.Position.Y := 0;
               ZoneDetail.Height :=  Rectd.Height ;
               DetalHieght := Rectd.Height;

                end ;

   /// fin record

     if  (ReportQuery.RecNo = TableRecordCount)then //
                begin
     if SubDetailLayt = true then
        begin
    SubDetail.Position.Y :=  ZoneDetail.Position.y + (ZoneDetail.Height);
    ZoneDetail.Height :=ZoneDetail.Height + SubDetail.Height;
        end;
       if SummaryLayt = true then
         begin
       ZoneDetail.Height:=  ZoneDetail.Height + Summary.Height ;
          if not (ZoneDetail.BoundsRect.IntersectsWith(PageFooter.BoundsRect)) then
                   begin
   Summary.visible:= True;
   Summary.Position.Y :=  ZoneDetail.Position.y + (ZoneDetail.Height - Summary.Height);

             np:=np +1;
                   Cleardd := False;
                   PreparReport(np);
                       repeat
                       Application.ProcessMessages;
                       Continue;
                     until (Cleardd = true);

                     Title.Visible :=False;
                   Application.ProcessMessages;

                   end
           else
           begin
         ZoneDetail.Height:=  ZoneDetail.Height - Summary.Height ;
         Summary.visible:= False;
           np:=np +1;
                   Cleardd := False;
                   PreparReport(np);
                       repeat
                       Application.ProcessMessages;
                       Continue;
                     until (Cleardd = true);

                     Title.Visible :=False;
                   Application.ProcessMessages;

             if ZoneDetail.ChildrenCount >0 then
            begin
                  for j := ZoneDetail.ChildrenCount -1   downto 0 do
            begin
           if ((ZoneDetail.Children.Items[j]) is TRectangle) then
      // if  ((ZoneDetail.Children.Items[j])  as TRectangle).Name <> Rectd.Name then
       ((ZoneDetail.Children.Items[j]) as TRectangle).DisposeOf;
           Application.ProcessMessages;///////////////////////////////////sino sup
            end;
               Cleardd := True;
            end;
            ColumnHeader.visible:= False;
           ZoneDetail.Height:=1;
         Summary.visible:= True;
   Summary.Position.Y :=  ZoneDetail.Position.y ;

           np:=np +1;
                   Cleardd := False;
                   PreparReport(np);
                       repeat
                       Application.ProcessMessages;
                       Continue;
                     until (Cleardd = true);

                     Title.Visible :=False;
                   Application.ProcessMessages;

           end;

       end
       else
       begin
        np:=np +1;
        Cleardd := False;
        PreparReport(np);
        repeat
         Application.ProcessMessages;
          Continue;
        until (Cleardd = true);

        Title.Visible :=False;
        Application.ProcessMessages;

       end;


                end;
   end






 //8888888888888888888888888888888888888888888888888888888888888888888888888888
 else
   begin
     if SubDetailLayt = true then
    begin
      DetalHieght := DetalHieght + SubDetail.Height ;
      ZoneDetail.Height := DetalHieght;
     if not (ZoneDetail.BoundsRect.IntersectsWith(EndPagee.BoundsRect)) then
     begin
      DetalHieght := DetalHieght - SubDetail.Height ;
      ZoneDetail.Height := DetalHieght;
     end;

    end;


   if  (ZoneDetail.BoundsRect.IntersectsWith(EndPagee.BoundsRect)) then
     begin
     ZoneDetail.Height:=  ZoneDetail.Height - Rectd.Height ;
     DetalHieght:= 0;

     if SubDetailLayt = true then
     begin
     totl:=totl - total0;

     ZoneDetail.Height:=  ZoneDetail.Height - (SubDetail.Height);
   //  DetalHieght:= Rectd.Height;
     end;

      Rectd.Visible:=false;
      reccnt:=1;  frstTit:=1;
      Canclcc := 0;
     end;

     if  (reccnt = 1) then
                begin

   SubDetail.Position.Y :=  ZoneDetail.Position.y + (ZoneDetail.Height);

                 reccnt:=0;
                   np:=np +1;
                   Cleardd := False;
                   PreparReport(np);
                       repeat
                       Application.ProcessMessages;
                       Continue;
                     until (Cleardd = true);

                     Title.Visible :=False;
                   Application.ProcessMessages;
                     Cleardd := False;
             if ZoneDetail.ChildrenCount >0 then
            begin
                  for j := ZoneDetail.ChildrenCount -1   downto 0 do
            begin
           if ((ZoneDetail.Children.Items[j]) is TRectangle) then
       if  ((ZoneDetail.Children.Items[j])  as TRectangle).Name <> Rectd.Name then
       ((ZoneDetail.Children.Items[j]) as TRectangle).DisposeOf;
           Application.ProcessMessages;///////////////////////////////////sino sup
            end;
               Cleardd := True;

           end;
               totl:=totl + total0;
               Rectd.Visible := True;
               Rectd.Position.Y := 0;
               ZoneDetail.Height :=  Rectd.Height ;
               DetalHieght := Rectd.Height;

                end ;

   /// fin record

     if  (ReportQuery.RecNo = TableRecordCount)then //
                begin
     if SubDetailLayt = true then
        begin
    SubDetail.Position.Y :=  ZoneDetail.Position.y + (ZoneDetail.Height);
    ZoneDetail.Height :=ZoneDetail.Height + SubDetail.Height;
        end;
       if SummaryLayt = true then
         begin
       ZoneDetail.Height:=  ZoneDetail.Height + Summary.Height ;
          if not (ZoneDetail.BoundsRect.IntersectsWith(EndPagee.BoundsRect)) then
                   begin
   Summary.visible:= True;
   Summary.Position.Y :=  ZoneDetail.Position.y + (ZoneDetail.Height - Summary.Height);

             np:=np +1;
                   Cleardd := False;
                   PreparReport(np);
                       repeat
                       Application.ProcessMessages;
                       Continue;
                     until (Cleardd = true);

                     Title.Visible :=False;
                   Application.ProcessMessages;

                   end
           else
           begin
         ZoneDetail.Height:=  ZoneDetail.Height - Summary.Height ;
         Summary.visible:= False;
           np:=np +1;
                   Cleardd := False;
                   PreparReport(np);
                       repeat
                       Application.ProcessMessages;
                       Continue;
                     until (Cleardd = true);

                     Title.Visible :=False;
                   Application.ProcessMessages;

             if ZoneDetail.ChildrenCount >0 then
            begin
                  for j := ZoneDetail.ChildrenCount -1   downto 0 do
            begin
           if ((ZoneDetail.Children.Items[j]) is TRectangle) then
      // if  ((ZoneDetail.Children.Items[j])  as TRectangle).Name <> Rectd.Name then
       ((ZoneDetail.Children.Items[j]) as TRectangle).DisposeOf;
           Application.ProcessMessages;///////////////////////////////////sino sup
            end;
               Cleardd := True;
            end;
            ColumnHeader.visible:= False;
           ZoneDetail.Height:=1;
         Summary.visible:= True;
   Summary.Position.Y :=  ZoneDetail.Position.y ;

           np:=np +1;
                   Cleardd := False;
                   PreparReport(np);
                       repeat
                       Application.ProcessMessages;
                       Continue;
                     until (Cleardd = true);

                     Title.Visible :=False;
                   Application.ProcessMessages;

           end;

       end
       else
       begin
        np:=np +1;
        Cleardd := False;
        PreparReport(np);
        repeat
         Application.ProcessMessages;
          Continue;
        until (Cleardd = true);

        Title.Visible :=False;
        Application.ProcessMessages;

       end;


                end;
 end;
 //8888888888888888888888888888888888888888888888888888888888888888888888888888
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

procedure TDesignF.FormCreate(Sender: TObject);
begin
totl:=0; Gtotl:=0; Canclcc:=0;
  PageHeaderLayt:= PageHeader.visible;
TitleLayt:= Title.visible;
ColumnHeaderLayt:= ColumnHeader.visible;
  SubDetailLayt :=SubDetail.visible;
SummaryLayt := Summary.visible;
 PageFooterLayt :=PageFooter.visible;

end;

function TDesignF.gethighlabel(labl: TLabel; lablWidh: Single; txte: string;
  RectHigh: Single): Single;
var
   Layout: TTextLayout;
  hd, hightt:Single;
  begin
//  Result:= RectHigh;


      // Create a TTextLayout to measure text dimensions
  Layout := TTextLayoutManager.DefaultTextLayout.Create;
  try
    Layout.BeginUpdate;
    try
      // Initialize layout parameters with those of the drawable
      Layout.Font.Assign(labl.Font);
      Layout.VerticalAlign := labl.VertTextAlign;//TextVertAlign;
      Layout.HorizontalAlign := labl.TextAlign;
      Layout.WordWrap := labl.WordWrap;
      Layout.Trimming := labl.Trimming;
      Layout.MaxSize := TPointF.Create(lablWidh, TTextLayout.MaxLayoutSize.Y);
      Layout.Text := txte;
    finally
      Layout.EndUpdate;
    end;
    // Get layout height
    Result := Round(Layout.Height);
    // Add one em to the height
    Layout.Text :=  'm';
    Result := Result + Round(Layout.Height);
      if Result > RectHigh  then
   begin

        Result := Result ;//+2;

    end
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

function TDesignF.gethighTText(labl: TText; lablWidh: Single; txte: string;
  RectHigh: Single): Single;
var
   Layout: TTextLayout;
  hd, hightt:Single;

  begin
//  Result:= RectHigh;
      Layout := TTextLayoutManager.DefaultTextLayout.Create;
  try
    Layout.BeginUpdate;
    try
      // Initialize layout parameters with those of the drawable
      Layout.Font.Assign(labl.Font);
          // الحجم الإفتراصي
         // Layout.Font.Size:=22;

      Layout.VerticalAlign := labl.VertTextAlign;
      Layout.HorizontalAlign :=labl.HorzTextAlign;
      Layout.WordWrap := labl.WordWrap;
      Layout.Trimming := labl.Trimming;
      Layout.MaxSize := TPointF.Create(lablWidh, TTextLayout.MaxLayoutSize.Y);
       Layout.Text := txte;
    finally
      Layout.EndUpdate;
    end;
    // Get layout height
    Result := Round(Layout.Height);
    // Add one em to the height
    Layout.Text :=  'm';
    Result := Result + Round(Layout.Height);

          if Result > RectHigh  then
   begin

        Result := Result //+2;

    end
    else
    Result := RectHigh;


  finally
    Layout.Free;
  end;



end;

function TDesignF.PreparReport(npae: Integer): Boolean;
 begin
       ReportQuery.edit;
    result:=False;
   Cleardd:= False;
   PreviewF.LayoutZOM.BeginUpdate;  // بداية تحديث العارض Preview
  try

  PreviewF.ERPage := TERPage.Create(PreviewF.LayoutZOM); // create New image
    PreviewF.ERPage.Parent:= PreviewF.LayoutZOM;

        PreviewF.ERPage.Name :='ERPage'+IntToStr(npae);
        PreviewF.ERPage.Npage := npae;     // n° page
        PreviewF.ERPage.WrapMode:=timageWrapMode.stretch;
         // with FormDesigner do
 //  begin
               PreviewF.ERPage.Height:=Round(EReport1.Height);
      PreviewF.ERPage.Width:=Round(EReport1.Width);
      PreviewF.ERPage.Bitmap.Height:=Round(EReport1.Height);
      PreviewF.ERPage.Bitmap.width:=Round(EReport1.Width);

      PreviewF.LayoutZOM.Height:=Round(((EReport1.Height * npae ))+(15 * npae));

      PreviewF.ERPage.Position.Y:=PreviewF.LayoutZOM.Height - Round(EReport1.Height);
      PreviewF.ERPage.Position.x:=0;
      PreviewF.ERPage.Bitmap:=EReport1.MakeScreenshot;
     { PreviewF.ERPage.OnClick:=PreviewF.ERPageClick;
      PreviewF.ERPage.OnResize:=PreviewF.ERPageResize;
      PreviewF.ERPage.OnGesture:=PreviewF.ERPageGesture;
     PreviewF.ERPage.OnMouseLeave:=PreviewF.ERPageMouseLeave;
      PreviewF.ERPage.OnMouseUp:=PreviewF.ERPageMouseUp;
      PreviewF.ERPage.OnMouseWheel:=PreviewF.ERPageMouseWheel;
      PreviewF.ERPage.OnMouseMove:=PreviewF.ERPageMouseMove;
      PreviewF.ERPage.OnMouseDown:=PreviewF.ERPageMouseDown;  }
 //  end;

     finally
      totl:=0;
     Canclcc := 1;

     NewPagee:=True;
      PreviewF.LayoutZOM .EndUpdate;
      result:=true;
      Cleardd:= true;
       PreviewF.LabelNPge.Text:=IntToStr(npae);
       PreviewF.NumPage.Max:=PreviewF.LayoutZOM.ComponentCount;
       PreviewF.LabelNpaes.Text:=IntToStr(Pross1)+'% Page 1  : '+IntToStr(npae);
       ReportQuery.cancel;
     end;

end;

end.
