unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Gestures, System.Actions, FMX.ActnList, FMX.Objects, FMX.Layouts,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, FMX.Ani, FMX.Colors,
  FMX.Edit, System.JSON;

type
  TFMyHouse = class(TForm)
    tbcMidias: TTabControl;
    tabMidia: TTabItem;
    tbcControles: TTabControl;
    tabTV: TTabItem;
    ToolBar1: TToolBar;
    btnNext: TSpeedButton;
    tabIluminacao: TTabItem;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    lblTitle1: TLabel;
    Rectangle17: TRectangle;
    lblVolume: TLabel;
    Rectangle19: TRectangle;
    lblCanal: TLabel;
    Layout7: TLayout;
    tabNT: TTabItem;
    FramedScrollBox1: TFramedScrollBox;
    Layout210: TLayout;
    FramedScrollBox2: TFramedScrollBox;
    Rectangle60: TRectangle;
    lblVolumeNET: TLabel;
    Rectangle61: TRectangle;
    lblCanalNET: TLabel;
    Layout25: TLayout;
    PreviousTabAction2: TPreviousTabAction;
    NextTabAction2: TNextTabAction;
    ColorPanel1: TColorPanel;
    ColorAnimation1: TColorAnimation;
    btnLuminaria: TSwitch;
    Layout26: TLayout;
    lblLuminaria: TLabel;
    Layout29: TLayout;
    btnLampQuarto: TSwitch;
    lblLampQuarto: TLabel;
    ToolBar3: TToolBar;
    SpeedButton19: TSpeedButton;
    Label59: TLabel;
    Rectangle95: TRectangle;
    btnNet: TButton;
    StyleBook1: TStyleBook;
    btnPortal: TButton;
    btnInfo: TButton;
    btnMosaico: TButton;
    btnNETTV: TButton;
    btnSair: TButton;
    btnCima: TButton;
    btnEmail: TButton;
    btnITV: TButton;
    btnBaixo: TButton;
    btnEnter: TButton;
    btnEsquerda: TButton;
    btnDireita: TButton;
    btnLegenda: TButton;
    btnAudio: TButton;
    btnAgora: TButton;
    btn2: TButton;
    btn1: TButton;
    btn3: TButton;
    btn5: TButton;
    btn4: TButton;
    btn6: TButton;
    btn8: TButton;
    btn7: TButton;
    btn9: TButton;
    btnMenu: TButton;
    btnFav: TButton;
    btn0: TButton;
    btnMute: TButton;
    btnVoltar: TButton;
    btnTV5: TButton;
    btnTV4: TButton;
    btnTV6: TButton;
    btnTV2: TButton;
    btnTV1: TButton;
    btnTV3: TButton;
    btnTV8: TButton;
    btnTV7: TButton;
    btnTV9: TButton;
    btnTVSair: TButton;
    btnTVVoltar: TButton;
    btnTV0: TButton;
    udp: TIdUDPClient;
    btnTVMenu: TButton;
    btnGuide: TButton;
    btnTVCima: TButton;
    btnOK: TButton;
    btnTVEsquerda: TButton;
    btnTVDireita: TButton;
    btnAmazon: TButton;
    btnNetflix: TButton;
    btnTVBaixo: TButton;
    udpLamps: TIdUDPClient;
    ToolBar5: TToolBar;
    btnReconectar: TSpeedButton;
    lblConexao: TLabel;
    btnPesquisar: TButton;
    btnCaption: TButton;
    btnTV: TButton;
    btnLigar: TButton;
    btnConfig: TButton;
    btnConexoes: TButton;
    ColorBox20: TColorBox;
    Layout100: TLayout;
    Layout102: TLayout;
    Layout101: TLayout;
    Layout103: TLayout;
    Layout104: TLayout;
    Layout105: TLayout;
    Layout106: TLayout;
    Layout107: TLayout;
    Layout108: TLayout;
    Layout109: TLayout;
    Layout110: TLayout;
    Layout200: TLayout;
    ColorBox1: TColorBox;
    Layout201: TLayout;
    Layout202: TLayout;
    Layout203: TLayout;
    Layout204: TLayout;
    Layout205: TLayout;
    Layout209: TLayout;
    Layout206: TLayout;
    Layout207: TLayout;
    Layout208: TLayout;
    btn_1: TButton;
    btn_2: TButton;
    btn_3: TButton;
    btn_4: TButton;
    btnTVInfo: TButton;
    btnMudo: TButton;
    btnTVFav: TButton;
    btnReduzVolume: TButton;
    btnAumentaVolume: TButton;
    btnAumentaCanal: TButton;
    btnReduzCanal: TButton;
    btnAumentaVolumeNET: TButton;
    btnReduzVolumeNET: TButton;
    btnAumentaCanalNET: TButton;
    btnReduzCanalNET: TButton;
    procedure GestureDone(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure GestureDone2(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ColorPanel1Change(Sender: TObject);
    procedure btnLuminariaSwitch(Sender: TObject);
    procedure btnReconectarClick(Sender: TObject);
    procedure acionarBtnNET(Sender: TObject);
    procedure acionarBtnTV(Sender: TObject);
  private
    procedure alteraCor;
    procedure conectar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMyHouse: TFMyHouse;

implementation

{$R *.fmx}

procedure TFMyHouse.conectar;
begin
  udp.Connect;
  udpLamps.Connect;
  if udp.Connected then
    lblConexao.Text := 'Conectado';
end;

procedure TFMyHouse.FormCreate(Sender: TObject);
var
  count: integer;
  c: TAlphaColor;
begin
  tbcMidias.ActiveTab := tabMidia;
  tbcControles.ActiveTab := TabTV;
  conectar;
end;

procedure TFMyHouse.acionarBtnNET(Sender: TObject);
begin
  udp.Send('nt'+FormatFloat('00', (Sender as TButton).Tag));
end;

procedure TFMyHouse.acionarBtnTV(Sender: TObject);
begin
  udp.Send('tv'+FormatFloat('00', (Sender as TButton).Tag));
end;

procedure TFMyHouse.btnReconectarClick(Sender: TObject);
begin
  conectar;
end;

procedure TFMyHouse.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    if (tbcMidias.ActiveTab = tabMidia) and (tbcControles.ActiveTab = tabTV) then
    begin
      tbcControles.Previous;
      Key := 0;
    end;
  end;
end;

procedure TFMyHouse.GestureDone(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
    sgiLeft:
      begin
        if tbcMidias.ActiveTab <> tbcMidias.Tabs[tbcMidias.TabCount - 1] then
          tbcMidias.ActiveTab := tbcMidias.Tabs[tbcMidias.TabIndex + 1];
        Handled := True;
      end;

    sgiRight:
      begin
        if tbcMidias.ActiveTab <> tbcMidias.Tabs[0] then
          tbcMidias.ActiveTab := tbcMidias.Tabs[tbcMidias.TabIndex - 1];
        Handled := True;
      end;
  end;
end;

procedure TFMyHouse.GestureDone2(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
    sgiLeft:
      begin
        if tbcControles.ActiveTab <> tbcControles.Tabs[tbcControles.TabCount - 1] then
          tbcControles.ActiveTab := tbcControles.Tabs[tbcControles.TabIndex + 1]
        else if tbcControles.ActiveTab = tbcControles.Tabs[tbcControles.TabCount - 1] then
          tbcMidias.ActiveTab := tbcMidias.Tabs[tbcMidias.TabIndex + 1];
        Handled := True;
      end;

    sgiRight:
      begin
        if tbcControles.ActiveTab <> tbcControles.Tabs[0] then
          tbcControles.ActiveTab := tbcControles.Tabs[tbcControles.TabIndex - 1];
        Handled := True;
      end;
  end;
end;

procedure TFMyHouse.alteraCor;
begin
  udpLamps.Send(FormatCurr('000', (Byte(colorPanel1.Color shr 16)).ToDouble) + FormatCurr('000', (Byte(colorPanel1.Color shr 8)).ToDouble) + FormatCurr('000', (Byte(colorPanel1.Color)).ToDouble));
end;

procedure TFMyHouse.ColorPanel1Change(Sender: TObject);
begin
  try
    udpLamps.Connect;
  finally
    alteraCor;
  end;
end;

procedure TFMyHouse.btnLuminariaSwitch(Sender: TObject);
begin
  if btnLuminaria.IsChecked then
    udpLamps.Send('000000000')
  else
    alteraCor;
end;

end.

