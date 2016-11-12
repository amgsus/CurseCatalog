unit ItemEditor.Motherboards;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, pngimage, ExtCtrls, StdCtrls, Buttons, PngBitBtn, ComCtrls;

type
  TItemEditorFrame_MB = class(TItemEditorBaseFrame)
    CustomTabSheet_1: TTabSheet;
    CaptionLabel_C1: TLabel;
    SupportedCPUsCombo: TComboBox;
    CaptionLabel_C3: TLabel;
    FormCombo: TComboBox;
    CaptionLabel_C4: TLabel;
    MemTypeCombo: TComboBox;
    MemChannelsCombo: TComboBox;
    CaptionLabel_C2: TLabel;
    SocketCombo: TComboBox;
    ChipsetCombo: TComboBox;
    CaptionLabel_C5: TLabel;
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

{ TItemEditorFrame_MB }

procedure TItemEditorFrame_MB.Finalize;
begin
  inherited;
  Dispose(PDataStructMotherboards(FDefaultDataEx));
end;

procedure TItemEditorFrame_MB.GetDataEx(const Data: Pointer);
begin
  with PDataStructMotherboards(Data)^ do
  begin
    {$WARNINGS OFF}
    CPU := SupportedCPUsCombo.ItemIndex;
    Socket := SocketCombo.Text;
    Chipset := ChipsetCombo.Text;
    FormFactor := FormCombo.ItemIndex;
    MemType := MemTypeCombo.ItemIndex;
    MemChannels := MemChannelsCombo.ItemIndex;
    {$WARNINGS ON}
  end;
end;

function TItemEditorFrame_MB.GetDescription(const ExData: Pointer): String;
begin
end;

function TItemEditorFrame_MB.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructMotherboards absolute ExData;
begin
  {$WARNINGS OFF}
  Result := 'Процессоры' + #32 + SupportedCPUsCombo.Items[R^.CPU] + #32 + '(' + R^.Socket + ')' + #44#32;
  Result := Result + 'форм-фактор' + #32 + FormCombo.Items[R^.FormFactor] + #44#32;
  Result := Result + 'чипсет' + #32 + R^.Chipset + #44#32;
  Result := Result + 'память' + #32 + MemTypeCombo.Items[R^.MemType] + #32 +
    '(' + MemChannelsCombo.Items[R^.MemChannels] + ')';
  {$WARNINGS ON}
end;

procedure TItemEditorFrame_MB.Initialize;
begin
  inherited;
  New(PDataStructMotherboards(FDefaultDataEx));
  GetDataEx(PDataStructMotherboards(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('ASUS');
    Add('Gigabyte');
    Add('ASRock');
    Add('MSI');
    Add('BIOSTAR');
    Add('Sapphire');
    Add('ZOTAC');
    Add('Foxconn');
    Add('Intel');
    Add('Pegatron');
    Add('Point of View');
  end;
end;

procedure TItemEditorFrame_MB.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructMotherboards(Data)^ do
  begin
    {$WARNINGS OFF}
    SupportedCPUsCombo.ItemIndex := CPU;
    SocketCombo.Text := Socket;
    ChipsetCombo.Text := Chipset;
    FormCombo.ItemIndex := FormFactor;
    MemTypeCombo.ItemIndex := MemType;
    MemChannelsCombo.ItemIndex := MemChannels;
    {$WARNINGS ON}
  end;
end;

procedure TItemEditorFrame_MB.TrimFields;
begin
  inherited;
  SocketCombo.Text := Trim(SocketCombo.Text);
  ChipsetCombo.Text := Trim(ChipsetCombo.Text);
end;

procedure TItemEditorFrame_MB.ValidateFields(var Valid: Boolean);
begin
  inherited;
  Valid := Valid and (ChipsetCombo.Text <> '') and (SocketCombo.Text <> '');
end;

end.
