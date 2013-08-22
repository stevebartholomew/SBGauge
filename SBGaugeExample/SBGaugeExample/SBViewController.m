//
//  SBViewController.m
//  SBGaugeExample
//
//  Created by Stephen Bartholomew on 22/08/2013.
//  Copyright (c) 2013 Stephen Bartholomew. All rights reserved.
//

#import "SBViewController.h"

@interface SBViewController ()

@property int currentProgressStep;
@property NSTimer *timer;

@end

@implementation SBViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.19 alpha:1.0];
  UIColor *gaugeColor = [UIColor colorWithRed:0.87 green:0.49 blue:0.16 alpha:1.0];
  UIColor *trackColor = [UIColor colorWithRed:0.14 green:0.14 blue:0.14 alpha:1.0];
  
	// Do any additional setup after loading the view, typically from a nib.
  [self.donutGauge updateSegments:6
                            width:20.0
                       gaugeColor:gaugeColor
                       trackColor:trackColor];
  
  [self.pieGauge updateSegments:6
                            width:self.donutGauge.frame.size.width/2.0
                       gaugeColor:gaugeColor
                       trackColor:trackColor];
  
  [self.progressGauge updateSegments:50
                          width:2.0
                     gaugeColor:gaugeColor
                     trackColor:trackColor];
  self.currentProgressStep = 1;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)up:(id)sender {
  [self.donutGauge stepUp];
  [self.pieGauge stepUp];
}

- (IBAction)down:(id)sender {
  [self.donutGauge stepDown];
  [self.pieGauge stepDown];
}

- (IBAction)play:(id)sender {
  self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2
                                           target:self
                                         selector:@selector(increaseProgressGauge)
                                         userInfo:nil
                                          repeats:YES];
}

- (void) increaseProgressGauge {
  [self.progressGauge stepUp];
  self.currentProgressStep += 1;
  if(self.currentProgressStep >= 50) {
    [self.timer invalidate];
    self.timer = nil;
  }
}
@end
