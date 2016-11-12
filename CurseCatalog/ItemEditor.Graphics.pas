unit ItemEditor.Graphics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, StdCtrls, ComCtrls, ExtCtrls, pngimage, Buttons, PngBitBtn;

type
  TItemEditorFrame_GPU = class(TItemEditorBaseFrame)
    CustomTabSheet: TTabSheet;
    GPUCombo: TComboBox;
    CaptionLabel_C1: TLabel;
    BusCombo: TComboBox;
    CaptionLabel_C4: TLabel;
    CaptionLabel_C2: TLabel;
    InterfaceCombo: TComboBox;
    CaptionLabel_C3: TLabel;
    CoolingCombo: TComboBox;
    CaptionLabel_C5: TLabel;
    MemTypeCombo: TComboBox;
    CaptionLabel_C6: TLabel;
    DXCombo: TComboBox;
    SLICheck: TCheckBox;
    HDMICheck: TCheckBox;
    WidthEdit: TEdit;
    CaptionLabel_C7: TLabel;
    CaptionLabel_C8: TLabel;
    GPUFreqEdit: TEdit;
    CaptionLabel_C9: TLabel;
    MemFreqEdit: TEdit;
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

{ TItemEditorFrame_GPU }

procedure TItemEditorFrame_GPU.Finalize;
begin
  inherited;
  Dispose(PDataStructGraphics(FDefaultDataEx));
end;

procedure TItemEditorFrame_GPU.GetDataEx(const Data: Pointer);
begin
  with PDataStructGraphics(Data)^ do
  begin
    {$WARNINGS OFF}
    GPU := GPUCombo.Text;
    ConnInterface := InterfaceCombo.ItemIndex;
    Cooling := CoolingCombo.ItemIndex;
    Width := StrToInt(WidthEdit.Text);
    GPUFreq := StrToInt(GPUFreqEdit.Text);
    MemFreq := StrToInt(MemFreqEdit.Text);
    Bus := BusCombo.ItemIndex;
    MemType := MemTypeCombo.ItemIndex;
    DirectX := DXCombo.ItemIndex;
    SLI := SLICheck.Checked;
    HDMI := HDMICheck.Checked;
    {$WARNINGS ON}
  end;
end;

function TItemEditorFrame_GPU.GetDescription(const ExData: Pointer): String;
begin
end;

function TItemEditorFrame_GPU.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructGraphics absolute ExData;
begin
  {$WARNINGS OFF}
  Result := 'GPU ' + R^.GPU + #32 + '(' + IntToStr(R^.GPUFreq) + #32 + 'ћ√ц)' + #44#32;
  Result := Result + MemTypeCombo.Items[R^.MemType] + #44#32;
  Result := Result + 'шина' + #32 + BusCombo.Items[R^.Bus] + #44#32;
  Result := Result + 'DirectX' + #32 + DXCombo.Items[R^.DirectX] + #44#32;
  Result := Result + InterfaceCombo.Items[R^.ConnInterface];
  {$WARNINGS ON}
end;

procedure TItemEditorFrame_GPU.Initialize;
begin
  inherited;
  New(PDataStructGraphics(FDefaultDataEx));
  GetDataEx(PDataStructGraphics(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('AMD');
    Add('ASUS');
    Add('Club 3D');
    Add('EVGA');
    Add('Gainward');
    Add('Gigabyte');
    Add('Inno3D');
    Add('MSI');
    Add('Palit');
    Add('Point of View');
    Add('PowerColor');
    Add('Sapphire');
    Add('XFX');
    Add('ZOTAC');
  end;
end;

procedure TItemEditorFrame_GPU.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructGraphics(Data)^ do
  begin
    {$WARNINGS OFF}
    GPUCombo.Text := GPU;
    InterfaceCombo.ItemIndex := ConnInterface;
    CoolingCombo.ItemIndex := Cooling;
    WidthEdit.Text := IntToStr(Width);
    GPUFreqEdit.Text := IntToStr(GPUFreq);
    MemFreqEdit.Text := IntToStr(MemFreq);
    BusCombo.ItemIndex := Bus;
    MemTypeCombo.ItemIndex := MemType;
    DXCombo.ItemIndex := DirectX;
    SLICheck.Checked := SLI;
    HDMICheck.Checked := HDMI;
    {$WARNINGS ON}
  end;
end;

procedure TItemEditorFrame_GPU.TrimFields;
begin
  inherited;
  GPUCombo.Text := Trim(GPUCombo.Text);
end;

procedure TItemEditorFrame_GPU.ValidateFields(var Valid: Boolean);
begin
  inherited;
  Valid := Valid and (GPUCombo.Text <> '') and
    ValueInRange(StrToInt(GPUFreqEdit.Text), 0, High(Word)) and
    ValueInRange(StrToInt(MemFreqEdit.Text), 0, High(Word)) and
    ValueInRange(StrToInt(WidthEdit.Text), 0, 350);
end;

end.
