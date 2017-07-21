unit uCalculator;

interface
uses System.SysUtils, System.Generics.Collections;

type
  ICalculator = interface(IInvokable)
    ['{2F1E2ECA-C0A5-46B0-81D7-A984453890A2}']
    procedure Input(aInput: string);
    function Output: string;
  end;

  TCalculator = class(TInterfacedObject, ICalculator)
  private
    fInput: string;
    fOutput: string;
    fOperations: TDictionary<string, TFunc<double, double, double>>;
    fErrMsg: string;
    procedure inputDigit(aDigit: string);
    procedure inputDecimal;
    procedure ClearMem;
    procedure BackSpace;
  public
    constructor Create(aErrMsg: string);
    destructor Destroy; override;
    procedure Input(aInput: string);
    function Output: string;
  end;

implementation

{ TCalculator }

constructor TCalculator.Create(aErrMsg: string);
begin
  fOutput := '0';
  fErrMsg := aErrMsg;
  fOperations := TDictionary<string, TFunc<double, double, double>>.Create;
  fOperations.Add('+/-', function(X: double; Y: double): double
                         begin
                           result := -X;
                         end);
  fOperations.Add('+', function(X: double; Y: double): double
                       begin
                         result := X + Y;
                       end);
  fOperations.Add('-', function(X: double; Y: double): double
                       begin
                         result := X - Y;
                       end);
  fOperations.Add('*', function(X: double; Y: double): double
                       begin
                         result := X * Y;
                       end);
  fOperations.Add('/', function(X: double; Y: double): double
                       begin
                         result := X / Y;
                       end);
end;

destructor TCalculator.Destroy;
begin
  fOperations.DisposeOf;
  inherited;
end;

procedure TCalculator.Input(aInput: string);
var Operation: TFunc<double, double, double>;
begin
  if fOutput <> fErrMsg then
  begin
    if aInput = '+/-' then
    begin
      Operation := fOperations[aInput];
      fOutput := Operation(fOutput.ToDouble, 0).ToString;
    end
    else
      if aInput = '.' then
        inputDecimal
      else
        if aInput.ToUpper = 'CLR' then
          clearMem
        else
        if aInput.ToUpper = 'BCK' then
          BackSpace
        else
          if aInput.ToInteger in [0..9] then
            inputDigit(aInput)
  end;
end;

procedure TCalculator.inputDecimal;
begin
  if not fOutput.Contains('.') then
    fOutput := fOutput + '.';
end;

procedure TCalculator.inputDigit(aDigit: string);
begin
  if (fOutput.StartsWith('0') and (fOutput.Length = 1)) or
     (fOutput.StartsWith('-0') and (fOutput.Length = 2)) then
    fOutput := aDigit
  else
    fOutput := fOutput + aDigit;
end;

procedure TCalculator.BackSpace;
begin
  if (fOutput <> '0') then
  begin
    fOutput := fOutput.Remove(fOutput.Length-1);
    if fOutput.IsEmpty or
       (fOutput = '-') or
       (fOutput = '-0') then
      fOutput := '0';
  end;
end;

procedure TCalculator.ClearMem;
begin
  fOutput := '0';
  fInput := '';
end;

function TCalculator.Output: string;
begin
  result := fOutput;
end;

end.
