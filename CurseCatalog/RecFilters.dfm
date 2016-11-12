object FilterDialog: TFilterDialog
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1080#1083#1100#1090#1088#1072
  ClientHeight = 335
  ClientWidth = 320
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
  object BottomPanel: TPanel
    Left = 0
    Top = 294
    Width = 320
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BottomBevel: TBevel
      Left = 0
      Top = 0
      Width = 320
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitWidth = 420
    end
    object ButtonCancel: TButton
      Left = 236
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonOK: TButton
      Left = 155
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = ButtonOKClick
    end
    object ButtonReset: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100
      ModalResult = 5
      TabOrder = 2
    end
  end
  object GroupBox_Vendor: TGroupBox
    Left = 8
    Top = 8
    Width = 304
    Height = 77
    Caption = ' '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1102' '
    TabOrder = 1
    object VendorCheck: TCheckBox
      Left = 12
      Top = 20
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
    end
    object VendorEdit: TEdit
      Left = 12
      Top = 43
      Width = 281
      Height = 22
      TabOrder = 1
    end
  end
  object GroupBox_Price: TGroupBox
    Left = 8
    Top = 91
    Width = 304
    Height = 93
    Caption = ' '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1094#1077#1085#1077' '
    TabOrder = 2
    object HintLabel_2: TLabel
      Left = 12
      Top = 70
      Width = 129
      Height = 14
      Caption = #1055#1088#1080#1084#1077#1088': 2012.4 >> 2013.2'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object PriceCheck: TCheckBox
      Left = 12
      Top = 20
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
    end
    object PriceEdit: TEdit
      Left = 12
      Top = 43
      Width = 281
      Height = 22
      TabOrder = 1
      Text = '100 - 250'
    end
  end
  object GroupBox_Date: TGroupBox
    Left = 8
    Top = 190
    Width = 304
    Height = 93
    Caption = ' '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' '#1074#1099#1087#1091#1089#1082#1072' '
    TabOrder = 3
    object HintLabel_3: TLabel
      Left = 12
      Top = 70
      Width = 129
      Height = 14
      Caption = #1055#1088#1080#1084#1077#1088': 2012.4 >> 2013.2'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object ReleaseDateCheck: TCheckBox
      Left = 12
      Top = 20
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
    end
    object DateEdit: TEdit
      Left = 12
      Top = 43
      Width = 281
      Height = 22
      TabOrder = 1
      Text = '2012.1 - 2013.4'
    end
  end
end
