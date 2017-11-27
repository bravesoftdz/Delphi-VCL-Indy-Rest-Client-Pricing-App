object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 466
  ClientWidth = 651
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 651
    Height = 466
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Json to  CDS'
      object DBGrid1: TDBGrid
        Left = 7
        Top = 222
        Width = 633
        Height = 216
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sku'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'skusize'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'barcode'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'description'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'price'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
      object Button1: TButton
        Left = 200
        Top = 191
        Width = 137
        Height = 25
        Caption = 'Json to Clientdataset'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Memo1: TMemo
        Left = 8
        Top = 16
        Width = 633
        Height = 169
        Lines.Strings = (
          'Memo1')
        TabOrder = 2
      end
      object Button2: TButton
        Left = 359
        Top = 191
        Width = 75
        Height = 25
        Caption = 'Save to File'
        TabOrder = 3
        OnClick = Button2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'CDS to json'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = -4
        Top = 3
        Width = 633
        Height = 227
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sku'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'skusize'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'barcode'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'description'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'price'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
      object Button3: TButton
        Left = 305
        Top = 236
        Width = 224
        Height = 25
        Caption = 'Send to Json (XML -> Json) Test  Purpose'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Memo2: TMemo
        Left = 3
        Top = 278
        Width = 625
        Height = 157
        Lines.Strings = (
          'Memo2')
        TabOrder = 2
      end
      object Button4: TButton
        Left = 56
        Top = 236
        Width = 228
        Height = 25
        Caption = 'Send to Json'
        TabOrder = 3
        OnClick = Button4Click
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 200
    object ClientDataSet1id: TIntegerField
      FieldName = 'id'
    end
    object ClientDataSet1sku: TStringField
      DisplayWidth = 10
      FieldName = 'sku'
      Size = 50
    end
    object ClientDataSet1skusize: TStringField
      DisplayWidth = 15
      FieldName = 'skusize'
      Size = 50
    end
    object ClientDataSet1barcode: TStringField
      FieldName = 'barcode'
      Size = 15
    end
    object ClientDataSet1description: TStringField
      DisplayWidth = 30
      FieldName = 'description'
      Size = 120
    end
    object ClientDataSet1price: TStringField
      DisplayWidth = 15
      FieldName = 'price'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 568
    Top = 200
  end
  object ClientDataSet2: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 264
    Data = {
      AF0000009619E0BD010000001800000006000000000003000000AF0002696404
      0001000000000003736B750100490000000100055749445448020002000F0007
      736B7573697A650100490000000100055749445448020002000F000762617263
      6F64650100490000000100055749445448020002000F000B6465736372697074
      696F6E0100490000000100055749445448020002001E00057072696365010049
      0000000100055749445448020002000F000000}
    object ClientDataSet2id: TIntegerField
      FieldName = 'id'
    end
    object ClientDataSet2sku: TStringField
      DisplayWidth = 8
      FieldName = 'sku'
      Size = 15
    end
    object ClientDataSet2skusize: TStringField
      DisplayWidth = 10
      FieldName = 'skusize'
      Size = 15
    end
    object ClientDataSet2barcode: TStringField
      FieldName = 'barcode'
      Size = 15
    end
    object ClientDataSet2description: TStringField
      FieldName = 'description'
      Size = 30
    end
    object ClientDataSet2price: TStringField
      FieldName = 'price'
      Size = 15
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 568
    Top = 264
  end
end
