unit edititem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,IdHTTP, IdGlobal, Vcl.StdCtrls, Vcl.Buttons;

type
  Tfmedititem = class(TForm)
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
  fmedititem: Tfmedititem;

implementation
uses main;

{$R *.dfm}

procedure Tfmedititem.Button1Click(Sender: TObject);
begin
 fmedititem.close;
 end;

procedure Tfmedititem.FormShow(Sender: TObject);
begin
edit6.Text:= fmmain.ClientDataSet1.FieldByName('id').AsString;
edit1.Text:=  fmmain.ClientDataSet1.FieldByName('sku').AsString;
edit2.Text:=  fmmain.ClientDataSet1.FieldByName('skusize').AsString;
edit3.Text:=  fmmain.ClientDataSet1.FieldByName('barcode').AsString;
edit4.Text:=  fmmain.ClientDataSet1.FieldByName('description').AsString;
edit5.Text:=  fmmain.ClientDataSet1.FieldByName('price').AsString;
end;

procedure Tfmedititem.SpeedButton1Click(Sender: TObject);
var
 id:string;
begin
   fmmain.ClientDataSet1.edit;
   fmmain.Clientdataset1.FieldByName('sku').asstring:= edit1.text;
   fmmain.Clientdataset1.FieldByName('skusize').asstring:=edit2.text;
   fmmain.Clientdataset1.FieldByName('barcode').asstring:=edit3.text;
   fmmain.Clientdataset1.FieldByName('description').asstring:= edit4.text;
   fmmain.Clientdataset1.FieldByName('price').asstring:= edit5.text;
   fmmain.Clientdataset1.post;

   //simulate saving the data to database
   fmmain.SavetosimulatedDB;
   fmmain.LoadfromsimulatedDB;
    fmedititem.Close;
end;
end.



