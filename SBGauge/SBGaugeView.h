//
//  SBGaugeView.h
//  SBGauge
//
//  Created by Stephen Bartholomew on 03/08/2013.
//  Copyright (c) 2013 Stephen Bartholomew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SBGaugeContext.h"

@interface SBGaugeView : UIView

/**
 Initializes a gauge view with configuration.
 
 @param segments Number of segments to split the gauge bar into
 @param width The width of the gauge bar
 @param gaugeColor The color of the gauge bar
 @param trackColor The track color that appears under the gauge bar
 */
- (id) initWithSegments: (int) segments
                  width: (float) width
        gaugeColor: (UIColor *) gaugeColor
        trackColor: (UIColor *) trackColor;

/**
 Updates a gauge view with configuration.
 
 @param segments Number of segments to split the gauge bar into
 @param width The width of the gauge bar
 @param gaugeColor The color of the `gauge bar
 @param trackColor The track color that appears under the gauge bar
 */
- (void) updateSegments: (int) segments
                         width: (float) width
               gaugeColor: (UIColor *) gaugeColor
               trackColor: (UIColor *) trackColor;

/**
 Increase the gauge by 1 segment
 */
- (void) stepUp;

/**
 Decrease the gauge by 1 segment
 */
- (void) stepDown;

@property int segments;
@property float width;
@property UIColor *gaugeColor;
@property UIColor *trackColor;

@end