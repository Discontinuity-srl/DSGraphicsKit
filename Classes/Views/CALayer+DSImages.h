//
//  CALayer+CALayer_DSGraphicsImages.h
//
//  Copyright (c) 2012 Discontinuity s.r.l. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

/** 
 Simple convenience category. 
 */
@interface CALayer (DSImages)

/** 
 Returns the rendered image of the layer. 
 
 It has the same limitations of [CALayer renderInContext:]. 
 */
- (UIImage *)imageFromLayer;


/**
 Adds a layer with a trasparent image in the top left coner of the receiver.
 
 Useful to avoid aliasing problems as it forces CoreAnimatio to rasterize a 
 bigger portion of the layer-
 */

- (void)addAntialisingTopLeftHack;

@end
