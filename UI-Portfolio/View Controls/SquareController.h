//
//  SquareControlelr.h
//  UI-Portfolio
//
//  Created by Hale, Andrew on 11/13/19.
//  Copyright © 2019 Hale, Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SquareController : UIViewController

@property(weak, nonatomic) IBOutlet UITextField *length;
@property(weak, nonatomic) IBOutlet UITextField *width;
@property (strong, nonatomic) IBOutlet UILabel *area;

@end
