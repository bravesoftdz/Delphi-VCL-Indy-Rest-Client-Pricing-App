object fmnewitem: Tfmnewitem
  Left = 0
  Top = 0
  Caption = 'Client Rest Example - Bayesean Blog'
  ClientHeight = 245
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 19
    Height = 13
    Caption = 'SKU'
  end
  object Label2: TLabel
    Left = 22
    Top = 75
    Width = 41
    Height = 13
    Caption = 'SKU Size'
  end
  object Label3: TLabel
    Left = 22
    Top = 103
    Width = 39
    Height = 13
    Caption = 'Barcode'
  end
  object Label4: TLabel
    Left = 22
    Top = 129
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label5: TLabel
    Left = 24
    Top = 156
    Width = 23
    Height = 13
    Caption = 'Price'
  end
  object Label6: TLabel
    Left = 22
    Top = 8
    Width = 142
    Height = 23
    Caption = 'Create New Item'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 104
    Top = 190
    Width = 121
    Height = 33
    Caption = 'Post (Create)'
    OnClick = SpeedButton1Click
  end
  object Edit1: TEdit
    Left = 104
    Top = 45
    Width = 89
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 104
    Top = 72
    Width = 89
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 104
    Top = 99
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 104
    Top = 126
    Width = 303
    Height = 21
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 104
    Top = 153
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Button1: TButton
    Left = 264
    Top = 190
    Width = 75
    Height = 33
    Caption = 'Close'
    TabOrder = 5
    OnClick = Button1Click
  end
end
