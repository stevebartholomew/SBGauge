//
//  SBGaugeContext.m
//  SBGauge
//
//  Created by Stephen Bartholomew on 29/07/2013.
//  Copyright (c) 2013 Stephen Bartholomew. All rights reserved.
//

#import "SBGaugeContext.h"

@interface SBGaugeContext()
@property float numberOfSegments;
@property float segmentSize;
@end

@implementation SBGaugeContext

@synthesize numberOfSegments, segmentSize, step, previous, value;

- (id)initWithSegments:(float) segments initialStep:(int) initialStep
{
  numberOfSegments = segments;
  segmentSize = 1.0 / numberOfSegments;
  step = initialStep;
  [self updateValue];
  previous = value;
  
  return self;
}

- (void) updateValue
{
  self.value = segmentSize * (float)step;
}

- (void)stepUp
{
  previous = value;
  
  if(step != numberOfSegments) {
    step = step + 1;
    
    [self updateValue];
  }
}

- (void)stepDown
{
  previous = value;
  
  if(step != 0) {
    step = step - 1;
    [self updateValue];
  }
}

@end
