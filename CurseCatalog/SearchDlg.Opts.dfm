object SearchQueryDialog: TSearchQueryDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082' '#1079#1072#1087#1080#1089#1077#1081
  ClientHeight = 380
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 14
  object QueryEdit: TLabeledEdit
    Left = 16
    Top = 28
    Width = 385
    Height = 22
    EditLabel.Width = 90
    EditLabel.Height = 14
    EditLabel.Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072':'
    TabOrder = 0
  end
  object GroupBox_0: TGroupBox
    Left = 8
    Top = 63
    Width = 404
    Height = 266
    Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '
    TabOrder = 1
    object CatsGroupBox: TGroupBox
      Left = 16
      Top = 20
      Width = 165
      Height = 229
      Caption = ' '#1054#1073#1083#1072#1089#1090#1100' '#1087#1086#1080#1089#1082#1072' '
      TabOrder = 0
      object CatCheck_0: TCheckBox
        Left = 16
        Top = 20
        Width = 137
        Height = 17
        Caption = #1052#1072#1090#1077#1088#1080#1085#1089#1082#1080#1077' '#1087#1083#1072#1090#1099
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object CatCheck_1: TCheckBox
        Tag = 1
        Left = 16
        Top = 40
        Width = 137
        Height = 17
        Caption = #1055#1088#1086#1094#1077#1089#1089#1086#1088#1099
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object CatCheck_2: TCheckBox
        Tag = 2
        Left = 16
        Top = 60
        Width = 137
        Height = 17
        Caption = #1054#1087#1077#1088#1072#1090#1080#1074#1085#1072#1103' '#1087#1072#1084#1103#1090#1100
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object CatCheck_3: TCheckBox
        Tag = 3
        Left = 16
        Top = 80
        Width = 137
        Height = 17
        Caption = #1046#1077#1089#1090#1082#1080#1077' '#1076#1080#1089#1082#1080' \ SSD'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object CatCheck_4: TCheckBox
        Tag = 4
        Left = 16
        Top = 100
        Width = 137
        Height = 17
        Caption = #1057#1080#1089#1090#1077#1084#1099' '#1086#1093#1083#1072#1078#1076#1077#1085#1080#1103
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object CatCheck_5: TCheckBox
        Tag = 5
        Left = 16
        Top = 120
        Width = 137
        Height = 17
        Caption = #1041#1083#1086#1082#1080' '#1087#1080#1090#1072#1085#1080#1103
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object CatCheck_6: TCheckBox
        Tag = 6
        Left = 16
        Top = 140
        Width = 137
        Height = 17
        Caption = #1042#1080#1076#1077#1086#1082#1072#1088#1090#1099' (VGA)'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object CatCheck_7: TCheckBox
        Tag = 7
        Left = 16
        Top = 160
        Width = 137
        Height = 17
        Caption = #1047#1074#1091#1082#1086#1074#1099#1077' '#1082#1072#1088#1090#1099
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object CatCheck_8: TCheckBox
        Tag = 8
        Left = 16
        Top = 180
        Width = 137
        Height = 17
        Caption = 'CD\DVD\BD-'#1087#1088#1080#1074#1086#1076#1099
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object CatCheck_9: TCheckBox
        Tag = 9
        Left = 16
        Top = 200
        Width = 137
        Height = 17
        Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1073#1083#1086#1082#1080
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
    end
    object GroupBox_2: TGroupBox
      Left = 187
      Top = 20
      Width = 202
      Height = 134
      Caption = ' '#1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1086#1080#1089#1082#1072' '
      TabOrder = 1
      object VendorCheck: TCheckBox
        Left = 16
        Top = 20
        Width = 169
        Height = 17
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object ModelCheck: TCheckBox
        Left = 16
        Top = 40
        Width = 169
        Height = 17
        Caption = #1052#1086#1076#1077#1083#1100
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object ProductIDCheck: TCheckBox
        Left = 16
        Top = 60
        Width = 169
        Height = 17
        Caption = #1050#1086#1076' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object NoteCheck: TCheckBox
        Left = 16
        Top = 80
        Width = 73
        Height = 17
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        TabOrder = 3
      end
      object PriceCheck: TCheckBox
        Left = 16
        Top = 100
        Width = 117
        Height = 17
        Caption = #1062#1077#1085#1086#1074#1086#1081' '#1076#1080#1072#1087#1072#1079#1086#1085
        TabOrder = 4
      end
    end
    object GroupBox_3: TGroupBox
      Left = 187
      Top = 160
      Width = 202
      Height = 89
      Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '
      TabOrder = 2
      object CaseSensitiveCheck: TCheckBox
        Left = 16
        Top = 20
        Width = 173
        Height = 17
        Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088' '#1089#1080#1084#1074#1086#1083#1086#1074
        TabOrder = 0
      end
      object WholeMatchCheck: TCheckBox
        Left = 16
        Top = 40
        Width = 169
        Height = 17
        Caption = #1058#1086#1095#1085#1099#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1103
        TabOrder = 1
      end
      object FromCursorCheck: TCheckBox
        Left = 16
        Top = 60
        Width = 169
        Height = 17
        Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100' '#1089' '#1082#1091#1088#1089#1086#1088#1072
        TabOrder = 2
        Visible = False
      end
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 339
    Width = 420
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BottomBevel: TBevel
      Left = 0
      Top = 0
      Width = 420
      Height = 2
      Align = alTop
      Shape = bsTopLine
    end
    object ButtonCancel: TButton
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonSearch: TButton
      Left = 255
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1086#1080#1089#1082
      Default = True
      TabOrder = 0
      OnClick = ButtonSearchClick
    end
  end
end
