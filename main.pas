unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.ComCtrls ,Superobject;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1id: TIntegerField;
    ClientDataSet1sku: TStringField;
    ClientDataSet1skusize: TStringField;
    ClientDataSet1description: TStringField;
    ClientDataSet1price: TStringField;
    ClientDataSet1barcode: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Memo1: TMemo;
    DBGrid2: TDBGrid;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    Button2: TButton;
    Button3: TButton;
    ClientDataSet2id: TIntegerField;
    ClientDataSet2sku: TStringField;
    ClientDataSet2skusize: TStringField;
    ClientDataSet2barcode: TStringField;
    ClientDataSet2description: TStringField;
    ClientDataSet2price: TStringField;
    Memo2: TMemo;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses JsonDataSetConverter,superxmlparser;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Clientdataset1.CreateDataSet;
  UnMarshalToDataSet(Clientdataset1,memo1.text)
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    Clientdataset1.SaveToFile('D:\Delphi\Final Working Rest\CLientjasontocds\Json.txt');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   memo2.Text:= DatasetXMLtoJSon(ClientDataset2);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   memo2.Text:=  ClientDataSetToJSON(ClientDataset2);
end;

{procedure TForm1.Button5Click(Sender: TObject);
Var
jsonA:TSuperArray;
begin
  JsonToClientDataSet(jsonA,ClientDataset1);
end; }

procedure TForm1.FormShow(Sender: TObject);
begin
   memo1.Lines.LoadFromFile('D:\Delphi\Final Working Rest\CLientjasontocds\Json encoded text.txt');
   clientdataset2.loadfromfile('D:\Delphi\Final Working Rest\CLientjasontocds\Json.txt');
   end;

end.
