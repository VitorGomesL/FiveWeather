program FiveWeather;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  Classes in 'Classes.pas',
  OpenWeatherAPI in 'OpenWeatherAPI.pas',
  Constantes in 'Constantes.pas',
  BitmapHelper in 'BitmapHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
