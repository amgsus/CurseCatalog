unit ItemEditor.ODDs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, StdCtrls, ComCtrls, ExtCtrls, pngimage, Buttons, PngBitBtn;

type
  TItemEditorFrame_ODD = class(TItemEditorBaseFrame)
    CustomTabSheet: TTabSheet;
    CaptionLabel_C1: TLabel;
    FormatCombo: TComboBox;
    CaptionLabel_C2: TLabel;
    InterfaceCombo: TComboBox;
    CaptionLabel_C3: TLabel;
    SuppMediaCombo: TComboBox;
    DiskFlashingCombo: TComboBox;
    CaptionLabel_C4: TLabel;
    ReadSpeedCombo: TComboBox;
    CaptionLabel_C5: TLabel;
    WriteSpeedCombo: TComboBox;
    CaptionLabel_C6: TLabel;
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

{ TItemEditorFrame_ODD }

procedure TItemEditorFrame_ODD.Finalize;
begin
  inherited;
  Dispose(PDataStructODD(FDefaultDataEx));
end;

procedure TItemEditorFrame_ODD.GetDataEx(const Data: Pointer);
begin
  with PDataStructODD(Data)^ do
  begin
    Format := FormatCombo.ItemIndex;
    ConnInterface := InterfaceCombo.ItemIndex;
    SupprtMedia := SuppMediaCombo.ItemIndex;
    DiskFlashing := DiskFlashingCombo.ItemIndex;
    ReadSpeed := ReadSpeedCombo.ItemIndex;
    WriteSpeed := WriteSpeedCombo.ItemIndex;
  end;
end;

function TItemEditorFrame_ODD.GetDescription(const ExData: Pointer): String;
begin
end;

function TItemEditorFrame_ODD.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructODD absolute ExData;
begin
  Result := FormatCombo.Items[R^.Format] + #44#32;
  Result := Result + SuppMediaCombo.Items[R^.SupprtMedia] + #44#32;
  Result := Result + 'чтение' + #32 + ReadSpeedCombo.Items[R^.ReadSpeed] + #44#32;
  Result := Result + 'запись' + #32 + WriteSpeedCombo.Items[R^.WriteSpeed] + #44#32;
  Result := Result + InterfaceCombo.Items[R^.ConnInterface];
end;

procedure TItemEditorFrame_ODD.Initialize;
begin
  inherited;
  New(PDataStructODD(FDefaultDataEx));
  GetDataEx(PDataStructODD(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('3Q');
    Add('Apple');
    Add('ASUS');
    Add('LG');
    Add('Lite-On');
    Add('Pioneer');
    Add('Plextor');
    Add('Samsung');
    Add('Sony Optiarc');
    Add('Transcend');
  end;
end;

procedure TItemEditorFrame_ODD.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructODD(Data)^ do
  begin
    FormatCombo.ItemIndex := Format;
    InterfaceCombo.ItemIndex := ConnInterface;
    SuppMediaCombo.ItemIndex := SupprtMedia;
    DiskFlashingCombo.ItemIndex := DiskFlashing;
    ReadSpeedCombo.ItemIndex := ReadSpeed;
    WriteSpeedCombo.ItemIndex := WriteSpeed;
  end;
end;

end.
