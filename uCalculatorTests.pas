unit uCalculatorTests;

interface
uses
  DUnitX.TestFramework, uCalculatorUI;

type

  [TestFixture]
  TCalculatorTests = class(TObject)
  private
    FCalculatorUI: TfrmCalculator;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure DisplayEqualsAllTenDigitsOneTime;
    [Test]
    procedure DisplayEqualsEnteredPositiveWholeValue;
    [Test]
    procedure DisplayEqualsEnteredPositiveFloatValue;
    [Test]
    procedure DisplayEqualsEnteredNegativeWholeValue;
    [Test]
    procedure DisplayEqualsEnteredNegativeFloatValue;
    [Test]
    procedure DisplayCorrectValueAfterClearingOldValue;
    [Test]
    procedure DisplayCorrectValueAfterErasingPartOfValue;
  end;

implementation
uses VCL.Forms;

procedure TCalculatorTests.Setup;
begin
  FCalculatorUI := TfrmCalculator.Create(nil);
end;

procedure TCalculatorTests.TearDown;
begin
  FCalculatorUI.Free;
end;

procedure TCalculatorTests.DisplayEqualsAllTenDigitsOneTime;
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

procedure TCalculatorTests.DisplayCorrectValueAfterClearingOldValue;
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

procedure TCalculatorTests.DisplayCorrectValueAfterErasingPartOfValue;
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

procedure TCalculatorTests.DisplayEqualsEnteredNegativeFloatValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btnDecimal.Click;
  FCalculatorUI.btn3.Click;
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btnSign.Click;
  Assert.AreEqual('-56.35',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorTests.DisplayEqualsEnteredNegativeWholeValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btnSign.Click;
  Assert.AreEqual('-56',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorTests.DisplayEqualsEnteredPositiveFloatValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  FCalculatorUI.btnDecimal.Click;
  FCalculatorUI.btn3.Click;
  FCalculatorUI.btn5.Click;
  Assert.AreEqual('56.35',FCalculatorUI.edtDisplay.Text);
end;

procedure TCalculatorTests.DisplayEqualsEnteredPositiveWholeValue;
begin
  FCalculatorUI.btn5.Click;
  FCalculatorUI.btn6.Click;
  Assert.AreEqual('56',FCalculatorUI.edtDisplay.Text);
end;

initialization
  TDUnitX.RegisterTestFixture(TCalculatorTests);
end.
