unit deleteitem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, IdHTTP, IdGlobal,Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons;

type
  Tfmdeleteitem = class(TForm)
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit6: TEdit;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmdeleteitem: Tfmdeleteitem;

implementation
uses main,IDhttpUtils;

{$R *.dfm}

procedure Tfmdeleteitem.Button1Click(Sender: TObject);
begin
fmdeleteitem.close;
end;

procedure Tfmdeleteitem.FormShow(Sender: TObject);
begin
  edit6.Text:= fmmain.ClientDataSet1.FieldByName('id').AsString;
edit1.Text:=  fmmain.ClientDataSet1.FieldByName('sku').AsString;
edit2.Text:=  fmmain.ClientDataSet1.FieldByName('skusize').AsString;
edit3.Text:=  fmmain.ClientDataSet1.FieldByName('barcode').AsString;
edit4.Text:=  fmmain.ClientDataSet1.FieldByName('description').AsString;
edit5.Text:=  fmmain.ClientDataSet1.FieldByName('price').AsString;
end;

procedure Tfmdeleteitem.SpeedButton1Click(Sender: TObject);
var
jsontosend:TStream;
 http:TIDHttp;
dtojson:string;
 id:string;
begin
  fmmain.Clientdataset1.delete;

  //simulate saving the data to database
   fmmain.SavetosimulatedDB;
   fmmain.LoadfromsimulatedDB;

 fmdeleteitem.Close;
end;


end.
