unit Classes;

interface

type

  //Classe TOpenWeatherCidade
  TOpenWeatherCidade = class(TObject)
  private
    Nome: String;
  public
    property cidade: String read Nome;
  end;

  //Classe TOpenWeatherSys
  TOpenWeatherSys = class(TObject)
  private
    Fcountry: string;
    Fsunrise: Integer;
    Fsunset: Integer;
  public
    property country: string read Fcountry;
    property sunrise: Integer read Fsunrise;
    property sunset: Integer read Fsunset;
  end;

  //Classe TOpenWeatherWeatherItem
  TOpenWeatherWeatherItem = class(TObject)
  private
    Fid: Integer;
    Fmain: string;
    Fdescription: string;
    Ficon: string;
  public
    property id: Integer read Fid;
    property main: string read Fmain;
    property description: string read Fdescription;
    property icon: string  read Ficon;
  end;

  //Classe TOpenWeatherWeather
  TOpenWeatherWeather = array of TOpenWeatherWeatherItem;

  //Classe TOpenWeatherMain
  TOpenWeatherMain = class(TObject)
  private
    Ftemp: Double;
    Fhumidity: Double;
    Fpressure: Double;
    Ftemp_min: Double;
    Ftemp_max: Double;
  public
    property temp: Double read Ftemp;
    property humidity: Double read Fhumidity;
    property pressure: Double read Fpressure;
    property temp_min: Double read Ftemp_min;
    property temp_max: Double read Ftemp_max;
  end;

  //Classe TOpenWeatherWind
  TOpenWeatherWind = class(TObject)
  private
    Fspeed: Double;
    Fdegrees: Double;
  public
    property speed: Double read Fspeed;
    property degrees: Double read Fdegrees;
  end;

  //Classe TOpenWeatherClouds
  TOpenWeatherClouds = class(TObject)
  private
    Fall: Double;
  public
    property all: Double read Fall;
  end;

  //Classe TOpenWeatherRain
  TOpenWeatherRain = class(TObject)
  private
    F3h: Double;
  public
    property vol3h: Double read F3h;
  end;

  //Classe TOpenWeatherPorCidade
  TOpenWeatherPorCidade = class(TObject)
  private
    Fcidade: TOpenWeatherCidade;
    Fsys: TOpenWeatherSys;
    Fweather: TOpenWeatherWeather;
    Fmain: TOpenWeatherMain;
    Fwind: TOpenWeatherWind;
    Frain: TOpenWeatherRain;
    Fclouds: TOpenWeatherClouds;
    Fdt: Integer;
    Fid: Integer;
    Fname: string;
    Fcod: Integer;
  public
    property cidade: TOpenWeatherCidade read Fcidade;
    property sys: TOpenWeatherSys read Fsys;
    property weather: TOpenWeatherWeather read Fweather;
    property main: TOpenWeatherMain read Fmain;
    property wind: TOpenWeatherWind read Fwind;
    property rain: TOpenWeatherRain read Frain;
    property clouds: TOpenWeatherClouds read Fclouds;
    property dt: Integer read Fdt;
    property id: Integer read Fid;
    property name: string read Fname;
    property cod: Integer read Fcod;
  end;

implementation

end.
