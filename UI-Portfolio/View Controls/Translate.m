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
    // rev
  flip.text = [NSString stringWithFormat:@"%s" , flipPhrase(input.text.UTF8String)];
}

@end
