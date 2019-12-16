
#include "control.h"
#import "PythagController.h"

@implementation PythagController
@synthesize side1, side2, side3;

- (void)viewDidLoad {
    [super viewDidLoad];
    [side1 setText:@"0"];
    [side2 setText:@"0"];
    [side3 setText:@"0"];
}

- (IBAction)calculate:(id)sender {
    double side3calc = hypotenuse(side1.text.doubleValue, side2.text.doubleValue);
    [side3 setText:[NSString stringWithFormat:@"%lf", side3calc]];
}
@end
