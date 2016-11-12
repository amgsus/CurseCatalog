unit Splash.Welcome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, pngimage, ExtCtrls;

type
  TSplashWelcomeForm = class(TForm)
    LogoImage: TImage;
    ProgressBar: TProgressBar;
    ActionLabel: TLabel;
    Label_1: TLabel;
    VersionLabel: TLabel;
    Label_2: TLabel;
    Shape: TShape;
    DeveloperLabel: TLabel;
    procedure FormCreate(Sender: TObject);
  public
    procedure SetProgress(const Value: Integer);
  end;

var
  SplashWelcomeForm: TSplashWelcomeForm;

implementation

{$R *.dfm}

uses
  Splash.About;

{ TSplashWelcomeForm }

procedure TSplashWelcomeForm.FormCreate(Sender: TObject);
begin
  Caption := Application.Title + ' - Загрузка...';
  VersionLabel.Caption := 'Версия: ' + VERSION;
end;

procedure TSplashWelcomeForm.SetProgress(const Value: Integer);
begin
  ProgressBar.Position := Value;
  Update;
end;

end.
