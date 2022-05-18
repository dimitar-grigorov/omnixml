program OmniXMLMemdata;

uses
  Forms,
  MainFUnit in 'MainFUnit.pas' {MainF},
  OmniXMLDatabaseExperiments in 'OmniXMLDatabaseExperiments.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainF, MainF);
  Application.Run;
end.
