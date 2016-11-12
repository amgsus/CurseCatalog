inherited ItemEditorFrame_MB: TItemEditorFrame_MB
  Constraints.MinHeight = 320
  Constraints.MinWidth = 515
  inherited PageControl: TPageControl
    ActivePage = CustomTabSheet_1
    object CustomTabSheet_1: TTabSheet
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      ImageIndex = 2
      object CaptionLabel_C1: TLabel
        Left = 16
        Top = 12
        Width = 134
        Height = 14
        Caption = #1057#1086#1074#1084#1077#1089#1090#1080#1084#1099#1081' '#1087#1088#1086#1094#1077#1089#1089#1086#1088':'
      end
      object CaptionLabel_C3: TLabel
        Left = 192
        Top = 12
        Width = 72
        Height = 14
        Caption = #1060#1086#1088#1084'-'#1092#1072#1082#1090#1086#1088':'
      end
      object CaptionLabel_C4: TLabel
        Left = 16
        Top = 160
        Width = 62
        Height = 14
        Caption = #1058#1080#1087' '#1087#1072#1084#1103#1090#1080':'
      end
      object CaptionLabel_C2: TLabel
        Left = 16
        Top = 60
        Width = 33
        Height = 14
        Caption = #1057#1086#1082#1077#1090':'
      end
      object CaptionLabel_C5: TLabel
        Left = 16
        Top = 109
        Width = 117
        Height = 14
        Caption = #1053#1072#1073#1086#1088' '#1083#1086#1075#1080#1082#1080' ('#1095#1080#1087#1089#1077#1090'):'
      end
      object SupportedCPUsCombo: TComboBox
        Left = 16
        Top = 28
        Width = 165
        Height = 22
        Style = csDropDownList
        ItemIndex = 1
        Sorted = True
        TabOrder = 0
        Text = 'Intel'
        Items.Strings = (
          'AMD'
          'Intel')
      end
      object FormCombo: TComboBox
        Left = 192
        Top = 28
        Width = 85
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        Sorted = True
        TabOrder = 1
        Text = 'ATX'
        Items.Strings = (
          'ATX'
          'MicroATX'
          'Mini-ATX'
          'Mini-ITX'
          'Nano-ITX')
      end
      object MemTypeCombo: TComboBox
        Left = 16
        Top = 176
        Width = 65
        Height = 22
        Style = csDropDownList
        ItemIndex = 2
        Sorted = True
        TabOrder = 4
        Text = 'DDR3'
        Items.Strings = (
          'DDR'
          'DDR2'
          'DDR3'
          'SO-DIMM DDR3')
      end
      object MemChannelsCombo: TComboBox
        Left = 87
        Top = 176
        Width = 94
        Height = 22
        Style = csDropDownList
        ItemIndex = 1
        Sorted = True
        TabOrder = 5
        Text = '2-'#1082#1072#1085#1072#1083#1100#1085#1099#1081
        Items.Strings = (
          '1-'#1082#1072#1085#1072#1083#1100#1085#1099#1081
          '2-'#1082#1072#1085#1072#1083#1100#1085#1099#1081
          '3-'#1082#1072#1085#1072#1083#1100#1085#1099#1081
          '4-'#1082#1072#1085#1072#1083#1100#1085#1099#1081
          '6-'#1082#1072#1085#1072#1083#1100#1085#1099#1081
          '8-'#1082#1072#1085#1072#1083#1100#1085#1099#1081)
      end
      object SocketCombo: TComboBox
        Left = 16
        Top = 76
        Width = 85
        Height = 22
        TabOrder = 2
        Items.Strings = (
          'LGA1150'
          'LGA2011'
          'AM3+'
          'AM3'
          'AM1'
          'FM2+'
          'FM2'
          'FM1'
          'LGA1155'
          'LGA1356'
          'LGA1366'
          'LGA775')
      end
      object ChipsetCombo: TComboBox
        Left = 16
        Top = 125
        Width = 165
        Height = 22
        TabOrder = 3
      end
    end
  end
end
