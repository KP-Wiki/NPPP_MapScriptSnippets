object MSS_SnippetForm: TMSS_SnippetForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Map Script Snippets'
  ClientHeight = 667
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tcDynamicScriptType: TTabControl
    Left = 0
    Top = 0
    Width = 287
    Height = 667
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    HotTrack = True
    TabOrder = 0
    Tabs.Strings = (
      'KaM Remake'
      'Knights Province')
    TabIndex = 0
    OnChange = tcDynamicScriptTypeChange
    object tcDynamicScriptGroup: TTabControl
      Left = 4
      Top = 24
      Width = 279
      Height = 639
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      HotTrack = True
      MultiLine = True
      TabOrder = 0
      TabPosition = tpRight
      Tabs.Strings = (
        'Events'
        'Actions'
        'States'
        'Misc')
      TabIndex = 0
      OnChange = tcDynamicScriptTypeChange
    end
  end
end
