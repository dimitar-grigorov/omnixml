unit MainFUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DB,
  Grids, DBGrids,OmniXMLDatabaseExperiments, StdCtrls, ExtCtrls;

type
  TMainF = class(TForm)
    DBGrid1: TDBGrid;
    memLog: TMemo;
    pnlButtons: TPanel;
    btnTestMemdata: TButton;
    btnTestCDS: TButton;
    btnXMLToCDS: TButton;
    btnXMLToMemData: TButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnTestMemdataClick(Sender: TObject);
    procedure btnTestCDSClick(Sender: TObject);
    procedure btnXMLToMemDataClick(Sender: TObject);
    procedure btnXMLToCDSClick(Sender: TObject);
  private
    FObj: TOmniXmlDatabaseExperiments;
  end;

var
  MainF: TMainF;

implementation

{$R *.dfm}

procedure TMainF.btnTestCDSClick(Sender: TObject);
begin
  memLog.Lines.Add(FObj.TestCDSToXml);
end;

procedure TMainF.btnTestMemdataClick(Sender: TObject);
begin
  memLog.Lines.Add(FObj.TestTdxMemDataToXml);
end;

procedure TMainF.btnXMLToMemDataClick(Sender: TObject);
begin
  DataSource1.DataSet := FObj.TestXmlToTdxMemData;
end;

procedure TMainF.btnXMLToCDSClick(Sender: TObject);
begin
  DataSource1.DataSet := FObj.TestXmlToCDS;
end;

procedure TMainF.FormCreate(Sender: TObject);
begin
  FObj := TOmniXmlDatabaseExperiments.Create;
end;

procedure TMainF.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FObj);
end;

end.

