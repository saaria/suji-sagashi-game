object AboutBox: TAboutBox
  Left = 212
  Top = 429
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #12496#12540#12472#12519#12531#24773#22577
  ClientHeight = 205
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 177
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object ProgramIcon: TImage
      Left = 8
      Top = 8
      Width = 65
      Height = 57
      Picture.Data = {
        07544269746D617076020000424D760200000000000076000000280000002000
        0000200000000100040000000000000200000000000000000000100000000000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00000000000000000000000000000000000EE8787878EEEEEEE03F30878EEE
        EEE00EE8787878EEEEEEE03F30878EEEEEE00EE8787878EEEEEEE03F30878EEE
        EEE00EE8787878EEEEEEE03F30878EEEEEE00887787877788888803F3088787E
        EEE00788787878878887803F3088887EEEE00788887888878887803F3088887E
        EEE00877888887788888703F308887EEEEE00888777778888888037883088888
        8EE007777777777777703787883087777EE00888888888888803787FF8830888
        888008888888888880378777778830888880077777777788037873F3F3F87808
        88E00888888888803787FFFFFFFF8830EEE00887777778800001111111111100
        EEE00888888888888899B999B99999EEEEE00888888888888899B9B99BB9B9EE
        EEE0088888888888899BB9BB99BB99EEEEE0078888888888899B999B999999EE
        EEE0087788888778899B9B9BB9BB99EEEEE00888778778888E9B9B9BB9999EEE
        EEE0088888788888EE9B99B9BB9BEEEEEEE00EE8888888EEEEE999B9999EEEEE
        EEE00EEEE888EEEEEEEE99BB999EEEEEEEE00EEEEE8EEEEEEEEEE999B9EEEEEE
        EEE00EEEEE8EEEEEEEEEEEE999EEEEEEEEE00EEEEE8EEEEEEEEEEEEE99EEEEEE
        EEE00EEEEE8EEEEEEEEEEEEE9EEEEEEEEEE00EEEEE8EEEEEEEEEEEEEEEEEEEEE
        EEE00EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE00000000000000000000000000000
        0000}
      Stretch = True
      IsControl = True
    end
    object ProductName: TLabel
      Left = 88
      Top = 16
      Width = 71
      Height = 12
      Caption = 'THE '#25968#23383#25506#12375
      IsControl = True
    end
    object Version: TLabel
      Left = 88
      Top = 40
      Width = 42
      Height = 12
      Caption = 'Ver 2.00'
      IsControl = True
    end
    object Copyright: TLabel
      Left = 8
      Top = 72
      Width = 132
      Height = 12
      Caption = 'Program'#65306'C-Style - FSDR'
      IsControl = True
    end
    object Label1: TLabel
      Left = 56
      Top = 86
      Width = 160
      Height = 12
      Cursor = crHandPoint
      Caption = 'http://cstyle.client.jp/index.htm'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 104
      Width = 97
      Height = 12
      Caption = 'Music'#65306'Fra'#39's Forum'
    end
    object Label3: TLabel
      Left = 8
      Top = 136
      Width = 115
      Height = 12
      Caption = 'Sound'#65306#38646#24335#12510#12486#12522#12450#12523
    end
    object Label4: TLabel
      Left = 45
      Top = 117
      Width = 192
      Height = 12
      Caption = 'http://francois.parfait.ne.jp/index.html'
    end
    object Label5: TLabel
      Left = 46
      Top = 149
      Width = 149
      Height = 12
      Caption = 'http://www.zero-matter.com/'
    end
  end
  object OKButton: TButton
    Left = 103
    Top = 180
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKButtonClick
  end
end
