#import <Foundation/Foundation.h>
#include "control.h"
#import "SquareController.h"
 
@implementation SquareController
@synthesize length, width, area;
 
- (void)viewDidLoad {
    [super viewDidLoad];
    [length setText:@"0"];
    [width setText:@"0"];
    [area setText:@"0"];
}
 
- (IBAction)calculatearea:(id)sender {
    double areavalue = areacalc(length.text.doubleValue, width.text.doubleValue);
    [area setText:[NSString stringWithFormat:@"%lf", areavalue]];
}
@end
