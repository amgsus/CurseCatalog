inherited ItemEditorFrame_RAM: TItemEditorFrame_RAM
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
        Width = 62
        Height = 14
        Caption = #1058#1080#1087' '#1087#1072#1084#1103#1090#1080':'
      end
      object CaptionLabel_C2: TLabel
        Left = 16
        Top = 108
        Width = 67
        Height = 14
        Caption = 'CAS Latency:'
      end
      object CaptionLabel_C3: TLabel
        Left = 107
        Top = 108
        Width = 46
        Height = 14
        Caption = #1055#1080#1090#1072#1085#1080#1077':'
      end
      object CaptionLabel_C4: TLabel
        Left = 16
        Top = 60
        Width = 45
        Height = 14
        Caption = #1063#1072#1089#1090#1086#1090#1072':'
      end
      object CaptionLabel_C5: TLabel
        Left = 107
        Top = 60
        Width = 58
        Height = 14
        Caption = #1054#1073#1098#1077#1084', '#1052#1073':'
      end
      object BankTypeCombo: TComboBox
        Left = 16
        Top = 28
        Width = 165
        Height = 22
        Style = csDropDownList
        ItemIndex = 2
        Sorted = True
        TabOrder = 0
        Text = 'DDR3'
        Items.Strings = (
          'DDR'
          'DDR2'
          'DDR3'
          'SO-DIMM DDR3')
      end
      object ECCSupportCheck: TCheckBox
        Left = 16
        Top = 156
        Width = 45
        Height = 17
        Caption = 'ECC'
        TabOrder = 5
      end
      object XMPSupportCheck: TCheckBox
        Left = 67
        Top = 156
        Width = 45
        Height = 17
        Caption = 'XMP'
        TabOrder = 6
      end
      object LatencyCombo: TComboBox
        Left = 16
        Top = 124
        Width = 85
        Height = 22
        Style = csDropDownList
        ItemIndex = 8
        TabOrder = 3
        Text = '9T'
        Items.Strings = (
          '2T'
          '2.5T'
          '3T'
          '4T'
          '5T'
          '6T'
          '7T'
          '8T'
          '9T'
          '10T'
          '11T'
          '12T')
      end
      object VoltageCombo: TComboBox
        Left = 107
        Top = 124
        Width = 74
        Height = 22
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 4
        Text = '1.5 '#1042
        Items.Strings = (
          '1.25 '#1042
          '1.35 '#1042
          '1.5 '#1042
          '1.7 '#1042
          '1.75 '#1042
          '1.8 '#1042
          '1.85 '#1042
          '1.9 '#1042
          '1.95 '#1042
          '2.0 '#1042
          '2.1 '#1042
          '2.2 '#1042
          '2.3 '#1042
          '2.4 '#1042
          '2.5 '#1042
          '2.6 '#1042)
      end
      object FrequencyCombo: TComboBox
        Left = 16
        Top = 76
        Width = 85
        Height = 22
        Style = csDropDownList
        DropDownCount = 12
        ItemIndex = 12
        TabOrder = 1
        Text = '1333 '#1052#1043#1094
        Items.Strings = (
          '133 '#1052#1043#1094
          '266 '#1052#1043#1094
          '333 '#1052#1043#1094
          '400 '#1052#1043#1094
          '533 '#1052#1043#1094
          '667 '#1052#1043#1094
          '800 '#1052#1043#1094
          '900 '#1052#1043#1094
          '1000 '#1052#1043#1094
          '1066 '#1052#1043#1094
          '1150 '#1052#1043#1094
          '1200 '#1052#1043#1094
          '1333 '#1052#1043#1094
          '1600 '#1052#1043#1094
          '1800 '#1052#1043#1094
          '1866 '#1052#1043#1094
          '2000 '#1052#1043#1094
          '2133 '#1052#1043#1094
          '2200 '#1052#1043#1094
          '2250 '#1052#1043#1094
          '2333 '#1052#1043#1094
          '2400 '#1052#1043#1094
          '2533 '#1052#1043#1094
          '2625 '#1052#1043#1094)
      end
      object CapacityEdit: TEdit
        Left = 107
        Top = 76
        Width = 74
        Height = 22
        NumbersOnly = True
        TabOrder = 2
        Text = '0'
      end
    end
  end
end
