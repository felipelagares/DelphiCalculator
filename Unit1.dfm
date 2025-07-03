object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 339
  ClientWidth = 228
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 53
    Height = 15
    Caption = 'Numero 1'
  end
  object Label2: TLabel
    Left = 24
    Top = 96
    Width = 53
    Height = 15
    Caption = 'Numero 2'
  end
  object Label3: TLabel
    Left = 24
    Top = 184
    Width = 52
    Height = 15
    Caption = 'Resultado'
    Enabled = False
  end
  object txtNum1: TEdit
    Left = 24
    Top = 61
    Width = 177
    Height = 23
    TabOrder = 0
    OnChange = txtNum1Change
  end
  object txtNum2: TEdit
    Left = 24
    Top = 117
    Width = 177
    Height = 23
    TabOrder = 1
    OnChange = txtNum1Change
  end
  object btAdit: TButton
    Left = 24
    Top = 146
    Width = 33
    Height = 31
    Caption = '+'
    Enabled = False
    TabOrder = 2
    OnClick = btAditClick
  end
  object btSubt: TButton
    Left = 71
    Top = 146
    Width = 31
    Height = 31
    Caption = '-'
    Enabled = False
    TabOrder = 3
    OnClick = btSubtClick
  end
  object btMult: TButton
    Left = 120
    Top = 146
    Width = 33
    Height = 33
    Caption = '*'
    Enabled = False
    TabOrder = 4
    OnClick = btMultClick
  end
  object btDiv: TButton
    Left = 167
    Top = 146
    Width = 32
    Height = 33
    Caption = '/'
    Enabled = False
    TabOrder = 5
    OnClick = btDivClick
  end
  object txtResult: TEdit
    Left = 24
    Top = 205
    Width = 177
    Height = 23
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
  object optApearence: TRadioGroup
    Left = 23
    Top = 234
    Width = 176
    Height = 87
    Caption = 'Apar'#234'ncia'
    ItemIndex = 1
    Items.Strings = (
      'Windows'
      'Glow')
    TabOrder = 7
    OnClick = optApearenceClick
  end
end
