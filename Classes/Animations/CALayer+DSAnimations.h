//
//  CALayer+DSGraphics.h
//
//  Copyright (c) 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

/** 
 Convenience methods for CALayer animations. 
 */
@interface CALayer (DSAnimations)

/** 
 Start a quick pop up animation on the receiver. 
 */
- (void)addPopUpAnimation;

@end
