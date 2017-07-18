unit uCalculatorTests;

interface
uses
  System.SysUtils,
  System.Generics.Collections,
  DUnitX.TestFramework,
  uCalculatorUI;

type
  IBridgeUI = Interface(IInvokable)
    ['{A64CAEF2-EE61-415D-80F7-F02C3B033133}']
    procedure SimClick(aButton: string); overload;
    procedure SimClick(aButton: integer); overload;
    function DisplayedResult: string;
    function errMsg: string;
  End;

  TBridgeUI = class(TInterfacedObject, IBridgeUI)
  private
    fFormButtons: TDictionary<string, string>;
    FCalculatorUI: TfrmCalculator;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SimClick(aButton: string); overload;
    procedure SimClick(aButton: integer); overload;
    function DisplayedResult: string;
    function errMsg: string;
  end;

  {$M+}
  [TestFixture]
  TCalculatorUITests = class(TObject)
  private
    FBridgeUI: IBridgeUI;
  published
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure DisplayEqualsAllTenDigitsOneTime;

    [Ignore]
    procedure DisplayEqualsEnteredPositiveWholeValue;

    [Ignore]
    procedure DisplayEqualsEnteredPositiveFloatValue;

    [Ignore]
    procedure DisplayEqualsEnteredNegativeWholeValue;

    [Ignore]
    procedure DisplayEqualsEnteredNegativeFloatValue;

    [Ignore]
    procedure DisplayCorrectValueAfterClearingOldValue;

    [Ignore]
    procedure DisplayCorrectValueAfterErasingPartOfValue;

    [Ignore]
    procedure DisplayOnePlusOneEqualsTwo;

    [Ignore]
    procedure DisplaySeventyFiveMinusTwelveEqualsSixtyThree;

    [Ignore]
    procedure DisplayTwoTimesSevenEqualsFourteen;

    [Ignore]
    procedure DisplayTwelveDividedByThreeEqualsFour;

    [Ignore]
    procedure PerformTwoStepCalculation;

    [Ignore]
    procedure PerformThreeStepCalculation;

    [Ignore]
    procedure DividingByZeroIsBad;

    [Ignore]
    procedure RecoverFromDivideByZero;
  end;
  {$M-}

implementation
uses System.Classes, VCL.StdCtrls;

{ TBridgeUI }

constructor TBridgeUI.Create;
var i: integer;
begin
  inherited create;
  fCalculatorUI := TfrmCalculator.Create(nil);
  fFormButtons := TDictionary<string, string>.Create;

  //             Operation  Name of button
  fFormButtons.Add('sign',  'btnSign');               // ± button
  fFormButtons.Add('+',     'btnPlus');               // + button
  fFormButtons.Add('-',     'btnMinus');              // - button
  fFormButtons.Add('*',     'btnMultiply');           // * button
  fFormButtons.Add('/',     'btnDivide');             // / button
  fFormButtons.Add('back',  'btnBackSpace');          // back button
  fFormButtons.Add('clear', 'btnClr');                // clear button
  fFormButtons.Add('=',     'btnEquals');             // = button
  fFormButtons.Add('.',     'btnDecimal');            // . button
  for i := 0 to 9 do
    fFormButtons.Add(i.ToString, 'btn' + i.ToString); // 0..9 buttons
end;

function TBridgeUI.DisplayedResult: string;
begin    //result should equal string output of component that displays results
  result := fCalculatorUI.edtDisplay.Text;
end;

function TBridgeUI.errMsg;
begin  //result should equal a string or method that returns an error message that is displayed when an error occurs
       //  ie. dividing by zero
  result := fCalculatorUI.errMsg;
end;

{$region 'TBridgeUI Implementation'}
procedure TBridgeUI.SimClick(aButton: integer);
begin
  SimClick(aButton.ToString);
end;

procedure TBridgeUI.SimClick(aButton: string);
var Component: TComponent;
begin
  if fFormButtons.ContainsKey(aButton) then
  begin
    Component := fCalculatorUI.FindComponent(fFormButtons[aButton]);
    if assigned(Component) and (Component is TButton) then
      (Component as TButton).Click;
  end;
end;

destructor TBridgeUI.Destroy;
begin
  fFormButtons.DisposeOf;
  fCalculatorUI.DisposeOf;
  inherited Destroy;
end;
{$endregion}

{$region 'TCalculatorUITests'}
procedure TCalculatorUITests.DisplayEqualsAllTenDigitsOneTime;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(1);
    SimClick(2);
    SimClick(3);
    SimClick(4);
    SimClick(5);
    SimClick(6);
    SimClick(7);
    SimClick(8);
    SimClick(9);
    SimClick(0);
    Assert.AreEqual('1234567890', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplayCorrectValueAfterClearingOldValue;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(5);
    SimClick(6);
    SimClick('.');
    SimClick(3);
    SimClick(5);
    SimClick('sign');
    SimClick('clear');

    SimClick(1);
    SimClick(1);
    SimClick(1);
    Assert.AreEqual('111', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplayCorrectValueAfterErasingPartOfValue;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(5);
    SimClick(6);
    SimClick('.');
    SimClick(3);
    SimClick(5);
    SimClick('sign');

    SimClick('back');
    SimClick(9);
    SimClick(5);
    Assert.AreEqual('-56.395', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplayEqualsEnteredNegativeFloatValue;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(5);
    SimClick(6);
    SimClick('.');
    SimClick(3);
    SimClick(5);
    SimClick('sign');
    Assert.AreEqual('-56.35', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplayEqualsEnteredNegativeWholeValue;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(5);
    SimClick(6);
    SimClick('sign');
    Assert.AreEqual('-56', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplayEqualsEnteredPositiveFloatValue;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(5);
    SimClick(6);
    SimClick('.');
    SimClick(3);
    SimClick(5);
    Assert.AreEqual('56.35', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplayEqualsEnteredPositiveWholeValue;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(5);
    SimClick(6);
    Assert.AreEqual('56', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplayOnePlusOneEqualsTwo;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(1);
    SimClick('+');
    SimClick(1);
    SimClick('=');
    Assert.AreEqual('2', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplaySeventyFiveMinusTwelveEqualsSixtyThree;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(7);
    SimClick(5);
    SimClick('-');
    SimClick(1);
    SimClick(2);
    SimClick('=');
    Assert.AreEqual('63', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplayTwelveDividedByThreeEqualsFour;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(1);
    SimClick(2);
    SimClick('/');
    SimClick(3);
    SimClick('=');
    Assert.AreEqual('4', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DisplayTwoTimesSevenEqualsFourteen;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(2);
    SimClick('*');
    SimClick(7);
    SimClick('=');
    Assert.AreEqual('14', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.DividingByZeroIsBad;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(1);
    SimClick(2);
    SimClick('/');
    SimClick(0);
    SimClick('=');
    Assert.AreEqual(errMsg, DisplayedResult);
  end;
end;

procedure TCalculatorUITests.PerformThreeStepCalculation;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(2);
    SimClick('*');
    SimClick(7);
    SimClick('+');
    SimClick(1);
    SimClick(2);
    SimClick('-');
    SimClick(6);
    SimClick('sign');
    SimClick('=');
    Assert.AreEqual('32', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.PerformTwoStepCalculation;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(2);
    SimClick('*');
    SimClick(7);
    SimClick('+');
    SimClick(1);
    SimClick(2);
    SimClick('=');
    Assert.AreEqual('26', DisplayedResult);
  end;
end;

procedure TCalculatorUITests.RecoverFromDivideByZero;
begin
  FBridgeUI := TBridgeUI.Create;
  with FBridgeUI do
  begin
    SimClick(1);
    SimClick(2);
    SimClick('/');
    SimClick(0);
    SimClick('=');

    SimClick('clear');
    SimClick(1);
    SimClick('+');
    SimClick(1);
    SimClick('=');
    Assert.AreEqual('2', DisplayedResult);
  end;
end;
{$endregion}

initialization
  TDUnitX.RegisterTestFixture(TCalculatorUITests);
end.
