object fmmain: Tfmmain
  Left = 0
  Top = 0
  Caption = 'Client Rest Example - Bayesean Blog'
  ClientHeight = 498
  ClientWidth = 634
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
    Top = 85
    Width = 634
    Height = 413
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'App (db) Table'
      ImageIndex = 1
      object getwebserverdatabtn: TSpeedButton
        Left = 425
        Top = 0
        Width = 100
        Height = 50
        Caption = 'Get  (WebServer)'
        OnClick = getwebserverdatabtnClick
      end
      object Postwebserverbtn: TSpeedButton
        Left = 523
        Top = 0
        Width = 100
        Height = 50
        Caption = 'Post (Web/Server)'
        OnClick = PostwebserverbtnClick
      end
      object Insertbtn: TSpeedButton
        Left = -5
        Top = 0
        Width = 100
        Height = 50
        Caption = 'Insert(DataBase)'
        OnClick = InsertbtnClick
      end
      object savetodbbtn: TSpeedButton
        Left = 199
        Top = 0
        Width = 100
        Height = 50
        Caption = 'Save to DataBase'
        OnClick = savetodbbtnClick
      end
      object refreshbtn: TSpeedButton
        Left = 101
        Top = 0
        Width = 100
        Height = 50
        Caption = 'Refresh '
        OnClick = refreshbtnClick
      end
      object DBGrid2: TDBGrid
        Left = 1
        Top = 69
        Width = 622
        Height = 313
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid2DrawColumnCell
        OnEditButtonClick = DBGrid2EditButtonClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Width = 39
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sku'
            Title.Alignment = taCenter
            Width = 92
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
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'description'
            Title.Alignment = taCenter
            Width = 140
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'price'
            Title.Alignment = taCenter
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            ButtonStyle = cbsEllipsis
            Expanded = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Edit'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Edit'
            Width = 20
            Visible = True
          end
          item
            Alignment = taCenter
            ButtonStyle = cbsEllipsis
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Del'
            Width = 20
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Webserver (data) table'
      object btngetweb: TSpeedButton
        Left = 3
        Top = 3
        Width = 100
        Height = 50
        Hint = 'Get the Data from the Web API'
        Caption = 'Refresh -Webdata'
        ParentShowHint = False
        ShowHint = True
        OnClick = btngetwebClick
      end
      object Label3: TLabel
        Left = 144
        Top = 3
        Width = 352
        Height = 29
        Caption = 'View Web Server Price List Data '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 109
        Top = 37
        Width = 483
        Height = 13
        Caption = 
          'View Live Table of Data - http://www.bayeseanblog.com/blog/publi' +
          'c/demo/salesrest/public/view.php'
        Color = clDefault
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnClick = Label4Click
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 56
        Width = 620
        Height = 326
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'barcode'
            Title.Alignment = taCenter
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'description'
            Title.Alignment = taCenter
            Width = 192
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
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 85
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 51
      Top = 8
      Width = 507
      Height = 35
      Caption = 'Client Website Price List Update Module'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 53
      Top = 49
      Width = 485
      Height = 13
      Alignment = taCenter
      Caption = 
        'Note: Update to DB -  Saves the Data to a text file. Use '#39'SaveTo' +
        'Stream method to post to a local DB.'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 192
      Top = 67
      Width = 235
      Height = 13
      Caption = 'Bayesean Blog - https://www.bayeseanblog.com'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Label5Click
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
    Left = 496
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
