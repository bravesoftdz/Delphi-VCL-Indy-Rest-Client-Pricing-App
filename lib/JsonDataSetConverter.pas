unit JsonDataSetConverter;

interface

uses DB, DBClient, superobject, Classes, superxmlparser, SysUtils,
  Variants, Dialogs;

// Routines to Call
procedure UnMarshalToDataSet(ADataSet: TDataSet; AJson: string); overload;
procedure UnMarshalToDataSet(ADataSet: TDataSet;AObject: ISuperObject); overload;
function ClientDataSetToJSON(recClientds: TCLientDataset): UTF8String;

implementation

// helper procedure
procedure SetFieldValue(AField: TField; AValue: ISuperObject);
var
  vFieldName: string;
  vNestedDataSet: TDataSet;
begin
  vFieldName := AField.FieldName;
  case AField.DataType of
    ftSmallint, ftInteger, ftWord, ftLargeint:
      AField.AsInteger := AValue.AsInteger;
    ftFloat, ftCurrency, ftBCD, ftFMTBcd:
      AField.AsFloat := AValue.AsDouble;
    ftBoolean:
      AField.AsBoolean := AValue.AsBoolean;
    ftDate, ftTime, ftDateTime, ftTimeStamp:
      AField.AsDateTime := AValue.AsDouble;
    ftDataSet:
      begin
        vNestedDataSet := TDataSetField(AField).NestedDataSet;

        UnMarshalToDataSet(vNestedDataSet, AValue);
      end;
  else
    AField.AsString := AValue.AsString;
  end;
end;

// helper procedure
procedure AppendRecord(ADataSet: TDataSet; AObject: ISuperObject);
var
  vField: TField;
  vIterator: TSuperObjectIter;
begin
  ADataSet.Append;

  if SuperObject.ObjectFindFirst(AObject, vIterator) then
  begin
    try
      repeat
        vField := ADataSet.FindField(vIterator.key);

        if Assigned(vField) then
        begin
          SetFieldValue(vField, vIterator.val);
        end;
      until not SuperObject.ObjectFindNext(vIterator);
    finally
      SuperObject.ObjectFindClose(vIterator);
    end;
  end;

  ADataSet.Post;
end;

procedure UnMarshalToDataSet(ADataSet: TDataSet; AObject: ISuperObject);
var
  i: Integer;
  vArray: TSuperArray;
begin
  ADataSet.DisableControls;
  try
    if AObject.IsType(stArray) then
    begin
      vArray := AObject.AsArray;

      for i := 0 to vArray.Length - 1 do
      begin
        AppendRecord(ADataSet, vArray.O[i]);
      end;
    end
    else
    begin
      AppendRecord(ADataSet, AObject);
    end;
  finally
    ADataSet.EnableControls;
  end;
    ADataSet.First;
end;

procedure UnMarshalToDataSet(ADataSet: TDataSet; AJson: string);
var
  AObject: ISuperObject;
begin
  AObject := SuperObject.SO(AJson);
  UnMarshalToDataSet(ADataSet, AObject);
end;

{function GetToken(var astring: string; const fmt: array of char): string;
  var
     i, j: Integer;
     Found: Boolean;
   begin
    Found := false;
    Result := '';
    astring := TrimLeft(astring);
    if Length(astring) = 0 then
    exit;
     i := 1;
     while i <= Length(astring) do
     begin
        Found := false;
         if astring[i] <= #128 then
         begin
           for j := Low(fmt) to High(fmt) do
            begin
               if (astring[i] <> fmt[j]) then
          continue;
                Found := true;
                break;
              end;
            if Not Found then
        i := i + 1;
          end
          else
      i := i + 2;
         if Found then
      break;
       end;
     if Found then
     begin
       Result := copy(astring, 1, i - 1);
       delete(astring, 1, i);
     end
    else
     begin
      Result := astring;
      astring := '';
    end;
 end;   }

function ClientDataSetToJSON(recClientds: TCLientDataset): UTF8String;
var
  i, j: Integer;
  keyValue: String;
  jsonList: TStringList;
  jsonResult: String;
begin
  if not recClientds.Active then
    recClientds.Open;
  try
    jsonList := TStringList.Create;
    recClientds.DisableControls;
    recClientds.First;
    while not recClientds.Eof do
    begin
      keyValue := '';
      for i := 0 to recClientds.FieldDefs.Count - 1 do
      begin
        keyValue := keyValue + Format('"%s":"%s",', [recClientds.Fields[i].FieldName,
          recClientds.Fields[i].AsString]);
      end;
      jsonList.Add(Format('{%s}', [copy(keyValue, 0, Length(keyValue) - 1)]));
      recClientds.Next;
    end;
    for i := 0 to jsonList.Count - 1 do
    begin
      jsonResult := jsonResult + jsonList[i] + ',';
    end;
    Result := Utf8Encode(Format('[%s]',
      [copy(jsonResult, 0, Length(jsonResult) - 1)]));
  finally
    recClientds.EnableControls;
    jsonList.free;
  end;
end;

end.
