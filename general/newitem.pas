unit newitem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, db,Vcl.Dialogs, IdHTTP, IdGlobal,Vcl.StdCtrls, Vcl.Buttons,Superobject;

type
  Tfmnewitem = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmnewitem: Tfmnewitem;

implementation
uses main;

{$R *.dfm}

procedure Tfmnewitem.Button1Click(Sender: TObject);
begin
    fmnewitem.Close;
end;

procedure Tfmnewitem.SpeedButton1Click(Sender: TObject);
var
newrec:integer;
begin
   fmmain.ClientDataSet1.Last;
   newrec:= fmmain.ClientDataSet1.Fieldbyname('id').asinteger;
   fmmain.ClientDataSet1.Append;
   fmmain.Clientdataset1.FieldByName('id').asstring:= inttostr(newrec+1);
   fmmain.ClientDataSet1.FieldByName('sku').asstring:= edit1.text;
   fmmain.ClientDataSet1.FieldByName('skusize').asstring:=edit2.text;
   fmmain.ClientDataSet1.FieldByName('barcode').asstring:=edit3.text;
   fmmain.ClientDataSet1.FieldByName('description').asstring:= edit4.text;
   fmmain.ClientDataSet1.FieldByName('price').asstring:= edit5.text;
   fmmain.ClientDataSet1.post;
   //simulate saving the data to database
   fmmain.SavetosimulatedDB;
   fmmain.LoadfromsimulatedDB;

   fmnewitem.Close;
end;
end.
