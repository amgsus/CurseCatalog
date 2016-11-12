inherited ItemEditorFrame_CPU: TItemEditorFrame_CPU
  inherited PageControl: TPageControl
    ActivePage = CustomTabSheet
    inherited CommonTabSheet: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 501
      ExplicitHeight = 215
    end
    inherited ImageTabSheet: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
    end
    object CustomTabSheet: TTabSheet
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      ImageIndex = 2
      object CaptionLabel_C3: TLabel
        Left = 107
        Top = 108
        Width = 66
        Height = 14
        Caption = #1050#1086#1083'-'#1074#1086' '#1103#1076#1077#1088':'
      end
      object CaptionLabel_C4: TLabel
        Left = 16
        Top = 156
        Width = 108
        Height = 14
        Caption = #1042#1089#1090#1088#1086#1077#1085#1085#1072#1103' '#1075#1088#1072#1092#1080#1082#1072':'
      end
      object CaptionLabel_C2: TLabel
        Left = 16
        Top = 60
        Width = 33
        Height = 14
        Caption = #1057#1086#1082#1077#1090':'
      end
      object CaptionLabel_C1: TLabel
        Left = 16
        Top = 108
        Width = 71
        Height = 14
        Caption = #1063#1072#1089#1090#1086#1090#1072', '#1052#1043#1094':'
      end
      object CaptionLabel_C5: TLabel
        Left = 16
        Top = 12
        Width = 154
        Height = 14
        Caption = #1050#1086#1076#1086#1074#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1082#1088#1080#1089#1090#1072#1083#1083#1072':'
      end
      object MulticoreCombo: TComboBox
        Left = 107
        Top = 124
        Width = 74
        Height = 22
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 1
        Text = '2'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '6'
          '8'
          '12')
      end
      object GraphicsCombo: TComboBox
        Left = 16
        Top = 172
        Width = 165
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        MaxLength = 31
        TabOrder = 2
        Text = #1053#1077#1090
        Items.Strings = (
          #1053#1077#1090
          'HD Graphics 2000'
          'HD Graphics 3000'
          'HD Graphics 4000'
          'HD Graphics 4400'
          'HD Graphics 4600'
          'HD Graphics 5000'
          'Iris Pro 5100'
          'Iris Pro 5200'
          'Radeon HD 3000')
      end
      object SocketCombo: TComboBox
        Left = 16
        Top = 76
        Width = 85
        Height = 22
        TabOrder = 0
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
      object FrequencyEdit: TEdit
        Left = 16
        Top = 124
        Width = 85
        Height = 22
        NumbersOnly = True
        TabOrder = 3
        Text = '0'
      end
      object ArchitectureEdit: TEdit
        Left = 16
        Top = 28
        Width = 165
        Height = 22
        MaxLength = 31
        TabOrder = 4
      end
    end
  end
end
