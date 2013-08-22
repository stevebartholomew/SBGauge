//
//  SBViewController.h
//  SBGaugeExample
//
//  Created by Stephen Bartholomew on 22/08/2013.
//  Copyright (c) 2013 Stephen Bartholomew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBGaugeView.h"

@interface SBViewController : UIViewController
@property (weak, nonatomic) IBOutlet SBGaugeView *pieGauge;
@property (weak, nonatomic) IBOutlet SBGaugeView *donutGauge;
@property (weak, nonatomic) IBOutlet SBGaugeView *progressGauge;
- (IBAction)up:(id)sender;
- (IBAction)down:(id)sender;
- (IBAction)play:(id)sender;

@end
