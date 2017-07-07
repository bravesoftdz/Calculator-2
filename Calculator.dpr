program Calculator;

uses
  Vcl.Forms,
  uCalculatorUI in 'uCalculatorUI.pas' {frmCalculator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalculator, frmCalculator);
  Application.Run;
end.
