program Y14S2CW;

uses
  Windows,
  SysUtils,
  Forms,
  Main in 'Main.pas' {MainForm},
  CCDBv2 in 'CCDBv2.pas',
  ItemEditor.Base in 'ItemEditor.Base.pas' {ItemEditorBaseFrame: TFrame},
  ItemEditor.Motherboards in 'ItemEditor.Motherboards.pas' {ItemEditorFrame_MB: TFrame},
  ItemEditor.CPUs in 'ItemEditor.CPUs.pas' {ItemEditorFrame_CPU: TFrame},
  ItemEditor.RAM in 'ItemEditor.RAM.pas' {ItemEditorFrame_RAM: TFrame},
  ItemEditor.HDDs in 'ItemEditor.HDDs.pas' {ItemEditorFrame_HDD: TFrame},
  ItemEditor.Coolant in 'ItemEditor.Coolant.pas' {ItemEditorFrame_COL: TFrame},
  ItemEditor.PowerSupply in 'ItemEditor.PowerSupply.pas' {ItemEditorFrame_PWR: TFrame},
  ItemEditor.Graphics in 'ItemEditor.Graphics.pas' {ItemEditorFrame_GPU: TFrame},
  ItemEditor.Audio in 'ItemEditor.Audio.pas' {ItemEditorFrame_AUD: TFrame},
  ItemEditor.ODDs in 'ItemEditor.ODDs.pas' {ItemEditorFrame_ODD: TFrame},
  ItemEditor.SysUnits in 'ItemEditor.SysUnits.pas' {ItemEditorFrame_UNT: TFrame},
  Splash.Welcome in 'Splash.Welcome.pas' {SplashWelcomeForm},
  Splash.About in 'Splash.About.pas' {SplashDialog},
  Dialog.Message in 'Dialog.Message.pas' {MessageExDialog},
  SearchDlg.Opts in 'SearchDlg.Opts.pas' {SearchQueryDialog},
  SearchDlg.Results in 'SearchDlg.Results.pas' {SearchResultsForm},
  DataExports in 'DataExports.pas' {DataExportDialog},
  RecFilters in 'RecFilters.pas' {FilterDialog},
  AuxProcs in 'AuxProcs.pas';

{$R *.res}

const
  SLEEP_TIME = 1000;

var
  DelayTime: Cardinal;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'CurseCatalog [Alpha]';
  SplashWelcomeForm := TSplashWelcomeForm.Create(Application);
  try
    SplashWelcomeForm.Show;
    SplashWelcomeForm.Update;

    DelayTime := GetTickCount();

    { Main }
    Application.CreateForm(TMainForm, MainForm);
  { Go into sleep if delay time is not exceeded }
    SplashWelcomeForm.Repaint;
    if GetTickCount - DelayTime < SLEEP_TIME - 20 then
      Sleep(GetTickCount - DelayTime);
  finally
    FreeAndNil(SplashWelcomeForm);
  end;

  Application.Run;
end.
