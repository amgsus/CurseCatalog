inherited ItemEditorFrame_COL: TItemEditorFrame_COL
  inherited PageControl: TPageControl
    ActivePage = CustomTabSheet
    object CustomTabSheet: TTabSheet
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CaptionLabel_C1: TLabel
        Left = 16
        Top = 12
        Width = 63
        Height = 14
        Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077':'
      end
      object CaptionLabel_C2: TLabel
        Left = 16
        Top = 60
        Width = 21
        Height = 14
        Caption = #1058#1080#1087':'
      end
      object CaptionLabel_C3: TLabel
        Left = 16
        Top = 108
        Width = 53
        Height = 14
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083':'
      end
      object CaptionLabel_C4: TLabel
        Left = 204
        Top = 108
        Width = 83
        Height = 14
        Caption = #1044#1080#1072#1084#1077#1090#1088' '#1074#1080#1085#1090#1072':'
      end
      object CaptionLabel_C5: TLabel
        Left = 16
        Top = 156
        Width = 106
        Height = 14
        Caption = #1069#1092#1092#1077#1082#1090#1080#1074#1085#1086#1089#1090#1100', '#1042#1090':'
      end
      object CaptionLabel_C6: TLabel
        Left = 204
        Top = 12
        Width = 205
        Height = 14
        Caption = #1055#1086#1076#1076#1077#1088#1078#1080#1074#1072#1077#1084#1099#1077' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072' \ '#1089#1086#1082#1077#1090#1099':'
      end
      object CaptionLabel_C7: TLabel
        Left = 204
        Top = 60
        Width = 97
        Height = 14
        Caption = #1059#1088#1086#1074#1077#1085#1100' '#1096#1091#1084#1072', '#1076#1041':'
      end
      object PurposeCombo: TComboBox
        Left = 16
        Top = 28
        Width = 165
        Height = 22
        AutoComplete = False
        Style = csDropDownList
        ItemIndex = 5
        TabOrder = 0
        Text = #1044#1083#1103' '#1087#1088#1086#1094#1077#1089#1089#1086#1088#1072
        Items.Strings = (
          #1042#1086#1076#1086#1073#1083#1086#1082
          #1044#1083#1103' '#1074#1080#1076#1077#1086#1082#1072#1088#1090#1099
          #1044#1083#1103' '#1078#1077#1089#1090#1082#1086#1075#1086' '#1076#1080#1089#1082#1072
          #1044#1083#1103' '#1082#1086#1088#1087#1091#1089#1072
          #1044#1083#1103' '#1086#1087#1077#1088#1072#1090#1080#1074#1085#1086#1081' '#1087#1072#1084#1103#1090#1080
          #1044#1083#1103' '#1087#1088#1086#1094#1077#1089#1089#1086#1088#1072
          #1044#1083#1103' '#1089#1077#1074#1077#1088#1085#1086#1075#1086' '#1084#1086#1089#1090#1072)
      end
      object CoolantCombo: TComboBox
        Left = 16
        Top = 76
        Width = 105
        Height = 22
        AutoComplete = False
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = #1042#1086#1079#1076#1091#1096#1085#1086#1077
        Items.Strings = (
          #1042#1086#1079#1076#1091#1096#1085#1086#1077
          #1046#1080#1076#1082#1086#1089#1090#1085#1086#1077
          #1055#1072#1089#1089#1080#1074#1085#1086#1077)
      end
      object MaterialCombo: TComboBox
        Left = 16
        Top = 124
        Width = 165
        Height = 22
        AutoComplete = False
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 2
        Text = #1040#1083#1102#1084#1080#1085#1080#1081
        Items.Strings = (
          #1040#1083#1102#1084#1080#1085#1080#1081
          #1052#1077#1076#1100
          #1053#1080#1082#1077#1083#1080#1088#1086#1074#1072#1085#1085#1086#1077' '#1087#1086#1082#1088#1099#1090#1080#1077)
      end
      object DiameterCombo: TComboBox
        Left = 204
        Top = 124
        Width = 109
        Height = 22
        AutoComplete = False
        Style = csDropDownList
        ItemIndex = 4
        TabOrder = 3
        Text = '120 '#1084#1084
        Items.Strings = (
          '60 '#1084#1084
          '80 '#1084#1084
          '92 '#1084#1084
          '95 '#1084#1084
          '120 '#1084#1084
          '140 '#1084#1084
          '150 '#1084#1084
          '200 '#1084#1084
          '230 '#1084#1084)
      end
      object DissepationEdit: TEdit
        Left = 16
        Top = 172
        Width = 113
        Height = 22
        NumbersOnly = True
        TabOrder = 4
        Text = '0'
      end
      object SuppDevicesEdit: TEdit
        Left = 204
        Top = 28
        Width = 225
        Height = 22
        MaxLength = 255
        TabOrder = 5
      end
      object NoiseLevelEdit: TEdit
        Left = 204
        Top = 76
        Width = 109
        Height = 22
        NumbersOnly = True
        TabOrder = 6
        Text = '0'
      end
    end
  end
  inherited OpenDialog: TOpenDialog
    Left = 440
    Top = 132
  end
end
