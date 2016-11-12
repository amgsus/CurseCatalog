unit ItemEditor.HDDs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, StdCtrls, ComCtrls, ExtCtrls, pngimage, Buttons, PngBitBtn;

type
  TItemEditorFrame_HDD = class(TItemEditorBaseFrame)
    CustomTabSheet: TTabSheet;
    MediaCombo: TComboBox;
    CaptionLabel_C1: TLabel;
    FlashTypeCombo: TComboBox;
    CaptionLabel_C3: TLabel;
    FormSizeCombo: TComboBox;
    CaptionLabel_C2: TLabel;
    InterfaceCombo: TComboBox;
    CaptionLabel_C4: TLabel;
    CaptionLabel_C5: TLabel;
    CapacityEdit: TEdit;
    BufferSizeEdit: TEdit;
    CaptionLabel_C6: TLabel;
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

{ TItemEditorFrame_HDD }

procedure TItemEditorFrame_HDD.Finalize;
begin
  inherited;
  Dispose(PDataStructHDD(FDefaultDataEx));
end;

procedure TItemEditorFrame_HDD.GetDataEx(const Data: Pointer);
begin
  with PDataStructHDD(Data)^ do
  begin
    MediaType := MediaCombo.ItemIndex;
    FormFactor := FormSizeCombo.ItemIndex;
    ConnInterface := InterfaceCombo.ItemIndex;
    Capacity := StrToInt(CapacityEdit.Text);
    BufferSize := StrToInt(BufferSizeEdit.Text);
    FlashType := FlashTypeCombo.ItemIndex;
  end;
end;

function TItemEditorFrame_HDD.GetDescription(const ExData: Pointer): String;
begin
end;

function TItemEditorFrame_HDD.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructHDD absolute ExData;
begin
  Result := MediaCombo.Items[R^.MediaType] + #44#32;
  Result := Result + FormSizeCombo.Items[R^.FormFactor] + #44#32;
  Result := Result + IntToStr(R^.Capacity) + #32 + 'รแ' + #44#32;
  Result := Result + InterfaceCombo.Items[R^.ConnInterface];
end;

procedure TItemEditorFrame_HDD.Initialize;
begin
  inherited;
  New(PDataStructHDD(FDefaultDataEx));
  GetDataEx(PDataStructHDD(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('A-Data');
    Add('Apacer');
    Add('Corsair');
    Add('Crucial');
    Add('GeIL');
    Add('GOODRAM');
    Add('Hitachi');
    Add('HP');
    Add('Intel');
    Add('Kingmax');
    Add('Kingston');
    Add('Lite-On');
    Add('OCZ');
    Add('Plextor');
    Add('QUMO');
    Add('Samsung');
    Add('SanDisk');
    Add('Seagate');
    Add('Silicon-Power');
    Add('Smart Buy');
    Add('Toshiba');
    Add('Transcend');
    Add('WD');
  end;
end;

procedure TItemEditorFrame_HDD.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructHDD(Data)^ do
  begin
    MediaCombo.ItemIndex := MediaType;
    FormSizeCombo.ItemIndex := FormFactor;
    InterfaceCombo.ItemIndex := ConnInterface;
    CapacityEdit.Text := IntToStr(Capacity);
    BufferSizeEdit.Text := IntToStr(BufferSize);
    FlashTypeCombo.ItemIndex := FlashType;
  end;
end;

procedure TItemEditorFrame_HDD.ValidateFields(var Valid: Boolean);
begin
  inherited;
  Valid := Valid and ValueInRange(StrToInt(CapacityEdit.Text), 0, High(Word)) and
    ValueInRange(StrToInt(BufferSizeEdit.Text), 0, High(Word));
end;

end.
