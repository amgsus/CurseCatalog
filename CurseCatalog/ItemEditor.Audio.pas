unit ItemEditor.Audio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemEditor.Base, StdCtrls, ComCtrls, ExtCtrls, pngimage, Buttons, PngBitBtn;

type
  TItemEditorFrame_AUD = class(TItemEditorBaseFrame)
    CustomTabSheet: TTabSheet;
    CaptionLabel_C1: TLabel;
    FormatCombo: TComboBox;
    CaptionLabel_C2: TLabel;
    InterfaceCombo: TComboBox;
    CaptionLabel_C3: TLabel;
    ConfigCombo: TComboBox;
    MicInCheck: TCheckBox;
    LineInCheck: TCheckBox;
    CoaxicalCheck: TCheckBox;
    MIDICheck: TCheckBox;
    HDMICheck: TCheckBox;
    InstrumentalCheck: TCheckBox;
    PhonesCheck: TCheckBox;
    DACFreqCombo: TComboBox;
    CaptionLabel_C4: TLabel;
    CaptionLabel_C5: TLabel;
    DACWordCombo: TComboBox;
    ADCFreqCombo: TComboBox;
    CaptionLabel_C6: TLabel;
    CaptionLabel_C7: TLabel;
    ADCWordCombo: TComboBox;
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

{ TItemEditorFrame_AUD }

procedure TItemEditorFrame_AUD.Finalize;
begin
  inherited;
  Dispose(PDataStructAudio(FDefaultDataEx));
end;

procedure TItemEditorFrame_AUD.GetDataEx(const Data: Pointer);
begin
  with PDataStructAudio(Data)^ do
  begin
    Format := FormatCombo.ItemIndex;
    ConnInterface := InterfaceCombo.ItemIndex;
    Channels := ConfigCombo.ItemIndex;
    DAC_Freq := DACFreqCombo.ItemIndex;
    DAC_Word := DACWordCombo.ItemIndex;
    ADC_Freq := ADCFreqCombo.ItemIndex;
    ADC_Word := ADCWordCombo.ItemIndex;
    PhonesOut := PhonesCheck.Checked;
    MicIn := MicInCheck.Checked;
    LineIn := LineInCheck.Checked;
    Coaxical := CoaxicalCheck.Checked;
    HDMI := HDMICheck.Checked;
    MIDI := MIDICheck.Checked;
    Instrumental := InstrumentalCheck.Checked;
  end;
end;

function TItemEditorFrame_AUD.GetDescription(const ExData: Pointer): String;
var
  R: PDataStructAudio absolute ExData;
begin
  Result := Format('Тип: %s', [AnsiLowerCase(FormatCombo.Items[R^.Format])]) + CRLF;
  Result := Result + Format('Интерфейс: %s', [InterfaceCombo.Items[R^.ConnInterface]]) + CRLF;
  Result := Result + Format('Конфигурация: %s', [ConfigCombo.Items[R^.Channels]]) + CRLF;
  Result := Result + Format('Частота ЦАП: %s', [DACFreqCombo.Items[R^.DAC_Freq]]) + CRLF;
  Result := Result + Format('Разрядность ЦАП: %s', [DACWordCombo.Items[R^.DAC_Word]]) + CRLF;
  Result := Result + Format('Частота АЦП: %s', [ADCFreqCombo.Items[R^.ADC_Freq]]) + CRLF;
  Result := Result + Format('Разрядность АЦП: %s', [ADCWordCombo.Items[R^.ADC_Word]]);
  { ... }
end;

function TItemEditorFrame_AUD.GetShortDescription(const ExData: Pointer): String;
var
  R: PDataStructAudio absolute ExData;
begin
  Result := FormatCombo.Items[R^.Format] + #44#32;
  Result := Result + ConfigCombo.Items[R^.Channels] + #44#32;
  Result := Result + DACFreqCombo.Items[R^.DAC_Freq] + #44#32;
  Result := Result + DACWordCombo.Items[R^.DAC_Word] + #44#32;
  Result := Result + InterfaceCombo.Items[R^.ConnInterface];
end;

procedure TItemEditorFrame_AUD.Initialize;
begin
  inherited;
  New(PDataStructAudio(FDefaultDataEx));
  GetDataEx(PDataStructAudio(FDefaultDataEx));

  with VendorCombo.Items do
  begin
    Add('ASUS');
    Add('Audiotrak');
    Add('Creative');
    Add('E-MU');
    Add('Genius');
    Add('Terratec');
    Add('VIA');
  end;
end;

procedure TItemEditorFrame_AUD.SetDataEx(const Data: Pointer);
begin
  if not Assigned(Data) then Exit;

  with PDataStructAudio(Data)^ do
  begin
    FormatCombo.ItemIndex := Format;
    InterfaceCombo.ItemIndex := ConnInterface;
    ConfigCombo.ItemIndex := Channels;
    DACFreqCombo.ItemIndex := DAC_Freq;
    DACWordCombo.ItemIndex := DAC_Word;
    ADCFreqCombo.ItemIndex := ADC_Freq;
    ADCWordCombo.ItemIndex := ADC_Word;
    PhonesCheck.Checked := PhonesOut;
    MicInCheck.Checked := MicIn;
    LineInCheck.Checked := LineIn;
    CoaxicalCheck.Checked := Coaxical;
    HDMICheck.Checked := HDMI;
    MIDICheck.Checked := MIDI;
    InstrumentalCheck.Checked := Instrumental;
  end;
end;

end.
