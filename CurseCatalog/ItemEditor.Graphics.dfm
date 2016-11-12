inherited ItemEditorFrame_GPU: TItemEditorFrame_GPU
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
        Width = 131
        Height = 14
        Caption = #1043#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' '#1091#1089#1082#1086#1088#1080#1090#1077#1083#1100':'
      end
      object CaptionLabel_C4: TLabel
        Left = 204
        Top = 60
        Width = 31
        Height = 14
        Caption = #1064#1080#1085#1072':'
      end
      object CaptionLabel_C2: TLabel
        Left = 16
        Top = 60
        Width = 62
        Height = 14
        Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089':'
      end
      object CaptionLabel_C3: TLabel
        Left = 16
        Top = 108
        Width = 67
        Height = 14
        Caption = #1054#1093#1083#1072#1078#1076#1077#1085#1080#1077':'
      end
      object CaptionLabel_C5: TLabel
        Left = 284
        Top = 60
        Width = 93
        Height = 14
        Caption = #1058#1080#1087' '#1074#1080#1076#1077#1086#1087#1072#1084#1103#1090#1080':'
      end
      object CaptionLabel_C6: TLabel
        Left = 204
        Top = 108
        Width = 97
        Height = 14
        Caption = #1055#1086#1076#1076#1077#1088#1078#1082#1072' DirectX:'
      end
      object CaptionLabel_C7: TLabel
        Left = 16
        Top = 156
        Width = 57
        Height = 14
        Caption = #1044#1083#1080#1085#1072', '#1084#1084':'
      end
      object CaptionLabel_C8: TLabel
        Left = 204
        Top = 12
        Width = 95
        Height = 14
        Caption = #1063#1072#1089#1090#1086#1090#1072' GPU, '#1052#1043#1094':'
      end
      object CaptionLabel_C9: TLabel
        Left = 324
        Top = 12
        Width = 112
        Height = 14
        Caption = #1063#1072#1089#1090#1086#1090#1072' '#1087#1072#1084#1103#1090#1080', '#1052#1043#1094':'
      end
      object GPUCombo: TComboBox
        Left = 16
        Top = 28
        Width = 165
        Height = 22
        MaxLength = 31
        TabOrder = 0
        Items.Strings = (
          'GeForce GTX Titan'
          'GeForce GTX Titan Z'
          'GeForce GTX 780 Ti'
          'GeForce GTX 780'
          'GeForce GTX 770'
          'GeForce GTX 760'
          'GeForce GTX 750 Ti'
          'GeForce GTX 750'
          'GeForce GTX 690'
          'GeForce GTX 680'
          'GeForce GTX 670'
          'GeForce GTX 660'
          'GeForce GTX 650 Ti'
          'GeForce GTX 650'
          'Radeon R9 295X2'
          'Radeon R9 290X'
          'Radeon R9 290'
          'Radeon R9 280X'
          'Radeon R9 280'
          'Radeon R9 270X'
          'Radeon R9 270'
          'Radeon R7 265'
          'Radeon R7 260X'
          'Radeon R7 260'
          'Radeon R7 250X'
          'Radeon R7 250E'
          'Radeon R7 250'
          'Radeon R7 240'
          'Radeon R7 230'
          'Radeon HD 7990'
          'Radeon HD 7970 GHz Edition'
          'Radeon HD 7950'
          'Radeon HD 7870 GHz Edition'
          'Radeon HD 7850'
          'Radeon HD 7770'
          'Radeon HD 7750'
          'Radeon HD 7730'
          'Radeon HD 6670'
          'Radeon HD 6570'
          'Radeon HD 6450'
          'Radeon HD 5450'
          'Quadro 410'
          'Quadro 600'
          'Quadro K600'
          'Quadro 2000'
          'Quadro 2000D'
          'Quadro 4000'
          'Quadro K4000'
          'Quadro 5000'
          'Quadro K5000'
          'Quadro 6000'
          'Quadro K6000')
      end
      object BusCombo: TComboBox
        Left = 204
        Top = 76
        Width = 70
        Height = 22
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 6
        Text = '128 '#1073#1080#1090
        Items.Strings = (
          '32 '#1073#1080#1090
          '64 '#1073#1080#1090
          '128 '#1073#1080#1090
          '192 '#1073#1080#1090
          '256 '#1073#1080#1090
          '384 '#1073#1080#1090
          '512 '#1073#1080#1090
          '768 '#1073#1080#1090
          '1024 '#1073#1080#1090)
      end
      object InterfaceCombo: TComboBox
        Left = 16
        Top = 76
        Width = 165
        Height = 22
        Style = csDropDownList
        ItemIndex = 5
        TabOrder = 1
        Text = 'PCI Express x16 3.0'
        Items.Strings = (
          'AGP 3.0 8x'
          'PCI Express x8 2.0'
          'PCI Express x8 3.0'
          'PCI Express x16 2.0'
          'PCI Express x16 2.1'
          'PCI Express x16 3.0'
          'FireWire')
      end
      object CoolingCombo: TComboBox
        Left = 16
        Top = 124
        Width = 165
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 2
        Text = #1040#1082#1090#1080#1074#1085#1086#1077' ('#1074#1086#1079#1076#1091#1096#1085#1086#1077')'
        Items.Strings = (
          #1040#1082#1090#1080#1074#1085#1086#1077' ('#1074#1086#1079#1076#1091#1096#1085#1086#1077')'
          #1055#1072#1089#1089#1080#1074#1085#1086#1077)
      end
      object MemTypeCombo: TComboBox
        Left = 284
        Top = 76
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 7
        Text = 'DDR3'
        Items.Strings = (
          'DDR3'
          'GDDR3'
          'GDDR5')
      end
      object DXCombo: TComboBox
        Left = 204
        Top = 124
        Width = 109
        Height = 22
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 8
        Text = '10.0'
        Items.Strings = (
          '9.0'
          '10.0'
          '11.0'
          '11.1'
          '11.2'
          '12')
      end
      object SLICheck: TCheckBox
        Left = 204
        Top = 156
        Width = 149
        Height = 17
        Caption = #1055#1086#1076#1076#1077#1088#1078#1082#1072' SLI \ CrossFire'
        TabOrder = 9
      end
      object HDMICheck: TCheckBox
        Left = 204
        Top = 179
        Width = 133
        Height = 17
        Caption = #1053#1072#1083#1080#1095#1080#1077' HDMI-'#1074#1099#1093#1086#1076#1072
        TabOrder = 10
      end
      object WidthEdit: TEdit
        Left = 16
        Top = 172
        Width = 89
        Height = 22
        NumbersOnly = True
        TabOrder = 3
        Text = '0'
      end
      object GPUFreqEdit: TEdit
        Left = 204
        Top = 28
        Width = 109
        Height = 22
        NumbersOnly = True
        TabOrder = 4
        Text = '0'
      end
      object MemFreqEdit: TEdit
        Left = 324
        Top = 28
        Width = 125
        Height = 22
        NumbersOnly = True
        TabOrder = 5
        Text = '0'
      end
    end
  end
end
