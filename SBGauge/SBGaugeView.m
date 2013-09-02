//
//  SBGaugeView.m
//  SBGauge
//
//  Created by Stephen Bartholomew on 03/08/2013.
//  Copyright (c) 2013 Stephen Bartholomew. All rights reserved.
//

#import "SBGaugeView.h"

@interface SBGaugeView()
@property CAShapeLayer *gaugeLayer;
@property SBGaugeContext *gauge;
@end

@implementation SBGaugeView

@synthesize gaugeLayer, gauge;

- (id) initWithSegments:(int)segments width:(float)width gaugeColor:(UIColor *)gaugeColor trackColor:(UIColor *)trackColor
{
  self = [self init];
  
  [self updateSegments:segments width:width gaugeColor:gaugeColor trackColor:trackColor];
  
  return self;
}

- (void) updateSegments:(int)segments width:(float)width gaugeColor:(UIColor *)gaugeColor trackColor:(UIColor *)trackColor
{
  self.segments = segments;
  self.width = width;
  self.gaugeColor = gaugeColor;
  self.trackColor = trackColor;
  
  [self draw];
}

- (void)stepUp
{
  [gauge stepUp];
  [self animateProgress];
}

- (void)stepDown
{
  [gauge stepDown];
  [self animateProgress];
}

- (void)draw
{
  gauge = [[SBGaugeContext alloc] initWithSegments:self.segments];
  
  gaugeLayer = [self drawCircleLayer:self.gaugeColor];
  
  CAShapeLayer *trackLayer = [self drawCircleLayer:self.trackColor];

  [self.layer addSublayer:trackLayer];
  [self.layer addSublayer:gaugeLayer];
}

- (void)drawRect:(CGRect)rect
{
  [self animateProgress];
}

- (void)animateProgress
{
  gaugeLayer.strokeEnd = gauge.value;
  
  CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  drawAnimation.duration            = 0.2; // "animate over 10 seconds or so.."
  drawAnimation.repeatCount         = 1.0;  // Animate only once..
  drawAnimation.removedOnCompletion = NO;   // Remain stroked after the animation..
  
  // Animate from no part of the stroke being drawn to the entire stroke being drawn
  drawAnimation.fromValue = [NSNumber numberWithFloat:gauge.previous];
  drawAnimation.toValue   = [NSNumber numberWithFloat:gauge.value];
  
  // Experiment with timing to get the appearence to look the way you want
  drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  
  // Add the animation to the circle
  [gaugeLayer addAnimation:drawAnimation forKey:nil];
}

- (CAShapeLayer *) drawCircleLayer:(UIColor *)color
{
  CGFloat radius = (MIN(self.frame.size.width,self.frame.size.height)/2)+40;
  CGFloat inset  = self.width/2;
  
  CAShapeLayer *circleLayer = [CAShapeLayer layer];
  circleLayer.fillColor = [UIColor clearColor].CGColor;
  circleLayer.strokeColor = color.CGColor;
  circleLayer.lineWidth = self.width;
  circleLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.bounds, inset, inset)
                                                cornerRadius:radius-inset].CGPath;
  return circleLayer;
}
@end
