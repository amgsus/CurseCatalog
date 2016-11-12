unit ItemEditor.Coolant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, StdCtrls, ComCtrls, ExtCtrls, pngimage, Buttons, PngBitBtn;

type
  TItemEditorFrame_COL = class(TItemEditorBaseFrame)
    CustomTabSheet: TTabSheet;
    PurposeCombo: TComboBox;
    CaptionLabel_C1: TLabel;
    CaptionLabel_C2: TLabel;
    CoolantCombo: TComboBox;
    CaptionLabel_C3: TLabel;
    MaterialCombo: TComboBox;
    CaptionLabel_C4: TLabel;
    DiameterCombo: TComboBox;
    DissepationEdit: TEdit;
    CaptionLabel_C5: TLabel;
    SuppDevicesEdit: TEdit;
    CaptionLabel_C6: TLabel;
    NoiseLevelEdit: TEdit;
    CaptionLabel_C7: TLabel;
  protected
    procedure Initialize; override;
    procedure Finalize; override;
    procedure ValidateFields(var Valid: Boolean); override;
    procedure TrimFields; override;
  public
    procedure GetDataEx(const Data: Pointer); override;
    procedure SetDataEx(const Data: Pointer); override;
    function GetShortDescription(const ExData: Pointer): String; override;
    function GetDescription(const ExData: Pointer): String; override;
  end;

implementation

{$R *.dfm}

uses
  CCDBv2;

{ TItemEditorFrame_COL }

procedure TItemEditorFrame_COL.Finalize;
begin
  inherited;
  Dispose(PDataStructAudio(FDefaultDataEx));
end;

procedure TItemEditorFrame_COL.GetDataEx(const Data: Pointer);
begin
  with PDataStructCoolant(Data)^ do
  begin
    {$WARNINGS OFF}
    Purpose := PurposeCombo.ItemIndex;
    CoolantType := CoolantCombo.ItemIndex;
    Material := MaterialCombo.ItemIndex;
    Dissepation := StrToInt(DissepationEdit.Text);
    Diameter := DiameterCombo.ItemIndex;
    NoiseLevel := StrToInt(NoiseLevelEdit.Text);
    SupDevices := SuppDevicesEdit.Text;
    {$WARNINGS ON}
  end;
end;

function TItemEditorFrame_COL.GetDescription(const ExData: Pointer): String;
var
  R: PDataStructCoolant absolute ExData;
begin
  {$WARNINGS OFF}
  Result := Format('Назначение: %s', [AnsiLowerCase(PurposeCombo.Items[R^.Purpose])]) + CRLF;
  Result := Result + Format('Тип: %s', [AnsiLowerCase(CoolantCombo.Items[R^.CoolantType])]) + CRLF;
  Result := Result + Format('Материал: %s', [AnsiLowerCase(MaterialCombo.Items[R^.Material])]) + CRLF;
  Result := Result + Format('Эффективность: %d Вт', [R^.Dissepation]) + CRLF;
  Result := Result + Format('Шумность: %d дБ', [R^.NoiseLevel]) + CRLF;
  Result := Result + Format('Диаметр лопастей: %d мм', [R^.Diameter]) + CRLF;
  Result := Result + Format('Поддерживаемые устройства: %s', [R^.SupDevices]);
  {$WARNINGS ON}
end;

function TItemEditorFrame_COL.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructCoolant absolute ExData;
begin
  {$WARNINGS OFF}
  Result := PurposeCombo.Items[R^.Purpose] + #44#32;
  Result := Result + AnsiLowerCase(CoolantCombo.Items[R^.CoolantType]) + #44#32;
  Result := Result + DiameterCombo.Items[R^.Diameter] + #44#32;
  Result := Result + IntToStr(R^.NoiseLevel) + #32 + 'дБ' + #44#32;
  Result := Result + 'поддерж.:' + #32 + R^.SupDevices;
  {$WARNINGS ON}
end;

procedure TItemEditorFrame_COL.Initialize;
begin
  inherited;
  New(PDataStructCoolant(FDefaultDataEx));
  GetDataEx(PDataStructCoolant(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('Arctic Cooling');
    Add('ASUS');
    Add('Coolcox');
    Add('Cooler Master');
    Add('Corsair');
    Add('DeepCool');
    Add('Enermax');
    Add('EVERCOOL');
    Add('ExeGate');
    Add('Gembird');
    Add('Ice Hammer');
    Add('Intel');
    Add('Noctua');
    Add('Quoltec');
    Add('Thermalright');
    Add('Thermaltake');
    Add('Titan');
    Add('Xilence');
    Add('Zalman');
  end;
end;

procedure TItemEditorFrame_COL.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructCoolant(Data)^ do
  begin
    {$WARNINGS OFF}
    PurposeCombo.ItemIndex := Purpose;
    CoolantCombo.ItemIndex := CoolantType;
    MaterialCombo.ItemIndex := Material;
    DissepationEdit.Text := IntToStr(Dissepation);
    DiameterCombo.ItemIndex := Diameter;
    NoiseLevelEdit.Text := IntToStr(NoiseLevel);
    SuppDevicesEdit.Text := SupDevices;
    {$WARNINGS ON}
  end;
end;

procedure TItemEditorFrame_COL.TrimFields;
begin
  inherited;
  SuppDevicesEdit.Text := Trim(SuppDevicesEdit.Text);
end;

procedure TItemEditorFrame_COL.ValidateFields(var Valid: Boolean);
begin
  inherited;
  Valid := Valid and (SuppDevicesEdit.Text <> '') and
    ValueInRange(StrToInt(DissepationEdit.Text), 0, 800) and
    ValueInRange(StrToInt(NoiseLevelEdit.Text), 0, 50);
end;

end.
