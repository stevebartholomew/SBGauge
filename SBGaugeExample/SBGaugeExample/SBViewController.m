//
//  SBViewController.m
//  SBGaugeExample
//
//  Created by Stephen Bartholomew on 22/08/2013.
//  Copyright (c) 2013 Stephen Bartholomew. All rights reserved.
//

#import "SBViewController.h"

@interface SBViewController ()

@end

@implementation SBViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self.gauge updateSegments:100 width:20.0 gaugeColor:[UIColor redColor] trackColor:[UIColor greenColor]];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)up:(id)sender {
  [self.gauge stepUp];
}

- (IBAction)down:(id)sender {
  [self.gauge stepDown];
}
@end
