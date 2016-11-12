inherited ItemEditorFrame_ODD: TItemEditorFrame_ODD
  inherited PageControl: TPageControl
    ActivePage = CustomTabSheet
    inherited CommonTabSheet: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 501
      ExplicitHeight = 215
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
        Left = 16
        Top = 60
        Width = 146
        Height = 14
        Caption = #1055#1086#1076#1076#1077#1088#1078#1080#1074#1072#1077#1084#1099#1077' '#1085#1086#1089#1080#1090#1077#1083#1080':'
      end
      object CaptionLabel_C4: TLabel
        Left = 16
        Top = 108
        Width = 163
        Height = 14
        Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1103' '#1084#1072#1088#1082#1080#1088#1086#1074#1082#1080' '#1076#1080#1089#1082#1086#1074':'
      end
      object CaptionLabel_C5: TLabel
        Left = 220
        Top = 12
        Width = 90
        Height = 14
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1095#1090#1077#1085#1080#1103':'
      end
      object CaptionLabel_C6: TLabel
        Left = 220
        Top = 60
        Width = 89
        Height = 14
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1079#1072#1087#1080#1089#1080':'
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
        Width = 70
        Height = 22
        Style = csDropDownList
        ItemIndex = 3
        TabOrder = 1
        Text = 'SATA'
        Items.Strings = (
          'USB'
          'FireWire'
          'IDE'
          'SATA')
      end
      object SuppMediaCombo: TComboBox
        Left = 16
        Top = 76
        Width = 181
        Height = 22
        Style = csDropDownList
        ItemIndex = 3
        TabOrder = 2
        Text = 'Combo (CD-RW / DVD-ROM)'
        Items.Strings = (
          'BD-RE'
          'BD-ROM'
          'BD-ROW / DVD-RW'
          'Combo (CD-RW / DVD-ROM)'
          'DVD-ROM'
          'DVD-RW DL'
          'HD DVD-ROM')
      end
      object DiskFlashingCombo: TComboBox
        Left = 16
        Top = 124
        Width = 181
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 3
        Text = #1053#1077#1090
        Items.Strings = (
          #1053#1077#1090
          'LabelFlash'
          'LightScribe')
      end
      object ReadSpeedCombo: TComboBox
        Left = 220
        Top = 28
        Width = 101
        Height = 22
        Style = csDropDownList
        ItemIndex = 7
        TabOrder = 4
        Text = '24x'
        Items.Strings = (
          '2x'
          '4x'
          '6x'
          '8x'
          '12x'
          '16x'
          '20x'
          '24x'
          '32x'
          '40x'
          '48x'
          '52x')
      end
      object WriteSpeedCombo: TComboBox
        Left = 220
        Top = 76
        Width = 101
        Height = 22
        Style = csDropDownList
        ItemIndex = 5
        TabOrder = 5
        Text = '16x'
        Items.Strings = (
          '2x'
          '4x'
          '6x'
          '8x'
          '12x'
          '16x'
          '20x'
          '24x'
          '32x'
          '40x'
          '48x'
          '52x')
      end
    end
  end
end
