//
//  GolfController.h
//  UI-Portfolio - Andrew Hale
//
//  Created by Hale, Andrew on 1/15/20.
//  Copyright © 2020 Hale, Andrew. All rights reserved.
//

#ifndef GolfController_h
#define GolfController_h

#include <stdio.h>
#import <UIKit/UIKit.h>

#define speedScale 0.20
#define speedDamping 0.90  // friction rate
#define stopSpeed 5.0 // These values simulate speed and friction

@interface GolfController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *hole;
@property (strong, nonatomic) IBOutlet UIImageView *ball; //I changed from an actual image because I wanted a more simplistic design
@property (strong, nonatomic) IBOutlet UIImageView *wall;
@property (strong, nonatomic) IBOutlet UIImageView *topBorder;
@property (strong, nonatomic) IBOutlet UIImageView *bottomBorder;
@property (strong, nonatomic) IBOutlet UIImageView *rightBorder;
@property (strong, nonatomic) IBOutlet UIImageView *leftBorder;
@property (strong, nonatomic) IBOutlet UIImageView *otherBorder;
@property (strong, nonatomic) IBOutlet UIImageView *other2Border;
@property (strong, nonatomic) IBOutlet UIImageView *portal;
@property (strong, nonatomic) IBOutlet UIImageView *portal2;
@property (strong, nonatomic) IBOutlet UIImageView *portal3;
@property (strong, nonatomic) IBOutlet UIImageView *portal4;
@property (strong, nonatomic) IBOutlet UIImageView *button;
@property (strong, nonatomic) IBOutlet UIImageView *makehole;
@property (strong, nonatomic) IBOutlet UIImageView *nextlevel;
@property (strong, nonatomic) IBOutlet UIImageView *secretbutton;
@property (strong, nonatomic) IBOutlet UIImageView *circle;
@property (strong, nonatomic) IBOutlet UIImageView *startspot;
@property (strong, nonatomic) IBOutlet UIImageView *water;

@property (strong, nonatomic) IBOutlet UITextField *won;
@property (strong, nonatomic) IBOutlet UIButton *nextLevel;

@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) float ballVelocityX;
@property (nonatomic) float ballVelocityY;
@property (nonatomic) CGRect lastRect;

@property (strong, nonatomic) NSTimer *gameTimer;


@end

#endif /* GolfController_h */
