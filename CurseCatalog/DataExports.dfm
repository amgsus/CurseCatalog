object DataExportDialog: TDataExportDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1079#1072#1087#1080#1089#1077#1081
  ClientHeight = 300
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object BottomPanel: TPanel
    Left = 0
    Top = 259
    Width = 480
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BottomBevel: TBevel
      Left = 0
      Top = 0
      Width = 480
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitWidth = 420
    end
    object ButtonCancel: TButton
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonExport: TButton
      Left = 311
      Top = 8
      Width = 75
      Height = 25
      Caption = #1069#1082#1089#1087#1086#1088#1090
      Default = True
      TabOrder = 0
      OnClick = ButtonExportClick
    end
  end
  object ExportList: TCheckListBox
    AlignWithMargins = True
    Left = 3
    Top = 81
    Width = 474
    Height = 175
    Align = alClient
    ItemHeight = 14
    PopupMenu = PopupMenu
    TabOrder = 1
  end
  object Panel_0: TPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object CaptionLabel_1: TLabel
      Left = 12
      Top = 12
      Width = 56
      Height = 14
      Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072':'
    end
    object FileTypeCombo: TComboBox
      Left = 12
      Top = 28
      Width = 225
      Height = 22
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' (*.txt)'
      Items.Strings = (
        #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' (*.txt)'
        #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103' (*.png)')
    end
    object ExcludePicsCheck: TCheckBox
      Left = 12
      Top = 56
      Width = 185
      Height = 17
      Caption = #1053#1077' '#1101#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1084#1080#1085#1080#1072#1090#1102#1088#1099
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object SaveDialog: TSaveDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing, ofDontAddToRecent]
    Title = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1092#1072#1081#1083'...'
    Left = 400
    Top = 112
  end
  object PopupMenu: TPopupMenu
    Left = 400
    Top = 160
    object MenuItemSelectAll: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = MenuItemSelectAllClick
    end
    object MenuItemUnselect: TMenuItem
      Caption = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      OnClick = MenuItemUnselectClick
    end
    object MenuItem_1: TMenuItem
      Caption = '-'
    end
    object MenuItemExchSelection: TMenuItem
      Caption = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      OnClick = MenuItemExchSelectionClick
    end
  end
end
