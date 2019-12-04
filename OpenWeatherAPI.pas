unit OpenWeatherAPI;

interface

uses
  Classes, FMX.StdCtrls, FMX.Objects;

type

  TOpenWeatherAPI = class(TObject)

  public
    procedure GetURLPorCidade(const cidade: String; lblCidade : TLabel; lblTemperatura : TLabel; imgTempo : TImage);
  end;

implementation

uses
  System.Classes, System.Threading, System.SysUtils, System.Net.HttpClient, System.NetEncoding,
  REST.Json,
  Constantes, BitmapHelper;

function KelvinParaCelsius(const Kelvin: Double): Double;
begin
  Result := Kelvin - 273.15;
end;

function GetTemperatura(const AKelvin: Double): string;
begin
  Result := Format('%.0f°C', [KelvinParaCelsius(AKelvin)]);
end;

procedure TOpenWeatherAPI.GetURLPorCidade(const cidade: String; lblCidade : TLabel; lblTemperatura : TLabel; imgTempo : TImage);
var
  HTTPClient : THTTPClient;
  HTTPResponse : IHTTPResponse;
  jsonCidade : TOpenWeatherPorCidade;
  LWeather: TOpenWeatherWeatherItem;
begin
  TTask.Run(
    procedure
    begin
      HTTPClient := THTTPClient.Create;
      try
        HTTPResponse := HTTPClient.Get(cOpenWeatherURL + cidade + cOpenWeatherAPIKey);
        if HTTPResponse.StatusCode = cHTTPResultOK then
        begin
          try
            jsonCidade := TJson.JsonToObject<TOpenWeatherPorCidade>(HTTPResponse.ContentAsString);

            lblCidade.Text := jsonCidade.name;

            lblTemperatura.Text := GetTemperatura(jsonCidade.main.temp);

            if Length(jsonCidade.weather) > 0 then
            begin
              LWeather := jsonCidade.weather[0];
              imgTempo.Bitmap.LoadFromURL(cOpenWeatherWeatherImagesURL + LWeather.icon + '.png');
            end;
          except
          end;
        end
        else
        begin
        end;
      finally
        HTTPClient.Free;
      end;
    end
  );
end;

end.
