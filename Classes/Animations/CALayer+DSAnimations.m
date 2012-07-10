//
//  CALayer+DSGraphics.m
//
//  Copyright (c) 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import "CALayer+DSAnimations.h"

@implementation CALayer (DSAnimations)

- (void)addPopUpAnimation
{
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
	CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
	CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
	CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
	CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
	NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    
	[animation setValues:frameValues];
    
	NSArray *frameTimes = [NSArray arrayWithObjects:
	                       [NSNumber numberWithFloat:0.0],
	                       [NSNumber numberWithFloat:0.5],
	                       [NSNumber numberWithFloat:0.9],
	                       [NSNumber numberWithFloat:1.0],
	                       nil];
	[animation setKeyTimes:frameTimes];
    
	animation.fillMode = kCAFillModeForwards;
	animation.duration = .25;
    
	[self addAnimation:animation forKey:@"DSPopUpAnimation"];
}

@end

