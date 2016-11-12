inherited ItemEditorFrame_AUD: TItemEditorFrame_AUD
  inherited PageControl: TPageControl
    ActivePage = CustomTabSheet
    inherited ImageTabSheet: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object CustomTabSheet: TTabSheet
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      ImageIndex = 2
      object CaptionLabel_C1: TLabel
        Left = 16
        Top = 12
        Width = 21
        Height = 14
        Caption = #1058#1080#1087':'
      end
      object CaptionLabel_C2: TLabel
        Left = 127
        Top = 12
        Width = 62
        Height = 14
        Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089':'
      end
      object CaptionLabel_C3: TLabel
        Left = 226
        Top = 12
        Width = 42
        Height = 14
        Caption = #1050#1072#1085#1072#1083#1099':'
      end
      object CaptionLabel_C4: TLabel
        Left = 16
        Top = 60
        Width = 70
        Height = 14
        Caption = #1063#1072#1089#1090#1086#1090#1072' '#1062#1040#1055':'
      end
      object CaptionLabel_C5: TLabel
        Left = 127
        Top = 60
        Width = 68
        Height = 14
        Caption = #1056#1072#1079#1088#1103#1076#1085#1086#1089#1090#1100':'
      end
      object CaptionLabel_C6: TLabel
        Left = 16
        Top = 108
        Width = 70
        Height = 14
        Caption = #1063#1072#1089#1090#1086#1090#1072' '#1040#1062#1055':'
      end
      object CaptionLabel_C7: TLabel
        Left = 127
        Top = 108
        Width = 68
        Height = 14
        Caption = #1056#1072#1079#1088#1103#1076#1085#1086#1089#1090#1100':'
      end
      object FormatCombo: TComboBox
        Left = 16
        Top = 28
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 0
        Text = #1042#1089#1090#1088#1072#1080#1074#1072#1077#1084#1072#1103
        Items.Strings = (
          #1042#1085#1077#1096#1085#1103#1103
          #1042#1089#1090#1088#1072#1080#1074#1072#1077#1084#1072#1103)
      end
      object InterfaceCombo: TComboBox
        Left = 127
        Top = 28
        Width = 93
        Height = 22
        Style = csDropDownList
        ItemIndex = 3
        TabOrder = 1
        Text = 'PCI Express'
        Items.Strings = (
          'USB'
          'FireWire'
          'PCI'
          'PCI Express'
          'PCMCIA'
          'ExpressCard')
      end
      object ConfigCombo: TComboBox
        Left = 226
        Top = 28
        Width = 66
        Height = 22
        Style = csDropDownList
        ItemIndex = 3
        TabOrder = 2
        Text = '5.1'
        Items.Strings = (
          '1.0'
          '2.0'
          '3.0'
          '5.1'
          '7.1')
      end
      object MicInCheck: TCheckBox
        Left = 16
        Top = 159
        Width = 121
        Height = 17
        Caption = #1052#1080#1082#1088#1086#1092#1086#1085#1085#1099#1081' '#1074#1093#1086#1076
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object LineInCheck: TCheckBox
        Left = 16
        Top = 178
        Width = 105
        Height = 17
        Caption = #1051#1080#1085#1077#1081#1085#1099#1081' '#1074#1093#1086#1076
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object CoaxicalCheck: TCheckBox
        Left = 143
        Top = 159
        Width = 137
        Height = 17
        Caption = 'S/PDIF ('#1082#1086#1072#1082#1089#1080#1072#1083#1100#1085#1099#1081')'
        TabOrder = 10
      end
      object MIDICheck: TCheckBox
        Left = 286
        Top = 159
        Width = 69
        Height = 17
        Caption = 'MIDI '#1074#1093#1086#1076
        TabOrder = 12
      end
      object HDMICheck: TCheckBox
        Left = 143
        Top = 179
        Width = 117
        Height = 16
        Caption = 'HDMI '#1074#1093#1086#1076' \ '#1074#1099#1093#1086#1076
        TabOrder = 11
      end
      object InstrumentalCheck: TCheckBox
        Left = 286
        Top = 178
        Width = 153
        Height = 17
        Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1072#1083#1100#1085#1099#1081' '#1074#1093#1086#1076
        TabOrder = 13
      end
      object PhonesCheck: TCheckBox
        Left = 308
        Top = 31
        Width = 121
        Height = 17
        Caption = #1042#1099#1093#1086#1076' '#1085#1072' '#1085#1072#1091#1096#1085#1080#1082#1080
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object DACFreqCombo: TComboBox
        Left = 16
        Top = 76
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 6
        TabOrder = 4
        Text = '96 '#1082#1043#1094
        Items.Strings = (
          '8 '#1082#1043#1094
          '16 '#1082#1043#1094
          '22 '#1082#1043#1094
          '32 '#1082#1043#1094
          '44 '#1082#1043#1094
          '48 '#1082#1043#1094
          '96 '#1082#1043#1094
          '192 '#1082#1043#1094)
      end
      object DACWordCombo: TComboBox
        Left = 127
        Top = 76
        Width = 93
        Height = 22
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 5
        Text = '24 '#1073#1080#1090
        Items.Strings = (
          '8 '#1073#1080#1090
          '16 '#1073#1080#1090
          '24 '#1073#1080#1090)
      end
      object ADCFreqCombo: TComboBox
        Left = 16
        Top = 124
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 6
        TabOrder = 6
        Text = '96 '#1082#1043#1094
        Items.Strings = (
          '8 '#1082#1043#1094
          '16 '#1082#1043#1094
          '22 '#1082#1043#1094
          '32 '#1082#1043#1094
          '44 '#1082#1043#1094
          '48 '#1082#1043#1094
          '96 '#1082#1043#1094
          '192 '#1082#1043#1094)
      end
      object ADCWordCombo: TComboBox
        Left = 127
        Top = 124
        Width = 93
        Height = 22
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 7
        Text = '24 '#1073#1080#1090
        Items.Strings = (
          '8 '#1073#1080#1090
          '16 '#1073#1080#1090
          '24 '#1073#1080#1090)
      end
    end
  end
end
