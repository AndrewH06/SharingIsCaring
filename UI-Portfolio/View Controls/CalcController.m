

#import "CalcController.h"

//@interface ViewController ()
//@end

@implementation CalcController // beginning of implementation

// syntesize enables getter and setter methods as used in Obj-C
@synthesize initialCalcAreaInputState, calcAreaDefault, calcAreaNumber, calcAreaLabel;

- (void)viewDidLoad {  // acts like a Constructor
    [super viewDidLoad];
    /* Call to method to initialize calculator (set to zero) */
    [self clearCalculator];
    /* Default value for Calculator Area label */
    [self setCalcAreaDefault:@"0"];
    /* Call out to method to handle updating Calculator Area Label display */
    [self clearCalcAreaLabel];
}

/* Section 1: Methods for managing and performing calculation, C style used where practical */
-(void)calculateAnswer  // method to perform calculation
{
    // arg2 = [calcAreaNumber doubleValue];  // Obj-C Class method to convert NSSTRING to double
    arg2 = calcAreaNumber.doubleValue;  // Alternate Java like syntax to convert NSSTRING to double
    switch(mathOp)
    {
        case PLUS:
            calcAnswer = arg1 + arg2;
            break;
        case MINUS:
            calcAnswer = arg1 - arg2;
            break;
        case DIVIDE:
            calcAnswer = arg1 / arg2;
            break;
        case MULTIPLY:
            calcAnswer = arg1 * arg2;
            break;
        case MODULO:
            calcAnswer = (double)((int)arg1 % (int)arg2);
            break;
        case EXPONENT:
            calcAnswer = (double) pow(arg1,arg2);
            break;
        case SQRT:
            calcAnswer = sqrt(arg1);
            break;
        case -1:
            calcAnswer = arg1;
    }
}

-(void)saveValueOfArg1 { // method to store 1st value in calculation (arg1), C style
    // arg1 = [calcAreaNumber doubleValue];  // Obj-C Class method to convert NSSTRING to double
    arg1 = calcAreaNumber.doubleValue;  // Alternate Java like syntax to convert NSSTRING to double
}

-(void)saveValueofAnswer {  // method to save value of answer after calc to arg1
    mathOp = -1;          // operator is unassigned after calc
    arg1 = calcAnswer;      // arg1 is current display value
    arg2 = 0;             // arg2 is now unassigned
}

-(void)saveValueOfOperator:(int)opNumber {  // method to retain value of operator
    mathOp = opNumber;
}

-(void)clearCalculator {                    // method to clear values of calculator p
    mathOp = -1;
    arg1 = 0;
    arg2 = 0;
    calcAnswer = 0;
}
/* End Section 1 */

/* Section 2:  View Control helper methods to manage Calculation Area */
-(void)setTextCalcAreaLabel {  // helper method to set and thus update text in Calc Area
    [calcAreaLabel setText:calcAreaNumber];
}

-(void)concatCalcAreaLabel:(NSString *)keyNumber {  // helper method for handling number being input
    if (initialCalcAreaInputState) {  // sets number vs concat on initial key typed
        [self setCalcAreaNumber:keyNumber];
        [self setInitialCalcAreaInputState:false];
    } else  {                         // concats number ot end on subsequent keys typed
        [self setCalcAreaNumber:[calcAreaNumber stringByAppendingString:keyNumber]];
    }
    [self setTextCalcAreaLabel];
}

-(void)clearCalcAreaLabel {  // helper method to clear and update text in Calc Area to default
    [self setCalcAreaNumber:calcAreaDefault];
    [self setInitialCalcAreaInputState:true];  // set calc area state to starting state
    [self setTextCalcAreaLabel];
}
/* End Section 2 */


// Section 3: Interface Builder actions for buttons
-(IBAction)equalButton:(id)sender {  // Interface Builder action for equal (calculation)
    // perform calculation
    [self calculateAnswer];
    
    // set and display result
    [self setCalcAreaNumber:[NSString stringWithFormat:@"%f", calcAnswer]];  // float (double) to string
    [self setTextCalcAreaLabel];
    
    // set values to support continued calculations, but wipe if you type a number
    [self saveValueofAnswer];                   // answer -> arg1
    [self setInitialCalcAreaInputState:true];   // number key typing will wipe value
}

-(IBAction)clearButton:(id)sender { // Interface Builder action for clear (clean calculator)
    [self clearCalculator];          // clear operator
    [self clearCalcAreaLabel];
}

// Interface Builder for operators buttons
-(IBAction)plusButton:(id)sender {  // Interface Builder action for plus (+)
    [self saveValueOfOperator:PLUS];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}

-(IBAction)minusButton:(id)sender {  // Interface Builder action for minus (-)
    [self saveValueOfOperator:MINUS];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}

-(IBAction)divideButton:(id)sender {  // Interface Builder action for divide (/)
    [self saveValueOfOperator:DIVIDE];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}

-(IBAction)multiplyButton:(id)sender {  // Interface Builder action for multiply (*)
    [self saveValueOfOperator:MULTIPLY];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}

-(IBAction)moduloButton:(id)sender {  // Interface Builder action for modulo (%)
    [self saveValueOfOperator:MODULO];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}

-(IBAction)exponentButton:(id)sender {  // Interface Builder action for exponent (^)
    [self saveValueOfOperator:EXPONENT];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}

-(IBAction)sqrtButton:(id)sender {  // Interface Builder action for square root
    [self saveValueOfOperator:SQRT];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
    
    [self calculateAnswer];
    [self setCalcAreaNumber:[NSString stringWithFormat:@"%f", calcAnswer]];
    [self setTextCalcAreaLabel];
    [self saveValueofAnswer];                   // answer -> arg1
    [self setInitialCalcAreaInputState:true];
}

// Interface Builder actions  for numbers and decimal
-(IBAction)press9Button:(id)sender {  // Interface Builder action for (9)
    NSString *keyNumber = @"9";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)press8Button:(id)sender {  // Interface Builder action for (8)
    NSString *keyNumber = @"8";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)press7Button:(id)sender {  // Interface Builder action for (7)
    NSString *keyNumber = @"7";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)press6Button:(id)sender {  // Interface Builder action for (6)
    NSString *keyNumber = @"6";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)press5Button:(id)sender {  // Interface Builder action for (5)
    NSString *keyNumber = @"5";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)press4Button:(id)sender {  // Interface Builder action for (4)
    NSString *keyNumber = @"4";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)press3Button:(id)sender {  // Interface Builder action for (3)
    NSString *keyNumber = @"3";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)press2Button:(id)sender {  // Interface Builder action for (2)
    NSString *keyNumber = @"2";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)press1Button:(id)sender {  // Interface Builder action for (1)
    NSString *keyNumber = @"1";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)press0Button:(id)sender {  // Interface Builder action for (0)
    NSString *keyNumber = @"0";
    [self concatCalcAreaLabel:keyNumber];
}

-(IBAction)pressDecimalButton:(id)sender {  // Interface Builder action for (.)
    NSString *keyNumber = @".";
    [self concatCalcAreaLabel:keyNumber];
}

/* End Section 2 */


@end  // End of Implementation
