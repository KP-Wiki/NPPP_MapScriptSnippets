object MSS_AboutFrm: TMSS_AboutFrm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'About Dynamic Scripting Snips'
  ClientHeight = 184
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    432
    184)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 416
    Height = 25
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'About Map Script Snippets'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 635
  end
  object Bevel1: TBevel
    Left = 8
    Top = 39
    Width = 416
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
    ExplicitWidth = 635
  end
  object Label2: TLabel
    Left = 16
    Top = 54
    Width = 73
    Height = 13
    Caption = 'Development:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 73
    Width = 113
    Height = 13
    Caption = 'Thimo Braker (thibmo)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 102
    Width = 50
    Height = 13
    Caption = '3rd Party:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 40
    Top = 121
    Width = 44
    Height = 13
    Caption = 'DFPN++'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 40
    Top = 140
    Width = 104
    Height = 13
    Caption = 'Super Object Toolkit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 177
    Top = 121
    Width = 99
    Height = 13
    Caption = 'Bastian Blumentritt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 150
    Top = 121
    Width = 21
    Height = 13
    Caption = '-by-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 177
    Top = 140
    Width = 77
    Height = 13
    Caption = 'Henri Gourvest'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 150
    Top = 140
    Width = 21
    Height = 13
    Caption = '-by-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 203
    Top = 54
    Width = 79
    Height = 13
    Caption = 'Special Thanks:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 227
    Top = 73
    Width = 170
    Height = 13
    Caption = 'All the developers of KMR and KP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnClose: TButton
    Left = 345
    Top = 151
    Width = 79
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Close'
    ModalResult = 1
    TabOrder = 0
    OnClick = btnCloseClick
  end
end
