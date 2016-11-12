inherited ItemEditorFrame_HDD: TItemEditorFrame_HDD
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
      object CaptionLabel_C1: TLabel
        Left = 16
        Top = 12
        Width = 21
        Height = 14
        Caption = #1058#1080#1087':'
      end
      object CaptionLabel_C3: TLabel
        Left = 16
        Top = 156
        Width = 94
        Height = 14
        Caption = #1058#1080#1087' '#1087#1072#1084#1103#1090#1080' (SSD):'
      end
      object CaptionLabel_C2: TLabel
        Left = 107
        Top = 12
        Width = 72
        Height = 14
        Caption = #1060#1086#1088#1084'-'#1092#1072#1082#1090#1086#1088':'
      end
      object CaptionLabel_C4: TLabel
        Left = 16
        Top = 60
        Width = 132
        Height = 14
        Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103':'
      end
      object CaptionLabel_C5: TLabel
        Left = 16
        Top = 108
        Width = 56
        Height = 14
        Caption = #1054#1073#1098#1077#1084', '#1043#1073':'
      end
      object CaptionLabel_C6: TLabel
        Left = 103
        Top = 108
        Width = 56
        Height = 14
        Caption = #1041#1091#1092#1077#1088', '#1052#1073':'
      end
      object MediaCombo: TComboBox
        Left = 16
        Top = 28
        Width = 85
        Height = 22
        AutoComplete = False
        Style = csDropDownList
        ItemIndex = 0
        Sorted = True
        TabOrder = 0
        Text = 'HDD'
        Items.Strings = (
          'HDD'
          'SSD'
          #1043#1080#1073#1088#1080#1076#1085#1099#1081)
      end
      object FlashTypeCombo: TComboBox
        Left = 16
        Top = 172
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        Sorted = True
        TabOrder = 5
        Text = 'NAND MLC'
        Items.Strings = (
          'NAND MLC'
          'NAND SLC'
          'NAND TLC')
      end
      object FormSizeCombo: TComboBox
        Left = 107
        Top = 28
        Width = 74
        Height = 22
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 1
        Text = '3.5"'
        Items.Strings = (
          '1.8"'
          '2.5"'
          '3.5"'
          'DOM'
          'mSATA')
      end
      object InterfaceCombo: TComboBox
        Left = 16
        Top = 76
        Width = 165
        Height = 22
        Style = csDropDownList
        ItemIndex = 3
        TabOrder = 2
        Text = 'SATA 3.0'
        Items.Strings = (
          'IDE'
          'SATA 1.0'
          'SATA 2.0'
          'SATA 3.0'
          'mSATA 2.0'
          'mSATA 3.0'
          'PCI-Express'
          'PCI-Express 1.0 x4'
          'PCI-Express 2.0 x4'
          'PCI-Express 2.0 x8'
          'SCSI'
          'SAS'
          'SAS 1.0'
          'SAS 2.0')
      end
      object CapacityEdit: TEdit
        Left = 16
        Top = 124
        Width = 81
        Height = 22
        NumbersOnly = True
        TabOrder = 3
        Text = '0'
      end
      object BufferSizeEdit: TEdit
        Left = 103
        Top = 124
        Width = 78
        Height = 22
        NumbersOnly = True
        TabOrder = 4
        Text = '0'
      end
    end
  end
end
