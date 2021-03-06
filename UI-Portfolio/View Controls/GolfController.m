//
//  GolfController.m
//  UI-Portfolio - Andrew Hale
//
//  Created by Hale, Andrew on 1/15/20.
//  Copyright © 2020 Hale, Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GolfController.h"
@implementation GolfController
@synthesize ball, hole, secretbutton, won, nextLevel;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"touches Began");
  UITouch *touch = [touches anyObject];
  // turn user interaction off as swipe begins
  [self.view setUserInteractionEnabled:NO];
   
  // store point a touch began
  self.firstPoint = [touch locationInView:self.view];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // changes hole image to be circular
    self.hole.layer.cornerRadius = .5*self.hole.layer.frame.size.height;
    self.hole.layer.masksToBounds = YES;
    self.ball.layer.cornerRadius = .5*self.ball.layer.frame.size.height;
    self.ball.layer.masksToBounds = YES;
}

/*
 Automatic action that occus when user releases at end of swipe
*/
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"touches Ended");
   
  UITouch *touch = [touches anyObject];
   
  // store point a touch end
  self.lastPoint = [touch locationInView:self.view];
   
  // logic to calculate swipevector as distance between touch began and touch end
  CGPoint swipeVector = CGPointMake(self.lastPoint.x - self.firstPoint.x, self.lastPoint.y - self.firstPoint.y);
   
  // velocity of ball based off of swipe
  self.ballVelocityX = speedScale * swipeVector.x;
  self.ballVelocityY = speedScale * swipeVector.y;
   
  // move ball occurs multiple times at this sampling rate, until friction causes ball to stop
  self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}
/*
 Changes center of ball, which is connected to outlet, this is called recursively by timer
*/
-(void)moveBall {
  // simulates friction by reducing velocity
  self.ballVelocityX = speedDamping * self.ballVelocityX;
  self.ballVelocityY = speedDamping * self.ballVelocityY;
   
  // this is the ball move
  self.ball.center = CGPointMake(self.ball.center.x + self.ballVelocityX, self.ball.center.y + self.ballVelocityY);
   
  // logic to calculate if ball and hole collide
  if (CGRectIntersectsRect(self.ball.frame, self.hole.frame)) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
    self.ball.center = CGPointMake(self.hole.center.x, self.hole.center.y);
    self.ball.alpha = 0.2;
    self.nextlevel.center = CGPointMake(self.secretbutton.center.x, self.secretbutton.center.y);
  }
    
   if (CGRectIntersectsRect(self.ball.frame, self.wall.frame))
   {
     self.ballVelocityX = (1) * speedDamping * self.ballVelocityX;
     self.ballVelocityY = (-1) * speedDamping * self.ballVelocityY;
   }
   
   if (CGRectIntersectsRect(self.ball.frame, self.topBorder.frame) && !CGRectEqualToRect(self.lastRect, self.topBorder.frame)) //make ball not stick to wall
   {
       self.lastRect = self.topBorder.frame;
     self.ballVelocityX = (1) * speedDamping * self.ballVelocityX;
     self.ballVelocityY = (-1) * speedDamping * self.ballVelocityY;
    }
   if (CGRectIntersectsRect(self.ball.frame, self.rightBorder.frame) && !CGRectEqualToRect(self.lastRect, self.rightBorder.frame))
   {
       self.lastRect = self.rightBorder.frame;
     self.ballVelocityX = (-1) * speedDamping * self.ballVelocityX;
     self.ballVelocityY = (1) * speedDamping * self.ballVelocityY;
    }
   if (CGRectIntersectsRect(self.ball.frame, self.leftBorder.frame) && !CGRectEqualToRect(self.lastRect, self.leftBorder.frame))
   {
       self.lastRect = self.leftBorder.frame;
     self.ballVelocityX = (-1) * speedDamping * self.ballVelocityX;
     self.ballVelocityY = (1) * speedDamping * self.ballVelocityY;
    }
    if (CGRectIntersectsRect(self.ball.frame, self.bottomBorder.frame) && !CGRectEqualToRect(self.lastRect, self.bottomBorder.frame))
    {
        self.lastRect = self.bottomBorder.frame;
     self.ballVelocityX = (1) * speedDamping * self.ballVelocityX;
     self.ballVelocityY = (-1) * speedDamping * self.ballVelocityY;
    }
    
    if (CGRectIntersectsRect(self.ball.frame, self.otherBorder.frame) && !CGRectEqualToRect(self.lastRect, self.otherBorder.frame))
      {
          self.lastRect = self.otherBorder.frame;
       self.ballVelocityX = (1) * speedDamping * self.ballVelocityX;
       self.ballVelocityY = (-1) * speedDamping * self.ballVelocityY;
      }
    
    if (CGRectIntersectsRect(self.ball.frame, self.other2Border.frame) && !CGRectEqualToRect(self.lastRect, self.other2Border.frame))
         {
             self.lastRect = self.other2Border.frame;
             self.ballVelocityX = (-1) * speedDamping * self.ballVelocityX;
             self.ballVelocityY = (1) * speedDamping * self.ballVelocityY;
         }
    
   if(CGRectIntersectsRect(self.ball.frame, self.wall.frame)) {
    // simulates friction by reducing velocity
     self.ballVelocityX = (1) * speedDamping * self.ballVelocityX;
     self.ballVelocityY = (-1) * speedDamping * self.ballVelocityY;
   }
    
    if (CGRectIntersectsRect(self.ball.frame, self.portal.frame)) {
      self.ball.center = CGPointMake(self.portal2.center.x, self.portal2.center.y);
    }
    
    if (CGRectIntersectsRect(self.ball.frame, self.portal3.frame)) {
      self.ball.center = CGPointMake(self.portal4.center.x, self.portal4.center.y);
    }
    
    if (CGRectIntersectsRect(self.ball.frame, self.button.frame)) {
        self.hole.center = CGPointMake(self.makehole.center.x, self.makehole.center.y);
        self.circle.center = CGPointMake(self.makehole.center.x, self.makehole.center.y);
    }
    
    if (CGRectIntersectsRect(self.ball.frame, self.water.frame)) {
        self.ball.center = CGPointMake(self.startspot.center.x, self.startspot.center.y);
        self.ballVelocityX = 0;
        self.ballVelocityY = 0;
      }
    
    if
    (CGRectIntersectsRect(self.ball.frame, self.hole.frame)) {
     [self.gameTimer invalidate];
     [self.view
      setUserInteractionEnabled:YES];
     self.ball.center = CGPointMake(self.hole.center.x, self.hole.center.y);
     self.ball.alpha = 0.2;
     won.text = [NSString stringWithFormat:@"You won!"];
     nextLevel.hidden = FALSE;
    }
    
  // if ball slows/stops turn off game timer and turn user interaction back on
  if(fabs(self.ballVelocityX) < stopSpeed && fabs(self.ballVelocityY) < stopSpeed) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
  }
}

@end
