object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 505
  ClientWidth = 1033
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 85
    Width = 96
    Height = 21
    Caption = 'Snippet Code:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 528
    Top = 85
    Width = 95
    Height = 21
    Caption = 'JSON Output:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 20
    Width = 75
    Height = 17
    Caption = 'Snippet Title:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 54
    Width = 88
    Height = 17
    Caption = 'Snippet Group:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object memoSnippet: TMemo
    Left = 8
    Top = 112
    Width = 497
    Height = 385
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'procedure aProc(aVar: string);'
      'var'
      '  aStr: string;'
      'begin'
      '  aStr := aVar + '#39' - Hello World'#39';'
      'end;')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object memoJson: TMemo
    Left = 528
    Top = 112
    Width = 497
    Height = 385
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object edtTitle: TEdit
    Left = 110
    Top = 20
    Width = 224
    Height = 21
    TabOrder = 2
    Text = 'aProc'
  end
  object btnCook: TButton
    Left = 472
    Top = 50
    Width = 89
    Height = 29
    Caption = '<< Cook >>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnCookClick
  end
  object cbGroup: TComboBox
    Left = 110
    Top = 54
    Width = 107
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 4
    Text = 'Events'
    Items.Strings = (
      'Events'
      'Actions'
      'States'
      'Misc')
  end
end
