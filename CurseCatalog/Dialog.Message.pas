unit Dialog.Message;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, PngImageList;

type
  TMessageDlgType = (mtNone, mtInfo, mtQuestion, mtWarning, mtError);
  TMessageDlgButtons = (mbOK, mbYesNo, mbYesNoCancel, mbRetryCancel);

  TMessageExDialog = class(TForm)
    BottomPanel: TPanel;
    ButtonHelp: TButton;
    MsgImage: TImage;
    BottomBevel: TBevel;
    CaptionLabel: TLabel;
    MsgLabel: TLabel;
    Images: TPngImageList;
    ButtonA: TButton;
    ButtonB: TButton;
    ButtonC: TButton;
  public
    procedure SetMessageType(const MsgType: TMessageDlgType);
    procedure SetButtons(const Buttons: TMessageDlgButtons);
  end;

{ Shows message dialog (extended) }
function MessageDlgEx(const MsgCaption, MsgText: String; const MsgType: TMessageDlgType;
  const Buttons: TMessageDlgButtons): TModalResult;

{ Shows message dialog (lite) }
function ShowMessage(const MsgCaption, MsgText: String): TModalResult; overload;
function ShowMessage(const MsgText: String): TModalResult; overload;

function ShowConfirmation(const MsgCaption, MsgText: String): TModalResult; overload;
function ShowConfirmation(const MsgText: String): TModalResult; overload;

function ShowWarning(const MsgCaption, MsgText: String): TModalResult; overload;
function ShowWarning(const MsgText: String): TModalResult; overload;

function ShowError(const MsgCaption, MsgText: String): TModalResult; overload;
function ShowError(const MsgText: String): TModalResult; overload;

implementation

{$R *.dfm}

function MessageDlgEx(const MsgCaption, MsgText: String; const MsgType: TMessageDlgType;
  const Buttons: TMessageDlgButtons): TModalResult;
var
  Dlg: TMessageExDialog;
begin
  Dlg := TMessageExDialog.Create(Application);
  try
    with Dlg do
    begin
      SetMessageType(MsgType);
      SetButtons(Buttons);
      CaptionLabel.Caption := MsgCaption;
      MsgLabel.Caption := MsgText;
      Result := ShowModal;
    end;
  finally
    Dlg.Free;
  end;
end;

function ShowMessage(const MsgCaption, MsgText: String): TModalResult;
begin
  Result := MessageDlgEx(MsgCaption, MsgText, mtInfo, mbOK);
end;

function ShowMessage(const MsgText: String): TModalResult;
begin
  Result := ShowMessage('Информация:', MsgText);
end;

function ShowConfirmation(const MsgCaption, MsgText: String): TModalResult;
begin
  Result := MessageDlgEx(MsgCaption, MsgText, mtQuestion, mbYesNo);
end;

function ShowConfirmation(const MsgText: String): TModalResult;
begin
  Result := ShowConfirmation('Подтверждение:', MsgText);
end;

function ShowWarning(const MsgCaption, MsgText: String): TModalResult;
begin
  Result := MessageDlgEx(MsgCaption, MsgText, mtWarning, mbOK);
end;

function ShowWarning(const MsgText: String): TModalResult;
begin
  Result := ShowWarning('Обратите внимание:', MsgText);
end;

function ShowError(const MsgCaption, MsgText: String): TModalResult;
begin
  Result := MessageDlgEx(MsgCaption, MsgText, mtError, mbOK);
end;

function ShowError(const MsgText: String): TModalResult;
begin
  Result := ShowError('Ошибка!', MsgText);
end;

{ TMessageExDialog }

procedure TMessageExDialog.SetButtons(const Buttons: TMessageDlgButtons);
begin
  case Buttons of
    mbOK:
      begin
        with ButtonA do
        begin
          Caption := 'OK';
          ModalResult := mrOK;
          Show;
        end;
      end;

    mbYesNo:
      begin
        with ButtonA do
        begin
          Caption := 'Нет';
          ModalResult := mrNo;
          Show;
        end;
        with ButtonB do
        begin
          Caption := 'Да';
          ModalResult := mrYes;
          Show;
        end;
      end;

    mbYesNoCancel:
      begin
        with ButtonA do
        begin
          Caption := 'Отмена';
          ModalResult := mrCancel;
          Show;
        end;
        with ButtonB do
        begin
          Caption := 'Нет';
          ModalResult := mrNo;
          Show;
        end;
        with ButtonC do
        begin
          Caption := 'Да';
          ModalResult := mrYes;
          Show;
        end;
      end;

    mbRetryCancel:
      begin
        with ButtonA do
        begin
          Caption := 'Отмена';
          ModalResult := mrCancel;
          Show;
        end;
        with ButtonB do
        begin
          Caption := 'Повторить';
          ModalResult := mrRetry;
          Show;
        end;
      end;
  end;
end;

procedure TMessageExDialog.SetMessageType(const MsgType: TMessageDlgType);
begin
  case MsgType of
    mtNone:
      begin
        Caption := 'Сообщение';
        MsgImage.Picture := nil;
      end;

    mtInfo:
      begin
        Caption := 'Информация';
        MsgImage.Picture.Assign(Images.PngImages[0].PngImage);
        MessageBeep(MB_OK);
      end;

    mtQuestion:
      begin
        Caption := 'Вопрос';
        MsgImage.Picture.Assign(Images.PngImages[1].PngImage);
        MessageBeep(MB_ICONQUESTION);
      end;

    mtWarning:
      begin
        Caption := 'Предупреждение';
        MsgImage.Picture.Assign(Images.PngImages[2].PngImage);
        MessageBeep(MB_ICONEXCLAMATION);
      end;

    mtError:
      begin
        Caption := 'Ошибка';
        MsgImage.Picture.Assign(Images.PngImages[3].PngImage);
        MessageBeep(MB_ICONHAND);
      end;
  end;
end;

end.
