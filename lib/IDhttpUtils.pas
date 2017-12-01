unit IDhttpUtils;

interface
uses
 System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,IdHTTP, IdGlobal,IdGlobalProtocols, Vcl.StdCtrls;

 type
 TIdHTTP = class(IdHttp.TIdCustomHttp)
  public
      function Delete(AURL: string
      {$IFDEF STRING_IS_ANSI}; ADestEncoding: IIdTextEncoding = nil{$ENDIF}
      ): string; overload;
  procedure Delete(AURL: string; AResponseContent: TStream); overload;
 end;

implementation

 procedure TIDHTTP.Delete(AURL: string; AResponseContent: TStream);
begin
  DoRequest(Id_HTTPMethodDelete, AURL, nil, AResponseContent, []);
end;

function TIdHTTP.Delete(AURL: string
  {$IFDEF STRING_IS_ANSI}; ADestEncoding: IIdTextEncoding = nil{$ENDIF}
  ): string;
var
  LStream: TMemoryStream;
begin
  LStream := TMemoryStream.Create;
  try
    DoRequest(Id_HTTPMethodDelete, AURL, nil, LStream, []);
    LStream.Position := 0;
    Result := ReadStringAsCharset(LStream, Response.Charset{$IFDEF STRING_IS_ANSI}, ADestEncoding{$ENDIF});

  finally
    FreeAndNil(LStream);
  end;
end;

          end.

