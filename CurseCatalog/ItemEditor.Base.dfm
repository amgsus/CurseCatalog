object ItemEditorBaseFrame: TItemEditorBaseFrame
  Left = 0
  Top = 0
  Width = 515
  Height = 320
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  OnResize = FrameResize
  object BottomPanel: TPanel
    Left = 0
    Top = 279
    Width = 515
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BottomBevel: TBevel
      Left = 0
      Top = 0
      Width = 515
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = 380
      ExplicitTop = 16
      ExplicitWidth = 50
    end
    object ButtonCancel: TPngBitBtn
      Left = 424
      Top = 8
      Width = 83
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = ButtonCancelClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000003104944415478DA9D534B4C135114BD33EDCCB49DA13F5B282D60C062
        02766330FC128144810271EDCAC4603486F859B874E34EF7448926C6858921CA
        5F576A8C2646DB444DFC1424B000A12D2D6DA7A5A59DB6D379DE692175ED5BBD
        DCF3EE79E79E7B2F0507C7603000CF1BF0461D8620994C42B1580403C655BC8A
        1C627225E6723961687808743A0E4AA552998442249110E15720009DDDA740CF
        E9A0A490729CA668882712B030BB582138E16907EFC830E8F0514E92049661F6
        699A22D96C0E52E93DB0DB6CC0B00C64B3595EC77159FC8088A208332FE6AA04
        C3DE21908BF20547BDE349524CFA288A1AD36834291915711C03C954EAB2B3DE
        793F91487CD36A34BD0951546667E6AB0443C3838009530E87E32AC36821B213
        F55134E5D5EBF5A9E8EEEE9556B77B2A9BDDA79592528CC662D6FD4C263337BB
        50251819F5024DD30D02CF7F30994D2D0CC3422818F2EDA5F7E6DADBDAEEE5A4
        1CADD56895B5F5F56B46A3712A168B554B70B7BA51C159309BCD68A2DC585363
        7C6FB55A5A589645D3282249128AA195DFABABD731F9413E9F87E86E149E4FCF
        543B3370A61FDADBDBCA2440A05110842F7ABDAE1655A1071C0904566EDB6C47
        EEA27288C5E2E0F3F96125B05221B0D96D30766E14AC160B6012A4D39989A6C6
        C6C942214FA30260390EA2915DD558AF4294540EBB130A85E1E5D2AB0A414383
        0B06B1040B12487969E2584B0B2617682C8164D299985023D8D5DE87C3615FBE
        50F0CAB29CDADEDA8637AFDF5608789E879EDE2E70BA9CE73D1ECF33592E6232
        47FC7EFFAD706867BEB7B7E79DBDD6D6ACBE0D6E873E0683C1BEB5B575F2E3FB
        CF0A810E65D7D5D5B11D1D27A7BABA3BC78942C8E2E2D29DCF9FFC932A6E3419
        8F8E5FBAB8E870D435A1A1A5470F1F37330C13DAFAB355AA10E0080B420D8735
        7BFAFAFB6E6E6C6C7C5D0EAC4C633C8D83A4E0E1F43AFDF1FE81D3373637B710
        5B7E6AAFB58B919D885226509DAE77D6ABCB44E772120D841034ACA4CEBB6A98
        D96CC285E269F5A96A2AC7B2723C1E07514C56DB8853085A9C40947F1021E56D
        43AEF2075AADB6BA8A98552C14CBD8BF1BFA5FE72F898C587D954D99B9000000
        0049454E44AE426082}
    end
    object ButtonOK: TPngBitBtn
      Left = 320
      Top = 8
      Width = 98
      Height = 25
      Caption = #1054#1050
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = ButtonOKClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000002E34944415478DA8D93494C135118C7FF6FDAE93AA585B65810100852
        D0BA800B2A04232E89114E861863625CE2C58307A3C6C48389074F1ED4930931
        E16622890797A8098B0A71894B5A4245F668448BD8D276DA4E673A8BAF808007
        D4EFE54BE6BD37DF2FEFFDBFFF23F847943718B1EFF03AB07A16B22C83100249
        963031FE15EFEF8541FE566CB213B49C5F85EA722F328A98174BF095452B0A5F
        2B8A82189F446F4FE0EF005FB3054DCDEBE1713B914849773654AE391418FEF4
        4456936788C68EF674BE5F1E60CD67D072B61C1545A5E085D8E65A6FED1B4D1F
        6138A31B2FDEFAAFB0ACFE726F8F7F79C09623366C6FF4C1E5C88124A1BBA234
        7797AC8A48F2E6F874EC5B852491E9E75D1FE60055BBCDC85F6583AAAA73D574
        B5D8EB40596131E2A9F8814DD5350FD27288588D2E7C181CBA949763BFFA2332
        83670FA906053E167B8FAE86C7E9864201AAA642A3232B146731EA589DD5BF22
        5FE7533505D1A8615294E395B419A9E0F0181E5FFB02D270DC8DBA1D5530B084
        A444E5A62026FA5D0E479BA601D144FC64ADD7D796487F279CC9A3F58F0E9DB2
        73B6DBA170045D1D8398E81341EA8FB9B09502C48C78716D79D955023D094E8C
        B4990CCC05CEE21CE02CA995843088C60C031A11360A6945098E0CA1EBC63464
        118B008BD1FADD9E93F1C88A08CEE4C654589CF6B8CC6E5E9882CD54A405C607
        5A9C39CE47A19F613C6D1F4268409E932B7B856DF5D5486792550E8BFBBEDDA6
        AE16C4D8ACE3347A0FBDCE88488CE9819669E29322FA036378D53EB3D02D52D3
        6A436555090C602165845CA727EF6E5971EEEE782A34DB219BB944ED7BE9AF8B
        7ED6DE8D7F8CE0DB080F555E6CF7EC4F660703678115F65C134C9C8EF578B9EB
        3B1BAB4F0B5204C100DFE1EF9C3C129E4AA93353824A8BB5A57E593012D549C7
        E88851C968263A35F8F6E49DD8DF5A7BEED6E5EE837C481DA36BD27CA66952F9
        A0FC01A0A1A369CCBEA12C603ED9F9BDCCFF00164F45C0500D19AAE1EFFDACB7
        B2365567BF97C42F36CA375F08E26F360000000049454E44AE426082}
    end
    object ButtonEdit: TButton
      Left = 8
      Top = 8
      Width = 101
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
      OnClick = ButtonEditClick
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    Caption = '.:: %Catalog.Name% '#187' %Item.Name% ::.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object TopBevel: TBevel
      Left = 0
      Top = 27
      Width = 515
      Height = 2
      Align = alBottom
      Shape = bsBottomLine
      ExplicitLeft = 380
      ExplicitTop = 16
      ExplicitWidth = 50
    end
    object FrameIcon: TImage
      Left = 8
      Top = 5
      Width = 16
      Height = 16
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        001008060000001FF3FF61000002A04944415478DA85925B48936118C7FFDF0E
        DFB7933B78CE431E46D1892E3642CBBBC20C84C459D88CA8861A1EE822A99BA4
        1BB52288C47244981791516941AD223B80146990175A3A5C799C4B6C3AE7E6E7
        CEDFB73E2B4685D317FE3C2F3CBC3FFECFFB7F08AC736AA452E892939F5042E1
        C7EE85854B0D76FB3F7D62ADC7074B8FA2D6B374C36C7A5A2357A990191B3B24
        140AF7968F8FCF590281F501CC486BEE3099DF37D5DE094BE379C4706EE2150A
        648BC5859AB1B117E1B500FDF7ABA1D92A9F73CFBC8EF7A94F810E17E16DC16E
        046C56642814F5871D8E267F344055E92E189B8AEF3827DE1D0B782610A22D20
        12F3B1BCE31EBE5DBC3CF5BCFD66A6717979F511E4520AAECF170A5CD3032F7D
        4B6680F521147482926420480FC3BBAD638B5A7BC2027F14C054770D95A4F0BB
        5D3FDE937C510ABCEE7E48E45A047D362448674F6BCBE9EB0393515268A8DD83
        FACA9C3776EBAB7D02321541FF0CF87C0AE051A0D8D1DEB667EEBC3346DFEA31
        A6262861FB603038467B6FB39C6DA1741302B4192457198F39EC5E5A9467EBED
        F4FF8E238092FD5A3C6C364CCF8FB7A549E3F2E05DFC0452ACE6AC4F224E3257
        B2A178ECF1AC834554C0D98A0368AC3B12F6124A60F90B08673F58220C19DFF6
        E89C71E2D0B507CE55E38E008C0D27A5559545F4929B0541A940100C78D6167A
        C4F23546631889BA6C1140C6C694EDB99ACD43B7AED641248B05A94AEA74D81D
        D5496939F3CC1ADB1A01A4A5A7173A1CCE67714A9969B0AFB3EA4A4BC7F7E6D6
        BB484C888540C087C7E341281402CBB2BFEE7EBFFF37A0ACAC0C151515593D3D
        3DC7793C9E205BAD1E0C0619895844C9C46291F80FDFBB22822056D6DFCD55A7
        4824B27675758D123A9D0E7ABD7E2747CFE29A4A8661B85F8490938C53F82FA7
        2B118656009C5C24498E9A4CA6C19FFF9F0F69B57EF3BB0000000049454E44AE
        426082}
    end
  end
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 32
    Width = 509
    Height = 244
    ActivePage = CommonTabSheet
    Align = alClient
    TabOrder = 2
    object CommonTabSheet: TTabSheet
      Caption = #1054#1073#1097#1080#1077
      object CaptionLabel_1: TLabel
        Left = 16
        Top = 12
        Width = 82
        Height = 14
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object CaptionLabel_4: TLabel
        Left = 16
        Top = 157
        Width = 20
        Height = 14
        Caption = #1043#1086#1076':'
      end
      object CaptionLabel_5: TLabel
        Left = 75
        Top = 157
        Width = 47
        Height = 14
        Caption = #1050#1074#1072#1088#1090#1072#1083':'
      end
      object CaptionLabel_2: TLabel
        Left = 16
        Top = 60
        Width = 41
        Height = 14
        Caption = #1052#1086#1076#1077#1083#1100':'
      end
      object CaptionLabel_3: TLabel
        Left = 16
        Top = 109
        Width = 103
        Height = 14
        Caption = #1050#1086#1076' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103':'
      end
      object CaptionLabel_6: TLabel
        Left = 204
        Top = 157
        Width = 65
        Height = 14
        Caption = #1052#1080#1085'. '#1094#1077#1085#1072', $:'
      end
      object CaptionLabel_7: TLabel
        Left = 295
        Top = 157
        Width = 70
        Height = 14
        Caption = #1052#1072#1082#1089'. '#1094#1077#1085#1072', $:'
      end
      object CaptionLabel_8: TLabel
        Left = 204
        Top = 12
        Width = 53
        Height = 14
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
        WordWrap = True
      end
      object VendorCombo: TComboBox
        Left = 16
        Top = 28
        Width = 165
        Height = 22
        MaxLength = 31
        Sorted = True
        TabOrder = 0
      end
      object YearCombo: TComboBox
        Left = 16
        Top = 172
        Width = 53
        Height = 22
        Style = csDropDownList
        TabOrder = 3
      end
      object QuarterCombo: TComboBox
        Left = 75
        Top = 172
        Width = 106
        Height = 22
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 4
        Text = '2-'#1081' ('#1072#1087#1088'. - '#1080#1102#1085'.)'
        Items.Strings = (
          '1-'#1081' ('#1103#1085#1074'. - '#1084#1072#1088'.)'
          '2-'#1081' ('#1072#1087#1088'. - '#1080#1102#1085'.)'
          '3-'#1081' ('#1080#1102#1083'. - '#1089#1077#1085'.)'
          '4-'#1081' ('#1086#1082#1090'. - '#1076#1077#1082'.)')
      end
      object ModelEdit: TEdit
        Left = 16
        Top = 75
        Width = 165
        Height = 22
        MaxLength = 63
        TabOrder = 1
      end
      object ProductIDEdit: TEdit
        Left = 16
        Top = 124
        Width = 165
        Height = 22
        CharCase = ecUpperCase
        MaxLength = 31
        TabOrder = 2
      end
      object MinPriceEdit: TEdit
        Left = 204
        Top = 172
        Width = 85
        Height = 22
        Alignment = taCenter
        NumbersOnly = True
        TabOrder = 5
        Text = '0'
      end
      object MaxPriceEdit: TEdit
        Left = 295
        Top = 172
        Width = 85
        Height = 22
        Alignment = taCenter
        NumbersOnly = True
        TabOrder = 6
        Text = '0'
      end
      object DescriptionMemo: TMemo
        Left = 204
        Top = 28
        Width = 176
        Height = 118
        MaxLength = 191
        ScrollBars = ssVertical
        TabOrder = 7
        WantReturns = False
      end
    end
    object ImageTabSheet: TTabSheet
      Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      object ImageGroupBox: TGroupBox
        Left = 12
        Top = 12
        Width = 281
        Height = 185
        Caption = ' '#1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077' (PNG, '#1084#1072#1082#1089'. 150'#1093'150 px) '
        TabOrder = 0
        object PreviewImage: TImage
          Left = 16
          Top = 24
          Width = 150
          Height = 150
          Center = True
        end
        object ImgOpenButton: TButton
          Left = 180
          Top = 28
          Width = 85
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100'...'
          TabOrder = 0
          OnClick = ImgOpenButtonClick
        end
        object ImgCleanButton: TButton
          Left = 180
          Top = 59
          Width = 85
          Height = 25
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          TabOrder = 1
          OnClick = ImgCleanButtonClick
        end
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Portable Network Graphics (*.png)|*.png|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
    Title = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077'...'
    Left = 436
    Top = 76
  end
end
