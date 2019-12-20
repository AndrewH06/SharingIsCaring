//
//  ArraySwap.m
//  UI-Portfolio - Andrew Hale
//
//  Created by Hale, Andrew on 12/3/19.
//  Copyright © 2019 Hale, Andrew. All rights reserved.
//

#include "control.h"
#import "ArraySwap.h"

@implementation ArraySwap

@synthesize revArray, revRecurse, revPointer, palindromeEvaluation, input;

- (IBAction)transl:(id)sender {
  const char *cInput = [input.text UTF8String];
  long inputLength = input.text.length;
  // array method
  revArray.text = [NSString stringWithFormat:@"%s" , revXArray((char*)cInput, inputLength)];
  // recurse method
  revRecurse.text = [NSString stringWithFormat:@"%s" , revXRecurse((char*)cInput, inputLength)];
  // pointer method
  revPointer.text = [NSString stringWithFormat:@"%s" , revXPointer((char*)cInput, inputLength)];
  // palindrome evaluation
  palindromeEvaluation.text = [NSString stringWithFormat:@"%s", paliEval((char*)cInput, inputLength)];
}
@end
