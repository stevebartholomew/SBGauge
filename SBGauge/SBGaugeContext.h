//
//  SBGaugeContext.h
//  SBGauge
//
//  Created by Stephen Bartholomew on 29/07/2013.
//  Copyright (c) 2013 Stephen Bartholomew. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SBGaugeContext : NSObject

@property int step;

@property float previous;
@property float value;

- (id)initWithSegments:(float) segments;
- (void) stepUp;
- (void) stepDown;

@end

