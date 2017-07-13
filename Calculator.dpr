program Calculator;

uses
  Vcl.Forms,
  uCalculatorUI in 'uCalculatorUI.pas' {frmCalculator},
  uCalculator in 'uCalculator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalculator, frmCalculator);
  Application.Run;
end.
