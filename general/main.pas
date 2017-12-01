unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.ComCtrls, Superobject,
  Vcl.Buttons, IdHTTP, IdGlobal, Vcl.ExtCtrls, MidasLib, IDException, IDstack,
  ShellApi;

type
  Tfmmain = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1id: TIntegerField;
    ClientDataSet1sku: TStringField;
    ClientDataSet1skusize: TStringField;
    ClientDataSet1description: TStringField;
    ClientDataSet1price: TStringField;
    ClientDataSet1barcode: TStringField;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    ClientDataSet2id: TIntegerField;
    ClientDataSet2sku: TStringField;
    ClientDataSet2skusize: TStringField;
    ClientDataSet2barcode: TStringField;
    ClientDataSet2description: TStringField;
    ClientDataSet2price: TStringField;
    btngetweb: TSpeedButton;
    getwebserverdatabtn: TSpeedButton;
    Postwebserverbtn: TSpeedButton;
    Insertbtn: TSpeedButton;
    savetodbbtn: TSpeedButton;
    refreshbtn: TSpeedButton;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);

    procedure InsertbtnClick(Sender: TObject);
    procedure PostwebserverbtnClick(Sender: TObject);
    procedure getwebserverdatabtnClick(Sender: TObject);
    procedure refreshbtnClick(Sender: TObject);
    procedure btngetwebClick(Sender: TObject);
    procedure savetodbbtnClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure DBGrid2EditButtonClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure GetfromWebAPI(cds: TClientDataSet; Messages: boolean = true);
    procedure PosttoWebAPI(smessage: boolean = true; action: boolean = true);
  public
    procedure LoadfromsimulatedDB;
    procedure SavetosimulatedDB;
    function getDBpath: string;
  end;

var

  fmmain: Tfmmain;

implementation

uses IDhttpUtils, JsonDataSetConverter, superxmlparser, newitem, edititem,
  deleteitem;

{$R *.dfm}

procedure Tfmmain.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  bmpimage: tbitmap;
  bmpimage1: tbitmap;
  image: Timage;
  image1: Timage;
begin
  if DBGrid2.datasource.Dataset.recno > 0 then
    if DataCol = 6 then
      with DBGrid2.Canvas do
      begin
        fillrect(Rect);
        try
          bmpimage := tbitmap.Create;
          image := Timage.Create(fmmain);
          image.picture.LoadFromFile(getDBpath + 'edit.bmp');
          bmpimage.Assign(image.picture.bitmap);
          draw(Rect.Left, Rect.Top, bmpimage);
        finally
          bmpimage.Free;
          image.Free;
        end;
      end;

  if DBGrid2.datasource.Dataset.recno > 0 then
    if DataCol = 7 then
      with DBGrid2.Canvas do
      begin
        fillrect(Rect);
        try
          bmpimage1 := tbitmap.Create;
          image1 := Timage.Create(fmmain);
          image1.picture.LoadFromFile(getDBpath + 'delete.bmp');
          bmpimage1.Assign(image1.picture.bitmap);
          draw(Rect.Left, Rect.Top, bmpimage1);
        finally
          image1.Free;
          bmpimage1.Free;
        end;
      end;
end;

procedure Tfmmain.DBGrid2EditButtonClick(Sender: TObject);
begin
  if (DBGrid2.SelectedIndex = 6) then
    fmedititem.Show;
  if (DBGrid2.SelectedIndex = 7) then
    fmdeleteitem.Show;
end;

procedure Tfmmain.btngetwebClick(Sender: TObject);
begin
  GetfromWebAPI(ClientDataSet2, true);
end;

procedure Tfmmain.FormShow(Sender: TObject);
begin
 loadfromsimulatedDB;
end;

function Tfmmain.getDBpath: string;
begin
  result := ExtractFilepath(Paramstr(0));
end;

procedure Tfmmain.Label4Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'http://www.bayeseanblog.com/blog/public/demo/salesrest/public/view.php';
  ShellExecute(0, 'open', Pchar(URL), nil, nil, SW_MAXIMIZE);
end;

procedure Tfmmain.Label5Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://www.bayeseanblog.com';
  ShellExecute(0, 'open', Pchar(URL), nil, nil, SW_MAXIMIZE);
end;

procedure Tfmmain.LoadfromsimulatedDB;
begin
  { Load file simulating a DB }
  ClientDataSet1.LoadFromFile(getDBpath + 'Json.txt');
  { The Fieldindex saved may not always be the same index so we recreate
    the indexes on load }
  { First checks to see if there are indexed fields and clear any
    indexed fields in the clientdataset }
  if fmmain.ClientDataSet1.IndexDefs.Count > 0 then
    fmmain.ClientDataSet1.IndexDefs.Clear;
  { Set up a unique id for the inserted fields  - adds and sorts the data
    Ascending by id if the Json data is in a different order. }
  with fmmain.ClientDataSet1.IndexDefs.AddIndexDef do
  begin
    Name := 'isIdx';
    Fields := 'id';
    Options := [ixUnique, ixCaseInsensitive];
  end;
  fmmain.ClientDataSet1.indexname := 'isIdx';
end;

procedure Tfmmain.PosttoWebAPI(smessage: boolean = true;
  action: boolean = true);
var
  jsontoweb: string;
  jsonresponse: string;
  http: TIDHttp;
begin
  if action then
    if MessageDlg('This will Refresh Data from the Web?', mtConfirmation,
      [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      http := TIDHttp.Create(nil);
      try
        try
          http.HandleRedirects := true;
          http.ReadTimeout := 5000;
          http.MaxAuthRetries := 0;
          http.HTTPOptions := [hoKeepOrigProtocol];
          { for using Header Authorization
            // http.HTTPOptions := [hoInProcessAuth];
            // Http.Request.CustomHeaders.Clear;
            // Http.Request.CustomHeaders.AddStrings('');
            // http.Request.BasicAuthentication := true;
            // Http.Request.Username := '';
            // Http.Request.Password := ''; }
          http.Request.Accept := 'http';
          http.Request.ContentType := 'application/json';
          // Superobject convert jsontoDataset
          if not(ClientDataSet1.Active) then
            fmmain.ClientDataSet1.CreateDataSet;
          jsontoweb := ClientDataSetToJSON(ClientDataSet1);
          Showmessage(jsontoweb);
          // need to have delete/all in API for this to work and clear the id to 1
          jsonresponse :=
            http.Post(
            'http://www.bayeseanblog.com/blog/public/demo/salesrest/public/api/pricing/add',
            jsontoweb);
          if smessage then
            Showmessage('jsonresponse');
        except
          on E: EIdHTTPProtocolException do
            Showmessage
              ('Could not Connect to the Internet - Connection error!');
          // connection with a client in a "peaceful" way
          on E: EIdConnClosedGracefully do
            Showmessage
              ('Could not connect to the Internet - Connection was closed gracefully!');
          // this exception class covers all the low level socket exceptions
          on E: EIdSocketError do
            Showmessage
              ('Could not Connect to the Internet - Connection socket error!');
          // this exception class covers all exceptions thrown by Indy library
          on E: EIdException do
            Showmessage
              ('Could not connect to the Internet - Connection error exception!');
          // all exceptions different from those listed above
          on E: Exception do
            Showmessage('Unable to connect to the Internet!');
        end;
      finally
        begin
          http.Free;
          jsontoweb := '';
        end;
      end;
    end;
end;

procedure Tfmmain.GetfromWebAPI(cds: TClientDataSet; Messages: boolean = true);
var
  E: Exception;
  jsonfromweb: string;
  http: TIDHttp;
  code: Integer;
begin
  begin
    if Messages then
    begin
      if MessageDlg('Do you wish to Refresh Data from the Web?', mtConfirmation,
        [mbYes, mbNo], 0, mbYes) = mrYes then
    end;
    begin
      http := TIDHttp.Create(nil);
      try
        try
          http.HandleRedirects := true;
          http.ReadTimeout := 5000;
          http.MaxAuthRetries := 0;
          http.HTTPOptions := [hoKeepOrigProtocol];
          { for using Header Authorization
            // http.HTTPOptions := [hoInProcessAuth];
            // Http.Request.CustomHeaders.Clear;
            // Http.Request.CustomHeaders.AddStrings('');
            //http.Request.BasicAuthentication := true;
            // Http.Request.Username := '';
            // Http.Request.Password := ''; }
          http.Request.Accept := 'http';
          http.Request.ContentType := 'application/json';
          jsonfromweb :=
            http.Get('http://www.bayeseanblog.com/blog/public/demo/salesrest/public/api/pricing');
        except
          on E: EIdHTTPProtocolException do
            Showmessage
              ('Could not Connect to the Internet - Connection error!');
          // connection with a client in a "peaceful" way
          on E: EIdConnClosedGracefully do
            Showmessage
              ('Could not connect to the Internet - Connection was closed gracefully!');
          // this exception class covers all the low level socket exceptions
          on E: EIdSocketError do
            Showmessage
              ('Could not Connect to the Internet - Connection socket error!');
          // this exception class covers all exceptions thrown by Indy library
          on E: EIdException do
            Showmessage
              ('Could not connect to the Internet - Connection error exception!');
          // all exceptions different from those listed above
          on E: Exception do
            Showmessage('Unable to connect to the Internet!');
        end;
      finally
        begin
          if Messages then
          begin
            Showmessage('This shows the incoming Json Data' + #10#13 + #10#13 +
              jsonfromweb);
          end;
          if not(cds.Active) then
            cds.CreateDataSet;
          { First checks to see if there are indexed fields  and clear any
            indexed fields in the clientdataset }
          if cds.IndexDefs.Count > 0 then
            cds.IndexDefs.Clear;
          { Empty the  dataset to repalce the data. }
          cds.DisableControls;
          cds.EmptyDataSet;
          cds.EnableControls;
          { Set up a unique id for the inserted fields  - adds and sorts the data
            Ascending by id if the Json data is in a different order. }
          with cds.IndexDefs.AddIndexDef do
          begin
            Name := 'idIdx';
            Fields := 'id';
            Options := [ixUnique, ixCaseInsensitive];
          end;
          cds.indexname := 'idIdx';
         // Use the superobject to convert jsontoDataset
          UnMarshalToDataSet(cds, jsonfromweb);
          http.Free;
          jsonfromweb := '';
        end;
      end;
    end;
  end;
end;

procedure Tfmmain.SavetosimulatedDB;
begin
  ClientDataSet1.SaveToFile(getDBpath + 'Json.txt');
end;

procedure Tfmmain.savetodbbtnClick(Sender: TObject);
begin
  SavetosimulatedDB;
  LoadfromsimulatedDB;
end;

procedure Tfmmain.getwebserverdatabtnClick(Sender: TObject);
begin
  GetfromWebAPI(ClientDataSet1, true);
end;

procedure Tfmmain.refreshbtnClick(Sender: TObject);
begin
  LoadfromsimulatedDB;
end;

procedure Tfmmain.PostwebserverbtnClick(Sender: TObject);
var
  http: TIDHttp;
  response: string;
  jsonresponse: string;
  jsontoweb: Tstream;
begin
  // save to simulated DB before sending Post data
  SavetosimulatedDB;
  LoadfromsimulatedDB;
  begin
    http := TIDHttp.Create(nil);
    http.HandleRedirects := true;
    http.ReadTimeout := 5000;
    http.MaxAuthRetries := 0;
    http.HTTPOptions := [hoKeepOrigProtocol];
    { for using Header Authorization
      //Http.HTTPOptions := [hoInProcessAuth];
      // Http.Request.CustomHeaders.Clear;
      // Http.Request.CustomHeaders.AddStrings('');
      //http.Request.BasicAuthentication := true;
      // Http.Request.Username := '';
      // Http.Request.Password := ''; }
    http.Request.Accept := 'http';
    http.Request.ContentType := 'application/json';
    try
      // need to have delete/all in API for this to work and clear the id's
      response := http.Delete
        ('http://www.bayeseanblog.com/blog/public/demo/salesrest/public/api/pricing/delete/0');
      // Showmessage(response);
    except
      on E: EIdHTTPProtocolException do
        Showmessage('Could not Connect to the Internet - Connection error!');
      // connection with a client in a "peaceful" way
      on E: EIdConnClosedGracefully do
        Showmessage
          ('Could not connect to the Internet - Connection was closed gracefully!');
      // this exception class covers all the low level socket exceptions
      on E: EIdSocketError do
        Showmessage
          ('Could not Connect to the Internet - Connection socket error!');
      // this exception class covers all exceptions thrown by Indy library
      on E: EIdException do
        Showmessage
          ('Could not connect to the Internet - Connection error exception!');
      // all exceptions different from those listed above
      on E: Exception do
        Showmessage('Unable to connect to the Internet!');
    end;

    response := '';
    if not(ClientDataSet1.Active) then
      fmmain.ClientDataSet1.CreateDataSet;
    jsontoweb := TStringStream.Create(ClientDataSetToJSON(ClientDataSet1),
      System.SysUtils.TEncoding.UTF8);
    try
      // sends all data to rest api
      jsonresponse :=
        http.Post(
        'http://www.bayeseanblog.com/blog/public/demo/salesrest/public/api/pricing/add/all',
        jsontoweb);
    except
      on E: EIdHTTPProtocolException do
        Showmessage('Could not Connect to the Internet - Connection error!');
      // connection with a client in a "peaceful" way
      on E: EIdConnClosedGracefully do
        Showmessage
          ('Could not connect to the Internet - Connection was closed gracefully!');
      // this exception class covers all the low level socket exceptions
      on E: EIdSocketError do
        Showmessage
          ('Could not Connect to the Internet - Connection socket error!');
      // this exception class covers all exceptions thrown by Indy library
      on E: EIdException do
        Showmessage
          ('Could not connect to the Internet - Connection error exception!');
      // all exceptions different from those listed above
      on E: Exception do
        Showmessage('Unable to connect to the Internet!');
    end;
    Showmessage('Webserver has been updated');
  end;
  http.Free;
  jsonresponse := '';
end;

procedure Tfmmain.InsertbtnClick(Sender: TObject);
begin
  fmnewitem.Show;
end;

end.
