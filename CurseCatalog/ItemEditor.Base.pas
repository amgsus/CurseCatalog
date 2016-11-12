unit ItemEditor.Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, PngBitBtn, ExtCtrls, pngimage, ComCtrls, CCDBv2;

const
  WM_ITEMEDITOR = WM_USER + $0010;
  CRLF = #13#10;

type
  TItemEditorMode = (emHidden, emAdditing, emEditing, emPreviewing);

  TItemEditorBaseFrame = class(TFrame)
    BottomPanel: TPanel;
    BottomBevel: TBevel;
    ButtonCancel: TPngBitBtn;
    ButtonOK: TPngBitBtn;
    TopPanel: TPanel;
    TopBevel: TBevel;
    FrameIcon: TImage;
    PageControl: TPageControl;
    CommonTabSheet: TTabSheet;
    ImageTabSheet: TTabSheet;
    CaptionLabel_1: TLabel;
    VendorCombo: TComboBox;
    ImageGroupBox: TGroupBox;
    PreviewImage: TImage;
    ImgOpenButton: TButton;
    ImgCleanButton: TButton;
    CaptionLabel_4: TLabel;
    ButtonEdit: TButton;
    YearCombo: TComboBox;
    CaptionLabel_5: TLabel;
    QuarterCombo: TComboBox;
    ModelEdit: TEdit;
    CaptionLabel_2: TLabel;
    ProductIDEdit: TEdit;
    CaptionLabel_3: TLabel;
    CaptionLabel_6: TLabel;
    MinPriceEdit: TEdit;
    MaxPriceEdit: TEdit;
    CaptionLabel_7: TLabel;
    DescriptionMemo: TMemo;
    CaptionLabel_8: TLabel;
    OpenDialog: TOpenDialog;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure ImgCleanButtonClick(Sender: TObject);
    procedure ImgOpenButtonClick(Sender: TObject);
  private
    FRecPtr: Pointer;
    procedure SetMode(const Value: TItemEditorMode);
    procedure EnableEditing(const Enabled: Boolean);
  protected
    FBackforceHandle: Cardinal; // Handle of main form
    FMode: TItemEditorMode;
    FCatalogName: String;
    FDefaultData: PRecCommonData; // Contains default data
    FDefaultDataEx: Pointer;
    FImgFileName: String;
    procedure Initialize; virtual;
    procedure Finalize; virtual;
    procedure SetBackforceHandle(const AHandle: Cardinal);
    procedure ValidateFields(var Valid: Boolean); virtual;
    procedure TrimFields; virtual;
    { *** }
    function ValueInRange(const Value, Min, Max: Cardinal): Boolean;
  public
    constructor Create(AOwner: TComponent; const ABackforceHandle: Cardinal;
      const CatName: String = ''); overload;
     destructor Destroy; override;
    { *** }
    procedure Reset; virtual;
    procedure UpdateTitle;
    procedure SetCaption(const ItemName: String); virtual;
    procedure GetData(const Data: PRecCommonData);
    procedure SetData(const Data: PRecCommonData);
    procedure GetDataEx(const Data: Pointer); virtual; abstract;
    procedure SetDataEx(const Data: Pointer); virtual; abstract;
    { *** }
    function GetShortDescription(const ExData: Pointer): String; virtual; abstract;
    function GetDescription(const ExData: Pointer): String; virtual; abstract;
    { *** }
    property Mode: TItemEditorMode read FMode write SetMode;
    property RecPtr: Pointer read FRecPtr write FRecPtr;
  end;

implementation

{$R *.dfm}

uses
  Dialog.Message, AuxProcs;

{ TItemEditorBaseFrame }

procedure TItemEditorBaseFrame.ButtonCancelClick(Sender: TObject);
begin
  SendMessage(FBackforceHandle, WM_ITEMEDITOR, Integer(mrCancel), 0);
end;

procedure TItemEditorBaseFrame.ButtonEditClick(Sender: TObject);
begin
  SetMode(emEditing);
end;

procedure TItemEditorBaseFrame.ButtonOKClick(Sender: TObject);
var
  OK: Boolean;
begin
  TrimFields; // Trim spaces in text fields
  ValidateFields(OK); // Validate fields

  if OK then
    SendMessage(FBackforceHandle, WM_ITEMEDITOR, Integer(mrOK), 0)
  else
    ShowWarning('Неверно заполнены поля!', 'Проверьте значения полей. ' +
    'Обратите внимание, что значения цифровых полей должны находиться в диапазоне от 0 до 65535.');
end;

constructor TItemEditorBaseFrame.Create(AOwner: TComponent; const ABackforceHandle: Cardinal;
  const CatName: String = '');
begin
  inherited Create(AOwner);
  SetBackforceHandle(ABackforceHandle);
  FCatalogName := CatName;
  New(FDefaultData);
  Initialize;
end;

destructor TItemEditorBaseFrame.Destroy;
begin
  Finalize;
  inherited;
end;

procedure TItemEditorBaseFrame.EnableEditing(const Enabled: Boolean);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TCustomEdit then
      TCustomEdit(Components[i]).Enabled := Enabled
    else
    if Components[i] is TCustomComboBox then
      TCustomComboBox(Components[i]).Enabled := Enabled
    else
    if Components[i] is TCustomCheckBox then
      TCustomCheckBox(Components[i]).Enabled := Enabled;
  end;

  ImgOpenButton.Visible := Enabled;
  ImgCleanButton.Visible := Enabled;
end;

procedure TItemEditorBaseFrame.Finalize;
begin
  Dispose(FDefaultData);
end;

procedure TItemEditorBaseFrame.FrameResize(Sender: TObject);
begin
  ButtonCancel.Left := BottomPanel.Width - ButtonCancel.Width - 8;
  ButtonOK.Left := ButtonCancel.Left - ButtonOK.Width - 8;
end;

procedure TItemEditorBaseFrame.GetData(const Data: PRecCommonData);
begin
  with Data^ do
  begin
    {$WARNINGS OFF}
    Vendor := VendorCombo.Text;
    Model := ModelEdit.Text;
    ProductID := ProductIDEdit.Text;
    Notes := DescriptionMemo.Text;
    ReleaseYear := YearCombo.ItemIndex;
    ReleaseQuater := QuarterCombo.ItemIndex;
    MinPrice := StrToInt(MinPriceEdit.Text);
    MaxPrice := StrToInt(MaxPriceEdit.Text);
    {$WARNINGS ON}
  end;
end;

procedure TItemEditorBaseFrame.ImgCleanButtonClick(Sender: TObject);
begin
  if ShowConfirmation('Очистить изображение?') = mrYes then
  begin
    PreviewImage.Picture := nil;
    FImgFileName := '';
  end;
end;

procedure TItemEditorBaseFrame.ImgOpenButtonClick(Sender: TObject);
var
  Pic: TPngImage;
begin
  if OpenDialog.Execute then
  begin
    Pic := TPngImage.Create;
    try
      if GetFileSize(OpenDialog.FileName) > 1024 * 100 then
      begin
        ShowError('Недопустимый формат изображения', 'Максимальный размер' + #32 +
          'изображения не должен превышать 100 кбайт!');
        Exit;
      end;

      try
        Pic.LoadFromFile(OpenDialog.FileName);
      except
        ShowError('Недопустимый формат изображения', Format('Файл "%s" не' + #32 +
          'является PNG-контейнером!', [OpenDialog.FileName]));
        Exit;
      end;

      if (Pic.Width > 150) or (Pic.Height > 150) then
      begin
        ShowError('Недопустимый формат изображения', 'Размер изображения' + #32 +
          'не должен превышать 150х150 пикселей.');
        Exit;
      end;

      PreviewImage.Picture.Assign(Pic);
    finally
      Pic.Free;
    end;
  end;
end;

procedure TItemEditorBaseFrame.Initialize;

  procedure _FillupYearCombo;
  var
    i: Integer;
  begin
    for i := 2000 to CurrentYear - 1 do
      YearCombo.Items.Add(IntToStr(i));

    YearCombo.Items.Add(IntToStr(CurrentYear)); // Prevent errors
    YearCombo.ItemIndex := YearCombo.Items.Count - 1;
  end;

begin
  New(FDefaultData);
  GetData(FDefaultData);

  PageControl.TabIndex := 0;
  _FillupYearCombo;
end;

procedure TItemEditorBaseFrame.Reset;
begin
  SetData(FDefaultData);
  PageControl.TabIndex := 0;
  PreviewImage.Picture := nil;
end;

procedure TItemEditorBaseFrame.SetBackforceHandle(const AHandle: Cardinal);
begin
  FBackforceHandle := AHandle;
end;

procedure TItemEditorBaseFrame.SetData(const Data: PRecCommonData);
begin
  with Data^ do
  begin
    {$WARNINGS OFF}
    VendorCombo.Text := Vendor;
    ModelEdit.Text := Model;
    ProductIDEdit.Text := ProductID;
    DescriptionMemo.Text := Notes;
    YearCombo.ItemIndex := ReleaseYear;
    QuarterCombo.ItemIndex := ReleaseQuater;
    MinPriceEdit.Text := IntToStr(MinPrice);
    MaxPriceEdit.Text := IntToStr(MaxPrice);
    {$WARNINGS ON}

    { Set default title }
    UpdateTitle;
  end;
end;

procedure TItemEditorBaseFrame.SetMode(const Value: TItemEditorMode);
begin
  FMode := Value;

  case FMode of
    emHidden: ;

    emAdditing:
      begin
        { Enabled all fields & and show OK button }
        ButtonOK.Show;
        ButtonOK.Caption := 'Добавить';
        ButtonCancel.Caption := 'Отмена';
        ButtonEdit.Hide;

        EnableEditing(True);
      end;

    emEditing:
      begin
        { Enabled all fields & and show OK button }
        ButtonOK.Show;
        ButtonOK.Caption := 'Изменить';
        ButtonCancel.Caption := 'Отмена';
        ButtonEdit.Hide;

        EnableEditing(True);
      end;

    emPreviewing:
      begin
        { Disable all fields & hide OK button }
        ButtonOK.Hide;
        ButtonEdit.Show;
        ButtonCancel.Caption := 'Закрыть';

        EnableEditing(False);
      end;
  end;

  UpdateTitle;
end;

procedure TItemEditorBaseFrame.TrimFields;
begin
  VendorCombo.Text := Trim(VendorCombo.Text);
  ModelEdit.Text := Trim(ModelEdit.Text);
  ProductIDEdit.Text := Trim(ProductIDEdit.Text);
end;

procedure TItemEditorBaseFrame.UpdateTitle;
begin
  if (VendorCombo.Text <> '') and ((ModelEdit.Text <> '') or (ProductIDEdit.Text <> '')) then
  begin
    if FMode in [emEditing, emPreviewing] then
    begin
      if ModelEdit.Text <> '' then
        SetCaption(VendorCombo.Text + #32 + ModelEdit.Text)
      else
        SetCaption(VendorCombo.Text + #32 + ProductIDEdit.Text);
    end
    else
      SetCaption('[Добавить]');
  end
  else
    SetCaption('[Добавить]');
end;

procedure TItemEditorBaseFrame.SetCaption(const ItemName: String);
begin
  if FCatalogName <> '' then
    TopPanel.Caption := '.:: ' + FCatalogName + #32#187#32 + ItemName + ' ::.'
  else
    TopPanel.Caption := '.:: ' + ItemName + ' ::.';
end;

procedure TItemEditorBaseFrame.ValidateFields(var Valid: Boolean);
begin
  Valid := (VendorCombo.Text <> '') and (ModelEdit.Text <> '') and
    ValueInRange(StrToInt(MinPriceEdit.Text), 0, High(Word)) and
    ValueInRange(StrToInt(MaxPriceEdit.Text), 0, High(Word));
end;

function TItemEditorBaseFrame.ValueInRange(const Value, Min, Max: Cardinal): Boolean;
begin
  Result := (Value <= Max) and (Value >= Min);
end;

end.
