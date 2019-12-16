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

- (IBAction)reverseIt:(id)sender {
  const char *cInput = [input.text UTF8String];
  long inputLength = input.text.length;
  // Method 1 - Array method
  revArray.text = [NSString stringWithFormat:@"%s" , revXArray((char*)cInput, inputLength)];
  // Method 2 - Recurse method
  revRecurse.text = [NSString stringWithFormat:@"%s" , revXRecurse((char*)cInput, inputLength)];
  // Method 3 - Pointer method
  revPointer.text = [NSString stringWithFormat:@"%s" , revXPointer((char*)cInput, inputLength)];
  // Method 4 - Palindrome evaluation
  palindromeEvaluation.text = [NSString stringWithFormat:@"%s", paliEval((char*)cInput, inputLength)];
}
@end
