unit uCalculatorUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uCalculator;

type
  TfrmCalculator = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btn0: TButton;
    edtDisplay: TEdit;
    btnDecimal: TButton;
    btnClr: TButton;
    btnPlus: TButton;
    btnMinus: TButton;
    btnMultiply: TButton;
    btnBackSpace: TButton;
    btnDivide: TButton;
    btnSign: TButton;
    btnEquals: TButton;
    procedure btnDigitClick(Sender: TObject);
    procedure btnDecimalClick(Sender: TObject);
    procedure btnClrClick(Sender: TObject);
    procedure btnBackSpaceClick(Sender: TObject);
    procedure btnSignClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Calculator: ICalculator;
  public
    { Public declarations }
    const errMsg: string = 'Cannot divide by zero';
  end;

var
  frmCalculator: TfrmCalculator;

implementation

{$R *.dfm}

procedure TfrmCalculator.btnBackSpaceClick(Sender: TObject);
var lDisplay: string;
begin
  Calculator.Input('bck');
  edtDisplay.Text := Calculator.Output;
end;

procedure TfrmCalculator.btnClrClick(Sender: TObject);
begin
  Calculator.Input('clr');
  edtDisplay.Text := Calculator.Output;
end;

procedure TfrmCalculator.btnDecimalClick(Sender: TObject);
var lDisplay: string;
    lKeyPressed: string;
begin
  Calculator.Input('.');
  edtDisplay.Text := Calculator.Output;
end;

procedure TfrmCalculator.btnDigitClick(Sender: TObject);
var lDisplay: string;
    lKeyPressed: string;
begin
  Calculator.Input((Sender as TButton).Tag.ToString);
  edtDisplay.Text := Calculator.Output;
end;

procedure TfrmCalculator.btnSignClick(Sender: TObject);
var lDisplay: string;
begin
  Calculator.Input('+/-');
  edtDisplay.Text := Calculator.Output;
end;

procedure TfrmCalculator.FormCreate(Sender: TObject);
begin
  Calculator := TCalculator.Create(errMsg);
end;

end.
