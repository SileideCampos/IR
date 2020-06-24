program MyHouse;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {FMyHouse};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMyHouse, FMyHouse);
  Application.Run;
end.
