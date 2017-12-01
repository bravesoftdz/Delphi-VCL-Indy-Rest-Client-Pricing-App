object fmedititem: Tfmedititem
  Left = 0
  Top = 0
  Caption = 'Client Rest Example - Bayesean Blog'
  ClientHeight = 242
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 24
    Top = 8
    Width = 77
    Height = 23
    Caption = 'Edit Item'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 136
    Top = 198
    Width = 121
    Height = 33
    Caption = 'Update '
    OnClick = SpeedButton1Click
  end
  object Label5: TLabel
    Left = 56
    Top = 156
    Width = 23
    Height = 13
    Caption = 'Price'
  end
  object Label4: TLabel
    Left = 54
    Top = 129
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label3: TLabel
    Left = 54
    Top = 103
    Width = 39
    Height = 13
    Caption = 'Barcode'
  end
  object Label2: TLabel
    Left = 54
    Top = 75
    Width = 41
    Height = 13
    Caption = 'SKU Size'
  end
  object Label1: TLabel
    Left = 56
    Top = 48
    Width = 19
    Height = 13
    Caption = 'SKU'
  end
  object Edit5: TEdit
    Left = 136
    Top = 153
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'enter price'
  end
  object Edit4: TEdit
    Left = 136
    Top = 126
    Width = 274
    Height = 21
    TabOrder = 1
    Text = 'enter description'
  end
  object Edit3: TEdit
    Left = 136
    Top = 99
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'enter barcode'
  end
  object Edit2: TEdit
    Left = 136
    Top = 72
    Width = 89
    Height = 21
    TabOrder = 3
    Text = 'enter sku size'
  end
  object Edit1: TEdit
    Left = 136
    Top = 45
    Width = 89
    Height = 21
    TabOrder = 4
    Text = 'enter sku'
  end
  object Edit6: TEdit
    Left = 136
    Top = 18
    Width = 57
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = 'Edit6'
  end
  object Button1: TButton
    Left = 263
    Top = 198
    Width = 75
    Height = 33
    Caption = 'Close'
    TabOrder = 6
    OnClick = Button1Click
  end
end
