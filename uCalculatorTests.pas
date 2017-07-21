unit uCalculatorTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TCalculatorTest = class(TObject) 
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
    procedure DisplayResultOfFloatingPointDivision;

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

implementation
uses uCalculator;

{ TCalculatorTest }

procedure TCalculatorTest.DisplayCorrectValueAfterClearingOldValue;
var Calculator: ICalculator;
begin
  Calculator := TCalculator.Create;

end;

procedure TCalculatorTest.DisplayCorrectValueAfterErasingPartOfValue;
begin

end;

procedure TCalculatorTest.DisplayEqualsAllTenDigitsOneTime;
begin

end;

procedure TCalculatorTest.DisplayEqualsEnteredNegativeFloatValue;
begin

end;

procedure TCalculatorTest.DisplayEqualsEnteredNegativeWholeValue;
begin

end;

procedure TCalculatorTest.DisplayEqualsEnteredPositiveFloatValue;
begin

end;

procedure TCalculatorTest.DisplayEqualsEnteredPositiveWholeValue;
begin

end;

procedure TCalculatorTest.DisplayOnePlusOneEqualsTwo;
begin

end;

procedure TCalculatorTest.DisplayResultOfFloatingPointDivision;
begin

end;

procedure TCalculatorTest.DisplaySeventyFiveMinusTwelveEqualsSixtyThree;
begin

end;

procedure TCalculatorTest.DisplayTwelveDividedByThreeEqualsFour;
begin

end;

procedure TCalculatorTest.DisplayTwoTimesSevenEqualsFourteen;
begin

end;

procedure TCalculatorTest.DividingByZeroIsBad;
begin

end;

procedure TCalculatorTest.PerformThreeStepCalculation;
begin

end;

procedure TCalculatorTest.PerformTwoStepCalculation;
begin

end;

procedure TCalculatorTest.RecoverFromDivideByZero;
begin

end;

initialization
  TDUnitX.RegisterTestFixture(TCalculatorTest);
end.
