unit ItemEditor.RAM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, StdCtrls, ComCtrls, ExtCtrls, pngimage, Buttons, PngBitBtn;

type
  TItemEditorFrame_RAM = class(TItemEditorBaseFrame)
    CustomTabSheet: TTabSheet;
    BankTypeCombo: TComboBox;
    CaptionLabel_C1: TLabel;
    ECCSupportCheck: TCheckBox;
    XMPSupportCheck: TCheckBox;
    CaptionLabel_C2: TLabel;
    LatencyCombo: TComboBox;
    CaptionLabel_C3: TLabel;
    VoltageCombo: TComboBox;
    CaptionLabel_C4: TLabel;
    FrequencyCombo: TComboBox;
    CapacityEdit: TEdit;
    CaptionLabel_C5: TLabel;
  protected
    procedure Initialize; override;
    procedure Finalize; override;
    procedure ValidateFields(var Valid: Boolean); override;
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

{ TItemEditorFrame_RAM }

procedure TItemEditorFrame_RAM.Finalize;
begin
  inherited;
  Dispose(PDataStructMemory(FDefaultDataEx));
end;

procedure TItemEditorFrame_RAM.GetDataEx(const Data: Pointer);
begin
  with PDataStructMemory(Data)^ do
  begin
    BankType := BankTypeCombo.ItemIndex;
    Frequency := FrequencyCombo.ItemIndex;
    Capacity := StrToInt(CapacityEdit.Text);
    SupportsXMP := XMPSupportCheck.Checked;
    SupportsECC := XMPSupportCheck.Checked;
    Latency := LatencyCombo.ItemIndex;
    Voltage := VoltageCombo.ItemIndex;
  end;
end;

function TItemEditorFrame_RAM.GetDescription(const ExData: Pointer): String;
begin
end;

function TItemEditorFrame_RAM.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructMemory absolute ExData;
begin
  Result := BankTypeCombo.Items[R^.BankType] + #44#32;
  Result := Result + IntToStr(R^.Capacity) + #32 + 'Ìב' + #44#32;
  Result := Result + FrequencyCombo.Items[R^.Frequency] + #44#32;
  Result := Result + VoltageCombo.Items[R^.Voltage];
end;

procedure TItemEditorFrame_RAM.Initialize;
begin
  inherited;
  New(PDataStructMemory(FDefaultDataEx));
  GetDataEx(PDataStructMemory(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('A-Data');
    Add('AMD');
    Add('Apacer');
    Add('Corsair');
    Add('Crucial');
    Add('Dell');
    Add('Elixir');
    Add('GeIL');
    Add('GOODRAM');
    Add('HP');
    Add('Hynix');
    Add('Kingmax');
    Add('Kingston');
    Add('Micron');
    Add('NCP');
    Add('OCZ');
    Add('QUMO');
    Add('Samsung');
    Add('Silicone-Power');
    Add('Transcend');
  end;
end;

procedure TItemEditorFrame_RAM.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructMemory(Data)^ do
  begin
    BankTypeCombo.ItemIndex := BankType;
    FrequencyCombo.ItemIndex := Frequency;
    CapacityEdit.Text := IntToStr(Capacity);
    XMPSupportCheck.Checked := SupportsXMP;
    ECCSupportCheck.Checked := SupportsECC;
    LatencyCombo.ItemIndex := Latency;
    VoltageCombo.ItemIndex := Voltage;
  end;
end;

procedure TItemEditorFrame_RAM.ValidateFields(var Valid: Boolean);
begin
  inherited;
  Valid := Valid and ValueInRange(StrToInt(CapacityEdit.Text), 0, High(Word));
end;

end.
