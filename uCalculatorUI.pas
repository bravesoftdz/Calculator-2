unit uCalculatorUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculator: TfrmCalculator;

implementation

{$R *.dfm}

procedure TfrmCalculator.btnBackSpaceClick(Sender: TObject);
var lDisplay: string;
begin
  lDisplay := edtDisplay.Text;
  if lDisplay <> '0' then
  begin
    lDisplay := lDisplay.Remove(lDisplay.Length-1);
    if lDisplay.IsEmpty or
       (lDisplay = '-') or
       (lDisplay = '-0') then
      lDisplay := '0';
    edtDisplay.Text := lDisplay;
  end;
end;

procedure TfrmCalculator.btnClrClick(Sender: TObject);
begin
  edtDisplay.Text := '0';
end;

procedure TfrmCalculator.btnDecimalClick(Sender: TObject);
var lDisplay: string;
    lKeyPressed: string;
begin
  lDisplay := edtDisplay.Text;
  lKeyPressed := '.';
  if not lDisplay.Contains(lKeyPressed) then
  begin
    lDisplay := lDisplay + lKeyPressed;
    edtDisplay.Text := lDisplay;
  end;
end;

procedure TfrmCalculator.btnDigitClick(Sender: TObject);
var lDisplay: string;
    lKeyPressed: string;
begin
  lDisplay := edtDisplay.Text;
  lKeyPressed := (Sender as TButton).Tag.ToString;
  if (lDisplay.StartsWith('0') and (lDisplay.Length = 1)) or
     (lDisplay.StartsWith('-0') and (lDisplay.Length = 2)) then
    lDisplay := lKeyPressed
  else
    lDisplay := lDisplay + lKeyPressed;
  edtDisplay.Text := lDisplay;
end;

procedure TfrmCalculator.btnSignClick(Sender: TObject);
var lDisplay: string;
begin
  lDisplay := edtDisplay.Text;
  if lDisplay <> '0'  then
  begin
    if lDisplay.Contains('-') then
      lDisplay := lDisplay.Remove(0,1)
    else
      lDisplay := lDisplay.Insert(0,'-');
    edtDisplay.Text := lDisplay;
  end;
end;

end.
