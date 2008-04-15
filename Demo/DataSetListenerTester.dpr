program DataSetListenerTester;

uses
  Forms,
  MainFormU in 'MainFormU.pas' {MainForm},
  NLDDataSetListener in '..\NLDDataSetListener.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
