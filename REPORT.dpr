program REPORT;

uses
  System.StartUpCopy,
  FMX.Forms,
  DesignU in 'DesignU.pas' {DesignF},
  PreviewU in 'PreviewU.pas' {PreviewF},
  UnitMain in 'UnitMain.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDesignF, DesignF);
  Application.CreateForm(TPreviewF, PreviewF);

  Application.Run;
end.
