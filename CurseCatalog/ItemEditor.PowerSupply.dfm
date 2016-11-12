inherited ItemEditorFrame_PWR: TItemEditorFrame_PWR
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
      ExplicitWidth = 501
      ExplicitHeight = 215
    end
    object CustomTabSheet: TTabSheet
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      ImageIndex = 2
      object CaptionLabel_C1: TLabel
        Left = 16
        Top = 12
        Width = 52
        Height = 14
        Caption = #1057#1090#1072#1085#1076#1072#1088#1090':'
      end
      object Label1: TLabel
        Left = 16
        Top = 60
        Width = 151
        Height = 14
        Caption = #1055#1080#1090#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1085#1089#1082#1086#1081' '#1087#1083#1072#1090#1099':'
      end
      object Label2: TLabel
        Left = 16
        Top = 156
        Width = 109
        Height = 14
        Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090' 80 PLUS:'
      end
      object CaptionLabel_C2: TLabel
        Left = 16
        Top = 108
        Width = 74
        Height = 14
        Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1042#1090':'
      end
      object CaptionLabel_C3: TLabel
        Left = 111
        Top = 108
        Width = 41
        Height = 14
        Caption = #1050#1055#1044', %:'
      end
      object StandardCombo: TComboBox
        Left = 16
        Top = 28
        Width = 105
        Height = 22
        AutoComplete = False
        Style = csDropDownList
        ItemIndex = 3
        Sorted = True
        TabOrder = 0
        Text = 'ATX12V 2.3'
        Items.Strings = (
          'ATX12V 1.3'
          'ATX12V 2.0'
          'ATX12V 2.2'
          'ATX12V 2.3'
          'ATX12V 2.4'
          'EPS12V'
          'Mini-ITX')
      end
      object Scheme12VCombo: TComboBox
        Left = 16
        Top = 76
        Width = 165
        Height = 22
        AutoComplete = False
        Style = csDropDownList
        ItemIndex = 4
        TabOrder = 1
        Text = '24 + 8 pin'
        Items.Strings = (
          '20 pin'
          '20 + 4 pin'
          '24 pin'
          '24 + 4 pin'
          '24 + 8 pin'
          '24 + 8 + 8 pin')
      end
      object Cert80Combo: TComboBox
        Left = 16
        Top = 172
        Width = 118
        Height = 22
        AutoComplete = False
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = #1053#1077#1090
        Items.Strings = (
          #1053#1077#1090
          #1041#1072#1079#1086#1074#1099#1081
          #1041#1088#1086#1085#1079#1086#1074#1099#1081
          #1057#1077#1088#1077#1073#1088#1103#1085#1099#1081
          #1047#1086#1083#1086#1090#1086#1081
          #1055#1083#1072#1090#1080#1085#1086#1074#1099#1081)
      end
      object ActivePFCCheck: TCheckBox
        Left = 148
        Top = 168
        Width = 165
        Height = 30
        Caption = #1040#1082#1090#1080#1074#1085#1072#1103' '#1082#1086#1088#1088#1077#1082#1094#1080#1103' '#1092#1072#1082#1090#1086#1088#1072' '#1084#1086#1097#1085#1086#1089#1090#1080' (PFC)'
        TabOrder = 5
        WordWrap = True
      end
      object PowerEdit: TEdit
        Left = 16
        Top = 124
        Width = 89
        Height = 22
        NumbersOnly = True
        TabOrder = 2
        Text = '0'
      end
      object EfficiencyEdit: TEdit
        Left = 111
        Top = 124
        Width = 70
        Height = 22
        NumbersOnly = True
        TabOrder = 3
        Text = '0'
      end
    end
  end
end
