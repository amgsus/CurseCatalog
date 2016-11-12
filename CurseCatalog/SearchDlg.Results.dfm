object SearchResultsForm: TSearchResultsForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072
  ClientHeight = 320
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object BottomPanel: TPanel
    Left = 0
    Top = 279
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
    object ButtonExit: TButton
      Left = 396
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1057#1082#1088#1099#1090#1100
      TabOrder = 2
      OnClick = ButtonExitClick
    end
    object ButtonGo: TButton
      Left = 315
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1077#1088#1077#1081#1090#1080
      Default = True
      TabOrder = 1
      OnClick = ButtonGoClick
    end
    object ButtonRetry: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1100
      TabOrder = 0
      OnClick = ButtonRetryClick
    end
  end
  object SearchList: TListBox
    AlignWithMargins = True
    Left = 3
    Top = 45
    Width = 474
    Height = 231
    Margins.Top = 0
    Align = alClient
    ItemHeight = 14
    TabOrder = 1
    OnDblClick = SearchListDblClick
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object QueryTextLabel: TLabel
      Left = 8
      Top = 8
      Width = 287
      Height = 14
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1079#1072#1087#1088#1086#1089#1091' "%Search.QueryText%" '#1079#1072#1074#1077#1088#1096#1077#1085'!'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ResultLabel: TLabel
      Left = 8
      Top = 23
      Width = 302
      Height = 14
      Caption = #1053#1072#1081#1076#1077#1085#1086' %Search.Results.Found% '#1074' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1082#1072#1090#1072#1083#1086#1075#1072#1093'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
end
