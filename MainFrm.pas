unit MainFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Sensors, System.Sensors.Components,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  OpenWeatherAPI, Classes, FMX.Edit, FMX.Gestures, System.Threading, FMX.Effects, FMX.VirtualKeyboard, FMX.Platform;

type
  TVirtualKeyboardState = (vkAtivo, vkInativo); {Define o Tipo TVirtualKeyboardState que vai ser utilizado
                                                 para saber o estado do teclado do dispositivo de forma simplificada}

  TfrmMain = class(TForm)
    lytTop: TLayout;
    lytCidade: TLayout;
    lytWeatherImage: TLayout;
    lytTemperatura: TLayout;
    lblTemp1: TLabel;
    img1: TImage;
    lytMid: TLayout;
    lytBottom: TLayout;
    lytMidLeft: TLayout;
    Layout2: TLayout;
    lytImgWeatherMLeft: TLayout;
    img2: TImage;
    Layout4: TLayout;
    lblTemp2: TLabel;
    lytMidRight: TLayout;
    Layout6: TLayout;
    lytImgWeatherMRight: TLayout;
    img3: TImage;
    Layout8: TLayout;
    lblTemp3: TLabel;
    lytBottomLeft: TLayout;
    Layout5: TLayout;
    lytImgWeatherBLeft: TLayout;
    img4: TImage;
    Layout10: TLayout;
    lblTemp4: TLabel;
    lytBottomRight: TLayout;
    Layout12: TLayout;
    lytImgWeatherBRight: TLayout;
    imgIndex: TImage;
    Layout14: TLayout;
    lblTemp5: TLabel;
    StyleBook1: TStyleBook;
    img5: TImage;
    lblCidade5: TLabel;
    lblCidade4: TLabel;
    lblCidade2: TLabel;
    lblCidade3: TLabel;
    lblCidade1: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Label1: TLabel;
    GestureManager1: TGestureManager;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    rectPesquisar: TRectangle;
    ShadowEffect1: TShadowEffect;
    btnFecharPesquisa: TButton;
    edtPesquisar: TEdit;
    btnClearEdtPesquisar: TClearEditButton;
    Button6: TButton;
    procedure FormResize(Sender: TObject);
    procedure edtPesquisarTyping(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnFecharPesquisaTap(Sender: TObject; const Point: TPointF);
    procedure btnClearEdtPesquisarTap(Sender: TObject; const Point: TPointF);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure Button5Tap(Sender: TObject; const Point: TPointF);
    procedure Button4Tap(Sender: TObject; const Point: TPointF);
    procedure Button1Tap(Sender: TObject; const Point: TPointF);
    procedure Button3Tap(Sender: TObject; const Point: TPointF);
    procedure Button2Tap(Sender: TObject; const Point: TPointF);
    procedure Button6Tap(Sender: TObject; const Point: TPointF);
  private
    PosicaoCidade : Integer;
    FAPI: TOpenWeatherAPI;
    FImagesPath: string;
    oVirtualKeyboardState : TVirtualKeyboardState; //Declara uma variável do tipo TVirtualKeyboardState
    procedure Start;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  Constantes, BitmapHelper;

{ TfrmMain }

procedure TfrmMain.btnClearEdtPesquisarTap(Sender: TObject;
  const Point: TPointF);
begin
  edtPesquisar.Text:='';
  btnClearEdtPesquisar.Visible := False;
end;

procedure TfrmMain.btnFecharPesquisaTap(Sender: TObject; const Point: TPointF);
begin
  rectPesquisar.Visible := False;
end;

procedure TfrmMain.Button1Tap(Sender: TObject; const Point: TPointF);
begin
  rectPesquisar.Visible := True;
  edtPesquisar.Text := '';
  edtPesquisar.SetFocus;

  PosicaoCidade := 3;
end;

procedure TfrmMain.Button2Tap(Sender: TObject; const Point: TPointF);
begin
  rectPesquisar.Visible := True;
  edtPesquisar.Text := '';
  edtPesquisar.SetFocus;

  PosicaoCidade := 5;
end;

procedure TfrmMain.Button3Tap(Sender: TObject; const Point: TPointF);
begin
  rectPesquisar.Visible := True;
  edtPesquisar.Text := '';
  edtPesquisar.SetFocus;

  PosicaoCidade := 4;
end;

procedure TfrmMain.Button4Tap(Sender: TObject; const Point: TPointF);
begin
  rectPesquisar.Visible := True;
  edtPesquisar.Text := '';
  edtPesquisar.SetFocus;

  PosicaoCidade := 2;
end;

procedure TfrmMain.Button5Tap(Sender: TObject; const Point: TPointF);
begin
  rectPesquisar.Visible := True;
  edtPesquisar.Text := '';
  edtPesquisar.SetFocus;

  PosicaoCidade := 1;
end;

procedure TfrmMain.Button6Tap(Sender: TObject; const Point: TPointF);
begin
  case PosicaoCidade of
    1 : FAPI.GetURLPorCidade(edtPesquisar.Text.Trim,lblCidade1,lblTemp1, img1);
    2 : FAPI.GetURLPorCidade(edtPesquisar.Text.Trim,lblCidade2,lblTemp2, img2);
    3 : FAPI.GetURLPorCidade(edtPesquisar.Text.Trim,lblCidade3,lblTemp3, img3);
    4 : FAPI.GetURLPorCidade(edtPesquisar.Text.Trim,lblCidade4,lblTemp4, img4);
    5 : FAPI.GetURLPorCidade(edtPesquisar.Text.Trim,lblCidade5,lblTemp5, img5);
  end;
end;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited;
  FAPI := TOpenWeatherAPI.Create;

  Start;
end;

destructor TfrmMain.Destroy;
begin
  FAPI.Free;
  inherited;
end;

procedure TfrmMain.edtPesquisarTyping(Sender: TObject);
begin
  btnClearEdtPesquisar.Visible := not(edtPesquisar.Text.IsEmpty);
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  FService : IFMXVirtualKeyboardService;
begin
  inherited;
  if (Key = vkHardwareBack) then
  begin
    TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));

    if ((FService <> nil) and (oVirtualKeyboardState = vkAtivo))  then
    begin
      //Botao back pressionado e teclado visivel, apenas fecha o teclado
    end
    else
    begin
      //Botao back pressionado e teclado nao visivel
      if rectPesquisar.Visible then
      begin
        Key := 0;
        rectPesquisar.Visible := False;
      end;
    end;
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  lytTop.Height    := (Self.ClientHeight - 40) / 3;
  lytMid.Height    := lytTop.Height;
  lytBottom.Height := lytTop.Height;

  lytMidLeft.Width := lytMid.Width / 2;

  lytBottomLeft.Width := lytBottom.Width / 2;

  lytWeatherImage.Width := lytTop.Width / 3;
  lytImgWeatherMLeft.Width := lytMidLeft.Width / 3;
  lytImgWeatherMRight.Width := lytMidRight.Width / 3;
  lytImgWeatherBLeft.Width := lytBottomLeft.Width / 3;
  lytImgWeatherBRight.Width := lytBottomRight.Width / 3;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  rectPesquisar.Visible := False;
  btnClearEdtPesquisar.Visible := False;
end;

procedure TfrmMain.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  oVirtualKeyboardState := vkInativo;
end;

procedure TfrmMain.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  oVirtualKeyboardState := vkAtivo;
end;

procedure TfrmMain.Start;
begin
  TThread.CreateAnonymousThread(procedure begin

    FAPI.GetURLPorCidade('Vertentes', lblCidade1, lblTemp1, img1);

    FAPI.GetURLPorCidade('Surubim', lblCidade2, lblTemp2, img2);

    FAPI.GetURLPorCidade('Caruaru', lblCidade3, lblTemp3, img3);

    FAPI.GetURLPorCidade('Toritama', lblCidade4, lblTemp4, img4);

    FAPI.GetURLPorCidade('Bezerros', lblCidade5, lblTemp5, img5);

  end).start();
end;

end.
