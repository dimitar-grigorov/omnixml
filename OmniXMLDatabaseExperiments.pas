unit OmniXMLDatabaseExperiments;

interface

uses
  Classes, DB, dxmdaset, DBClient;

type
  TOmniXmlDatabaseExperiments = class
  private
    const
      InputXML = '<?xml version="1.0"?> <RECORDS><ROW> <GoodId>1</GoodId>' +
        '<GoodName>Banana</GoodName> <Price>1.23</Price> </ROW></RECORDS>';
  private
    FMemData: TdxMemData;
    FCDS: TClientDataSet;
  protected
    procedure CreateDataSetField(aDS: TDataSet; const aFieldName: string; const aFieldType:
      TFieldType; const aSize: Integer = 0);
    procedure DefineFields(aDS: TDataSet);
    procedure FillDataSet(aDS: TDataSet);
  public
    destructor Destroy; override;
    function TestTdxMemDataToXml: string;
    function TestCDSToXml: string;
    //
    function TestXmlToTdxMemData: TDataSet;
    function TestXmlToCDS: TDataSet;
  public
    property MemData: TdxMemData read FMemData;
    property CDS: TClientDataSet read FCDS;
  end;

implementation

uses
  SysUtils, OmniXML, OmniXMLDatabase;

destructor TOmniXmlDatabaseExperiments.Destroy;
begin
  FreeAndNil(FCDS);
  FreeAndNil(FMemData);
  inherited;
end;

procedure TOmniXmlDatabaseExperiments.FillDataSet(aDS: TDataSet);
begin
  aDS.Append;
  aDS.FieldByName('GoodId').Value := 1;
  aDS.FieldByName('GoodName').Value := 'Banana';
  aDS.FieldByName('Price').Value := 1.23;
  aDS.Post;
//  aDS.Append;
//  aDS.FieldByName('GoodId').AsInteger := 2;
//  aDS.FieldByName('GoodName').AsString := 'Lemon';
//  aDS.FieldByName('Price').AsFloat := 3.45;
//  aDS.Post;
//  aDS.Append;
//  aDS.FieldByName('GoodId').AsInteger := 3;
//  aDS.FieldByName('GoodName').AsString := 'Orange';
//  aDS.FieldByName('Price').AsFloat := 5.67;
//  aDS.Post;
end;

procedure TOmniXmlDatabaseExperiments.DefineFields(aDS: TDataSet);
begin
  CreateDataSetField(aDS, 'GoodId', ftInteger);
  CreateDataSetField(aDS, 'GoodName', ftString, 50);
  CreateDataSetField(aDS, 'Price', ftFloat);
  if (aDS is TClientDataSet) then
  begin
    (aDS as TClientDataSet).CreateDataSet;
    (aDS as TClientDataSet).LogChanges := False;
  end;
  aDS.Open;
end;

function TOmniXmlDatabaseExperiments.TestTdxMemDataToXml: string;
begin
  FreeAndNil(FMemData);
  FMemData := TdxMemData.Create(nil);

  DefineFields(FMemData);
  FillDataSet(FMemData);
  
  Result := DatasetToXMLString(FMemData, 'RECORDS', EmptyStr, ofIndent, [odbIgnoreUnsupportedColumns,
    odbIgnoreMissingColumns]);
end;

function TOmniXmlDatabaseExperiments.TestCDSToXml: string;
begin
  FreeAndNil(FCDS);
  FCDS := TClientDataSet.Create(nil);

  DefineFields(FCDS);
  FillDataSet(FCDS);
  
  Result := DatasetToXMLString(FCDS, 'RECORDS', EmptyStr, ofIndent, [odbIgnoreUnsupportedColumns,
    odbIgnoreMissingColumns]);
end;

function TOmniXmlDatabaseExperiments.TestXmlToCDS: TDataSet;
begin
  FreeAndNil(FCDS);
  FCDS := TClientDataSet.Create(nil);

  DefineFields(FCDS);

  XMLStringToDataset(InputXML, FCDS, EmptyStr, [odbIgnoreUnsupportedColumns,
    odbIgnoreMissingColumns]);
  Result := FCDS;
  //FCDS.SaveToFile('c:\cds.txt', dfXMLUTF8);
end;

function TOmniXmlDatabaseExperiments.TestXmlToTdxMemData: TDataSet;
begin
  FreeAndNil(FMemData);
  FMemData := TdxMemData.Create(nil);

  DefineFields(FMemData);
  XMLStringToDataset(InputXML, FMemData, EmptyStr, [odbIgnoreUnsupportedColumns,
    odbIgnoreMissingColumns]);
  Result := FMemData;
  //FMemData.SaveToTextFile('c:\memdata.txt');
end;

procedure TOmniXmlDatabaseExperiments.CreateDataSetField(aDS: TDataSet; const aFieldName:
  string; const aFieldType: TFieldType; const aSize: Integer);
var
  FD: TFieldDef;
begin
  if (aFieldName = EmptyStr) then
    Exit;
  FD := aDS.FieldDefs.AddFieldDef;
  FD.Name := aFieldName;
  FD.DataType := aFieldType;
  if (aSize > 0) then
    FD.SIZE := aSize;
  FD.CreateField(aDS);
end;

end.

