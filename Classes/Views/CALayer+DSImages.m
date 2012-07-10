//
//  CALayer+CALayer_DSGraphicsImages.m
//
//  Copyright (c) 2012 Discontinuity s.r.l. All rights reserved.
//

#import "CALayer+DSImages.h"

@implementation CALayer (DSImages)

- (UIImage *)imageFromLayer;
{
	UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
	[self renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return image;
}

- (void)addAntialisingTopLeftHack;
{
    CALayer *hackLayer = [CALayer new];
    hackLayer.frame = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext( CGSizeMake(1.0f, 1.0f) );
    UIImage *transparent = UIGraphicsGetImageFromCurrentImageContext();
    hackLayer.contents = (id)transparent.CGImage;
    [self addSublayer:hackLayer];
}

@end
