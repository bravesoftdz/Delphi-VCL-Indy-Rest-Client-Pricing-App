unit DBCompare;

interface
uses db;

function webservercompare(Adataset,BDataset:Tdataset):Boolean;

implementation

function webservercompare(Adataset,BDataset:Tdataset):Boolean;
 var
 Equal : boolean;
begin
Result := true;
Adataset.First;
BDataset.First;
while not Adataset.EOF do begin

if not BDataset.Locate('id', ADataset.FieldByName('id').AsString, []) then
 //Add info for the fields
 //per field

begin
Result:= False;
break; //quit the while loop
end;
ADataset.Next;
end;
end;

end.


