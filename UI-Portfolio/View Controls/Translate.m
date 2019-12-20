//
//  Translate.m
//  UI-Portfolio - Andrew Hale
//
//  Created by Hale, Andrew on 12/16/19.
//  Copyright © 2019 Hale, Andrew. All rights reserved.
//

#include "control.h"
#import "Translate.h"

@implementation Translate

@synthesize input, pigl, sh, flip;

- (IBAction)translateIt:(id)sender {
  const char *cInput = [input.text UTF8String];
  long inputLength = input.text.length;
    // pig latin
  pigl.text = [NSString stringWithFormat:@"%s" , revXArray((char*)cInput, inputLength)];
    // short hand
  sh.text = [NSString stringWithFormat:@"%s" , revXRecurse((char*)cInput, inputLength)];
    // other
  flip.text = [NSString stringWithFormat:@"%s" , revXPointer((char*)cInput, inputLength)];
}
@end
