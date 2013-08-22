//
//  SBGaugeViewTest.m
//  SBGauge
//
//  Created by Stephen Bartholomew on 21/08/2013.
//  Copyright (c) 2013 Stephen Bartholomew. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "SBGaugeView.h"

@interface SBGaugeViewTest : SenTestCase

@end

@implementation SBGaugeViewTest

- (void) testInitWithConfiguration
{
  int segments = 10;
  float width = 20.0;
  UIColor *gaugeColor = [UIColor redColor];
  UIColor *trackColor = [UIColor greenColor];
  
  SBGaugeView *gaugeView = [[SBGaugeView alloc] initWithSegments:segments
                                                           width:width
                                                      gaugeColor:gaugeColor
                                                      trackColor:trackColor];
  
  STAssertEquals(gaugeView.segments, segments, nil);
  STAssertEquals(gaugeView.width, width, nil);
  STAssertEquals(gaugeView.gaugeColor, gaugeColor, nil);
  STAssertEquals(gaugeView.trackColor, trackColor, nil);
}

@end
