unit uCalculatorTests;

interface
uses
  DUnitX.TestFramework, uCalculatorUI;

type

  [TestFixture]
  TCalculatorUITests = class(TObject)
  private
    FCalculatorUI: TfrmCalculator;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
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
    procedure DisplayTwoTimesSevenEqualsFourteen;

    [Ignore]
    procedure DisplayTwelveDividedByThreeEqualsFour;

    [Ignore]
    procedure DisplaySeventyFiveMinusTwelveEqualsSixtyThree;

    [Ignore]
    procedure PerformTwoStepCalculation;

    [Ignore]
    procedure PerformThreeStepCalculation;

    [Ignore]
    procedure DividingByZeroIsBad;

    [Ignore]
    procedure RecoverFromDivideByZero;
  end;

implementation
uses VCL.Forms;

procedure TCalculatorUITests.Setup;
begin
  FCalculatorUI := TfrmCalculator.Create(nil);
end;

procedure TCalculatorUITests.TearDown;
begin
  FCalculatorUI.Free;
end;

procedure TCalculatorUITests.DisplayEqualsAllTenDigitsOneTime;
begin
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btn3.Click;
  FCalculatorUI.btn4.Click;
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btn7.Click;
  FCalculatorUI.btn8.Click;
  FCalculatorUI.btn9.Click;
  FCalculatorUI.btn0.Click;
  Assert.AreEqual('1234567890',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplayCorrectValueAfterClearingOldValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btnDecimal.Click;
  FCalculatorUI.btn3.Click;
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btnSign.Click;
  FCalculatorUI.btnClr.Click;

  FCalculatorUI.btn1.Click;
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btn1.Click;
  Assert.AreEqual('111',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplayCorrectValueAfterErasingPartOfValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btnDecimal.Click;
  FCalculatorUI.btn3.Click;
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btnSign.Click;

  FCalculatorUI.btnBackSpace.Click;
  FCalculatorUI.btn9.Click;
  FCalculatorUI.btn5.Click;
  Assert.AreEqual('-56.395',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplayEqualsEnteredNegativeFloatValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btnDecimal.Click;
  FCalculatorUI.btn3.Click;
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btnSign.Click;
  Assert.AreEqual('-56.35',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplayEqualsEnteredNegativeWholeValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btnSign.Click;
  Assert.AreEqual('-56',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplayEqualsEnteredPositiveFloatValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btnDecimal.Click;
  FCalculatorUI.btn3.Click;
  FCalculatorUI.btn5.Click;
  Assert.AreEqual('56.35',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplayEqualsEnteredPositiveWholeValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  Assert.AreEqual('56',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplayOnePlusOneEqualsTwo;
begin
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btnPlus.Click;
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btnEquals.Click;
  Assert.AreEqual('2',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplaySeventyFiveMinusTwelveEqualsSixtyThree;
begin
  FCalculatorUI.btn7.Click;
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btnMinus.Click;
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btnEquals.Click;
  Assert.AreEqual('63',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplayTwelveDividedByThreeEqualsFour;
begin
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btnDivide.Click;
  FCalculatorUI.btn3.Click;
  FCalculatorUI.btnEquals.Click;
  Assert.AreEqual('4',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DisplayTwoTimesSevenEqualsFourteen;
begin
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btnMultiply.Click;
  FCalculatorUI.btn7.Click;
  FCalculatorUI.btnEquals.Click;
  Assert.AreEqual('14',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.DividingByZeroIsBad;
begin
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btnDivide.Click;
  FCalculatorUI.btn0.Click;
  FCalculatorUI.btnEquals.Click;
  Assert.AreEqual(FCalculatorUI.errMsg,FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.PerformThreeStepCalculation;
begin
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btnMultiply.Click;
  FCalculatorUI.btn7.Click;
  FCalculatorUI.btnPlus.Click;
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btnMinus.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btnSign.Click;
  FCalculatorUI.btnEquals.Click;
  Assert.AreEqual('32',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.PerformTwoStepCalculation;
begin
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btnMultiply.Click;
  FCalculatorUI.btn7.Click;
  FCalculatorUI.btnPlus.Click;
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btnEquals.Click;
  Assert.AreEqual('26',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorUITests.RecoverFromDivideByZero;
begin
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btn2.Click;
  FCalculatorUI.btnDivide.Click;
  FCalculatorUI.btn0.Click;
  FCalculatorUI.btnEquals.Click;

  FCalculatorUI.btnClr.Click;
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btnPlus.Click;
  FCalculatorUI.btn1.Click;
  FCalculatorUI.btnEquals.Click;
  Assert.AreEqual('2',FCalculatorUI.edtDisplay.Text);
end;

initialization
  TDUnitX.RegisterTestFixture(TCalculatorUITests);
end.
