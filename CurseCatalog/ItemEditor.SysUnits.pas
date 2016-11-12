unit ItemEditor.SysUnits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, StdCtrls, ComCtrls, ExtCtrls, pngimage, Buttons, PngBitBtn;

type
  TItemEditorFrame_UNT = class(TItemEditorBaseFrame)
    CustomTabSheet: TTabSheet;
    FormatCombo: TComboBox;
    CaptionLabel_C1: TLabel;
    CaptionLabel_C2: TLabel;
    FormFactorCombo: TComboBox;
    CaptionLabel_C3: TLabel;
    MaterialCombo: TComboBox;
    ColorCombo: TComboBox;
    CaptionLabel_C4: TLabel;
    DustFiltersCheck: TCheckBox;
    DisplayCheck: TCheckBox;
    USB30SupportCheck: TCheckBox;
    AppleDockCheck: TCheckBox;
  protected
    procedure Initialize; override;
    procedure Finalize; override;
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

{ TItemEditorFrame_UNT }

procedure TItemEditorFrame_UNT.Finalize;
begin
  inherited;
  Dispose(PDataStructSysUnit(FDefaultDataEx));
end;

procedure TItemEditorFrame_UNT.GetDataEx(const Data: Pointer);
begin
  with PDataStructSysUnit(Data)^ do
  begin
    Format := FormatCombo.ItemIndex;
    FormFactor := FormFactorCombo.ItemIndex;
    Material := MaterialCombo.ItemIndex;
    Color := ColorCombo.ItemIndex;
    DustFilters := DustFiltersCheck.Checked;
    Display := DisplayCheck.Checked;
    USB30Support := USB30SupportCheck.Checked;
    AppleDock := AppleDockCheck.Checked;
  end;
end;

function TItemEditorFrame_UNT.GetDescription(const ExData: Pointer): String;
begin
end;

function TItemEditorFrame_UNT.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructSysUnit absolute ExData;
begin
  Result := FormatCombo.Items[R^.Format] + #44#32;
  Result := Result + ColorCombo.Items[R^.Color] + #44#32;
  Result := Result + 'под' + #32 + FormFactorCombo.Items[R^.FormFactor];
end;

procedure TItemEditorFrame_UNT.Initialize;
begin
  inherited;
  New(PDataStructSysUnit(FDefaultDataEx));
  GetDataEx(PDataStructSysUnit(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('3Q');
    Add('AeroCool');
    Add('Antec');
    Add('Arctic Cooling');
    Add('ASUS');
    Add('Chieftec');
    Add('Cooler Master');
    Add('Corsair');
    Add('Delux');
    Add('Enermax');
    Add('Fractal Design');
    Add('FSP');
    Add('Gembird');
    Add('Gigabyte');
    Add('In Win');
    Add('Microlab');
    Add('Procase');
    Add('Thermaltake');
    Add('Zalman');
  end;
end;

procedure TItemEditorFrame_UNT.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructSysUnit(Data)^ do
  begin
    FormatCombo.ItemIndex := Format;
    FormFactorCombo.ItemIndex := FormFactor;
    MaterialCombo.ItemIndex := Material;
    ColorCombo.ItemIndex := Color;
    DustFiltersCheck.Checked := DustFilters;
    DisplayCheck.Checked := Display;
    USB30SupportCheck.Checked := USB30Support;
    AppleDockCheck.Checked := AppleDock;
  end;
end;

end.
