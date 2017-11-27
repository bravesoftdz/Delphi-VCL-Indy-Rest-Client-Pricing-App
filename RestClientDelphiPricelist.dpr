program RestClientDelphiPricelist;

uses
  Vcl.Forms,
  JsonDataSetConverter in 'lib\JsonDataSetConverter.pas',
  superdate in 'superobject\superdate.pas',
  superobject in 'superobject\superobject.pas',
  supertimezone in 'superobject\supertimezone.pas',
  supertypes in 'superobject\supertypes.pas',
  superxmlparser in 'superobject\superxmlparser.pas',
  IDhttpUtils in 'lib\IDhttpUtils.pas',
  deleteitem in 'general\deleteitem.pas' {fmdeleteitem},
  edititem in 'general\edititem.pas' {fmedititem},
  main in 'general\main.pas' {fmmain},
  newitem in 'general\newitem.pas' {fmnewitem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmmain, fmmain);
  Application.CreateForm(Tfmdeleteitem, fmdeleteitem);
  Application.CreateForm(Tfmedititem, fmedititem);
  Application.CreateForm(Tfmnewitem, fmnewitem);
  Application.Run;
end.
