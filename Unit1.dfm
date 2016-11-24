object Form1: TForm1
  Left = 199
  Top = 117
  Width = 1127
  Height = 578
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 64
    Top = 24
    Width = 977
    Height = 457
    ColCount = 15
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 264
    Top = 488
    Width = 177
    Height = 33
    Caption = #1057#1075#1077#1085#1088#1080#1088#1086#1074#1072#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1099#1077' '#1095#1080#1089#1083#1072
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 448
    Top = 488
    Width = 177
    Height = 33
    Caption = #1053#1072#1095#1072#1090#1100' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1091
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 632
    Top = 488
    Width = 177
    Height = 33
    Caption = #1058#1077#1089#1090
    TabOrder = 3
    OnClick = Button3Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 816
    Top = 488
  end
end
