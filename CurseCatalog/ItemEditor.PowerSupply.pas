unit ItemEditor.PowerSupply;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, StdCtrls, ComCtrls, ExtCtrls, pngimage, Buttons, PngBitBtn;

type
  TItemEditorFrame_PWR = class(TItemEditorBaseFrame)
    CustomTabSheet: TTabSheet;
    StandardCombo: TComboBox;
    CaptionLabel_C1: TLabel;
    Label1: TLabel;
    Scheme12VCombo: TComboBox;
    Label2: TLabel;
    Cert80Combo: TComboBox;
    ActivePFCCheck: TCheckBox;
    PowerEdit: TEdit;
    CaptionLabel_C2: TLabel;
    EfficiencyEdit: TEdit;
    CaptionLabel_C3: TLabel;
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

{ TItemEditorFrame_PWR }

procedure TItemEditorFrame_PWR.Finalize;
begin
  inherited;
  Dispose(PDataStructPwrSupply(FDefaultDataEx));
end;

procedure TItemEditorFrame_PWR.GetDataEx(const Data: Pointer);
begin
  with PDataStructPwrSupply(Data)^ do
  begin
    Standard := StandardCombo.ItemIndex;
    Scheme12V := Scheme12VCombo.ItemIndex;
    Watts := StrToInt(PowerEdit.Text);
    Efficiency := StrToInt(EfficiencyEdit.Text);
    ActivePFC := ActivePFCCheck.Checked;
    Cert80 := Cert80Combo.ItemIndex;
  end;
end;

function TItemEditorFrame_PWR.GetDescription(const ExData: Pointer): String;
begin
end;

function TItemEditorFrame_PWR.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructPwrSupply absolute ExData;
begin
  Result := StandardCombo.Items[R^.Standard] + #44#32;
  Result := Result + IntToStr(R^.Watts) + #32 + 'Âò' + #44#32;
  Result := Result + 'ÊÏÄ' + #32 + IntToStr(R^.Efficiency) + #32 + '%' + #44#32;
  Result := Result + Scheme12VCombo.Items[R^.Scheme12V];
end;

procedure TItemEditorFrame_PWR.Initialize;
begin
  inherited;
  New(PDataStructPwrSupply(FDefaultDataEx));
  GetDataEx(PDataStructPwrSupply(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('AeroCool');
    Add('Antec');
    Add('Arctic Cooling');
    Add('Chieftec');
    Add('Cooler Master');
    Add('Corsair');
    Add('Enermax');
    Add('ExeGate');
    Add('Fractal Design');
    Add('FSP');
    Add('Gembird');
    Add('Gigabyte');
    Add('In Win');
    Add('OCZ');
    Add('Thermaltake');
    Add('XFX');
    Add('Xilence');
    Add('Zalman');
  end;
end;

procedure TItemEditorFrame_PWR.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructPwrSupply(Data)^ do
  begin
    StandardCombo.ItemIndex := Standard;
    Scheme12VCombo.ItemIndex := Scheme12V;
    PowerEdit.Text := IntToStr(Watts);
    EfficiencyEdit.Text := IntToStr(Efficiency);
    ActivePFCCheck.Checked := ActivePFC;
    Cert80Combo.ItemIndex := Cert80;
  end;
end;

procedure TItemEditorFrame_PWR.ValidateFields(var Valid: Boolean);
begin
  inherited;
  Valid := Valid and ValueInRange(StrToInt(PowerEdit.Text), 0, High(Word)) and
    ValueInRange(StrToInt(EfficiencyEdit.Text), 0, 100);
end;

end.
