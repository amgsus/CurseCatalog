unit ItemEditor.CPUs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, StdCtrls, ComCtrls, ExtCtrls, pngimage, Buttons, PngBitBtn;

type
  TItemEditorFrame_CPU = class(TItemEditorBaseFrame)
    CustomTabSheet: TTabSheet;
    MulticoreCombo: TComboBox;
    CaptionLabel_C3: TLabel;
    CaptionLabel_C4: TLabel;
    GraphicsCombo: TComboBox;
    SocketCombo: TComboBox;
    CaptionLabel_C2: TLabel;
    FrequencyEdit: TEdit;
    CaptionLabel_C1: TLabel;
    ArchitectureEdit: TEdit;
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

{ TItemEditorFrame_CPU }

procedure TItemEditorFrame_CPU.Finalize;
begin
  inherited;
  Dispose(PDataStructCPU(FDefaultDataEx));
end;

procedure TItemEditorFrame_CPU.GetDataEx(const Data: Pointer);
begin
  with PDataStructCPU(Data) ^ do
  begin
    {$WARNINGS OFF}
    Architecture := ArchitectureEdit.Text;
    Socket := SocketCombo.Text;
    Frequency := StrToInt(FrequencyEdit.Text);
    Cores := MulticoreCombo.ItemIndex;
    Graphics := GraphicsCombo.ItemIndex;
    {$WARNINGS ON}
  end;
end;

function TItemEditorFrame_CPU.GetDescription(const ExData: Pointer): String;
var
  R: PDataStructCPU absolute ExData;
begin
  {$WARNINGS OFF}
  Result := Format('Архитерктура: %s', [R^.Architecture]) + CRLF;
  Result := Result + Format('Сокет: %s', [R^.Socket]) + CRLF;
  Result := Result + Format('Частота: %d МГц', [R^.Frequency]) + CRLF;
  Result := Result + Format('Многоядерность: %s', [MulticoreCombo.Items[R^.Cores]]) + CRLF;
  Result := Result + Format('GPU: %s', [GraphicsCombo.Items[R^.Graphics]]);
  {$WARNINGS ON}
end;

function TItemEditorFrame_CPU.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructCPU absolute ExData;
begin
  {$WARNINGS OFF}
  Result := 'Архит-ра' + #32 + R^.Architecture + #44#32;
  Result := Result + R^.Socket + #44#32;
  Result := Result + IntToStr(R^.Frequency) + #32 + 'МГц' + #44#32;
  Result := Result + MulticoreCombo.Items[R^.Cores] + '-ядерный' + #44#32;
  Result := Result + 'GPU ' + #32 + GraphicsCombo.Items[R^.Graphics];
  {$WARNINGS ON}
end;

procedure TItemEditorFrame_CPU.Initialize;
begin
  inherited;
  New(PDataStructCPU(FDefaultDataEx));
  GetDataEx(PDataStructCPU(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('AMD');
    Add('Intel');
  end;
end;

procedure TItemEditorFrame_CPU.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructCPU(Data) ^ do
  begin
    {$WARNINGS OFF}
    ArchitectureEdit.Text := Architecture;
    SocketCombo.Text := Socket;
    FrequencyEdit.Text := IntToStr(Frequency);
    MulticoreCombo.ItemIndex := Cores;
    GraphicsCombo.ItemIndex := Graphics;
    {$WARNINGS ON}
  end;
end;

procedure TItemEditorFrame_CPU.TrimFields;
begin
  inherited;
  ArchitectureEdit.Text := Trim(ArchitectureEdit.Text);
  SocketCombo.Text := Trim(SocketCombo.Text);
end;

procedure TItemEditorFrame_CPU.ValidateFields(var Valid: Boolean);
begin
  inherited;
  Valid := Valid and (SocketCombo.Text <> '') and (ArchitectureEdit.Text <> '') and
    ValueInRange(StrToInt(FrequencyEdit.Text), 0, High(Word));
end;

end.
