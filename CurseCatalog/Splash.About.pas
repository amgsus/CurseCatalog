unit Splash.About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, StdCtrls;

const
  VERSION = '1.0.2 Beta';
  RELEASE_DATE = '10.06.2014';

type
  TSplashDialog = class(TForm)
    BottomPanel: TPanel;
    BottomBevel: TBevel;
    LogoImage: TImage;
    Label_1: TLabel;
    Label_2: TLabel;
    VersionLabel: TLabel;
    ButtonOK: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DBVersionLabel: TLabel;
    procedure FormCreate(Sender: TObject);
  end;

procedure ShowSplashDialog;

implementation

{$R *.dfm}

uses
  CCDBv2;

procedure ShowSplashDialog;
var
  Dlg: TSplashDialog;
begin
  Dlg := TSplashDialog.Create(Application);
  try
    Dlg.ShowModal;
  finally
    Dlg.Free;
  end;
end;

{ TSplashDialog }

procedure TSplashDialog.FormCreate(Sender: TObject);
begin
  VersionLabel.Caption := Format('Версия %s (от %s)', [VERSION, RELEASE_DATE]);
  DBVersionLabel.Caption := Format('Версия CCDB: %s', [CCDB_VERSION]);
end;

end.
