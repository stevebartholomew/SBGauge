//
//  SBGaugeTest.m
//  SBGaugeSandbox
//
//  Created by Stephen Bartholomew on 03/08/2013.
//  Copyright (c) 2013 Stephen Bartholomew. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "SBGaugeContext.h"

@interface SBGaugeContextTest : SenTestCase

@end

@implementation SBGaugeContextTest
- (void) testCorrectlyStepsUp
{
  SBGaugeContext *gauge = [[SBGaugeContext alloc] initWithSegments:4.0f];
  [gauge stepUp];
  STAssertEquals(gauge.previous, 0.0f, nil);
  STAssertEquals(gauge.value, 0.25f, nil);
  
  [gauge stepUp];
  
  STAssertEquals(gauge.previous, 0.25f, nil);
  STAssertEquals(gauge.value, 0.5f, nil);
  
  [gauge stepUp];
  [gauge stepUp];
  
  STAssertEquals(gauge.previous, 0.75f, nil);
  STAssertEquals(gauge.value, 1.0f, nil);
  
  [gauge stepUp];
  STAssertEquals(gauge.previous, 1.0f, nil);
  STAssertEquals(gauge.value, 1.0f, nil);
}

- (void) testCorrectlyStepsDown
{
  SBGaugeContext *gauge = [[SBGaugeContext alloc] initWithSegments:4.0f];
  for (int i=0; i<4; i++) {
    [gauge stepUp];
  }
  [gauge stepUp];
  STAssertEquals(gauge.previous, 1.0f, nil);
  STAssertEquals(gauge.value, 1.0f, nil);
  
  [gauge stepDown];
  
  STAssertEquals(gauge.previous, 1.0f, nil);
  STAssertEquals(gauge.value, 0.75f, nil);
  
  [gauge stepDown];
  
  STAssertEquals(gauge.previous, 0.75f, nil);
  STAssertEquals(gauge.value, 0.5f, nil);
  
  [gauge stepDown];
  
  STAssertEquals(gauge.previous, 0.5f, nil);
  STAssertEquals(gauge.value, 0.25f, nil);
  
  [gauge stepDown];
  [gauge stepDown];
  STAssertEquals(gauge.previous, 0.0f, nil);
  STAssertEquals(gauge.value, 0.0f, nil);
}

@end
