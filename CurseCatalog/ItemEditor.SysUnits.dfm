inherited ItemEditorFrame_UNT: TItemEditorFrame_UNT
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
        Left = 192
        Top = 12
        Width = 72
        Height = 14
        Caption = #1060#1086#1088#1084'-'#1092#1072#1082#1090#1086#1088':'
      end
      object CaptionLabel_C3: TLabel
        Left = 16
        Top = 60
        Width = 53
        Height = 14
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083':'
      end
      object CaptionLabel_C4: TLabel
        Left = 164
        Top = 60
        Width = 29
        Height = 14
        Caption = #1062#1074#1077#1090':'
      end
      object FormatCombo: TComboBox
        Left = 16
        Top = 28
        Width = 165
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1099#1081' (Tower)'
        Items.Strings = (
          #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1099#1081' (Tower)'
          #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1099#1081' (Desktop)'
          #1054#1090#1082#1088#1099#1090#1099#1081' ('#1082#1072#1088#1082#1072#1089#1085#1099#1081')'
          'SFF'
          'Rackmount')
      end
      object FormFactorCombo: TComboBox
        Left = 192
        Top = 28
        Width = 85
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = 'ATX'
        Items.Strings = (
          'ATX'
          'Mini-ATX'
          'Micro-ATX'
          'ITX'
          'Mini-ITX'
          'DTX'
          'Mini-DTX'
          'SSI EEB'
          'SSI CEB')
      end
      object MaterialCombo: TComboBox
        Left = 16
        Top = 76
        Width = 137
        Height = 22
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 2
        Text = #1055#1086#1083#1080#1082#1072#1088#1073#1086#1085#1072#1090
        Items.Strings = (
          #1040#1083#1102#1084#1080#1085#1080#1081
          #1055#1083#1072#1089#1090#1080#1082
          #1055#1086#1083#1080#1082#1072#1088#1073#1086#1085#1072#1090
          #1057#1090#1072#1083#1100)
      end
      object ColorCombo: TComboBox
        Left = 164
        Top = 76
        Width = 113
        Height = 22
        Style = csDropDownList
        DropDownCount = 15
        ItemIndex = 16
        TabOrder = 3
        Text = #1063#1077#1088#1085#1099#1081
        Items.Strings = (
          #1041#1077#1083#1099#1081
          #1043#1086#1083#1091#1073#1086#1081
          #1046#1077#1083#1090#1099#1081
          #1047#1077#1083#1077#1085#1099#1081
          #1047#1086#1083#1086#1090#1080#1089#1090#1099#1081
          #1050#1088#1072#1089#1085#1099#1081
          #1054#1083#1080#1074#1082#1086#1074#1099#1081
          #1054#1088#1072#1085#1078#1077#1074#1099#1081
          #1055#1088#1086#1079#1088#1072#1095#1085#1099#1081
          #1056#1086#1079#1086#1074#1099#1081
          #1057#1077#1088#1077#1073#1088#1080#1089#1090#1099#1081
          #1057#1077#1088#1099#1081
          #1057#1080#1085#1080#1081
          #1058#1080#1090#1072#1085
          #1060#1080#1086#1083#1077#1090#1086#1074#1099#1081
          #1061#1072#1082#1080
          #1063#1077#1088#1085#1099#1081)
      end
      object DustFiltersCheck: TCheckBox
        Left = 16
        Top = 108
        Width = 117
        Height = 17
        Caption = #1055#1099#1083#1077#1074#1099#1081' '#1092#1080#1083#1100#1090#1088#1099
        TabOrder = 4
      end
      object DisplayCheck: TCheckBox
        Left = 16
        Top = 131
        Width = 157
        Height = 17
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1081' '#1076#1080#1089#1087#1083#1077#1081
        TabOrder = 5
      end
      object USB30SupportCheck: TCheckBox
        Left = 16
        Top = 154
        Width = 125
        Height = 17
        Caption = #1055#1086#1076#1076#1077#1088#1078#1082#1072' USB 3.0'
        TabOrder = 6
      end
      object AppleDockCheck: TCheckBox
        Left = 16
        Top = 177
        Width = 201
        Height = 17
        Caption = #1044#1086#1082'-'#1089#1090#1072#1085#1094#1080#1103' '#1076#1083#1103' '#1091#1089#1090#1088#1086#1081#1089#1090#1074' Apple'
        TabOrder = 7
      end
    end
  end
end
