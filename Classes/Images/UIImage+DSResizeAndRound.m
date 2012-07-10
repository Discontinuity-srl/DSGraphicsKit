//
//  UIImage+DSGraphicsResizeAndRounding.m
//
//  Copyright (c) 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import "UIImage+DSResizeAndRound.h"


@implementation UIImage (DSResizeAndRound)


- (UIImage *)imageWithMaximumSize:(CGSize)size
{
	CGFloat horizontalScale = size.width / self.size.width;
	CGFloat verticalScale   = size.height / self.size.height;
    
	CGFloat smallerScale    = MIN(horizontalScale, verticalScale);
    
	smallerScale = MIN(1.0f, smallerScale);
    
	CGFloat width  = self.size.width * smallerScale;
	CGFloat height = self.size.height * smallerScale;
    
	CGSize newSize = CGSizeMake(width, height);
	return [self imageResizedToSize:newSize withCornerRadius:0];
}

- (UIImage *)imageResizedToSize:(CGSize)size
{
	return [self imageResizedToSize:size 
                   withCornerRadius:0.0f
                            corners:DSCornerNone
                       transparency:YES];
}

- (UIImage *)imageResizedToSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
	return [self imageResizedToSize:size 
                   withCornerRadius:radius
                            corners:DSCornerAll
                       transparency:YES];
}

- (UIImage *)imageResizedToSize:(CGSize)size withCornerRadius:(CGFloat)radius transparency:(BOOL)transparency
{
	return [self imageResizedToSize:size 
                   withCornerRadius:radius
                            corners:DSCornerAll
                       transparency:transparency];
}

- (UIImage *)imageResizedToSize:(CGSize)size withCornerRadius:(CGFloat)radius corners:(DSCorner)corners transparency:(BOOL)transparency
{
	size = CGSizeMake(roundf(size.width), roundf(size.height));
    
	CGFloat
    imageXScale     = size.width / self.size.width,
    imageYScale     = size.height / self.size.height,
    imageScale      = MAX(imageXScale, imageYScale),
    imageDrawWidth  = imageScale * self.size.width,
    imageDrawHeight = imageScale * self.size.height,
    imageDrawX      = (size.width - imageDrawWidth) / 2,
    imageDrawY      = (size.height - imageDrawHeight) / 2;
    
	CGRect
    imageDrawRect = CGRectMake(imageDrawX, imageDrawY, imageDrawWidth, imageDrawHeight),
    bounds        = CGRectMake(0, 0, size.width, size.height);
    
	BOOL opaque = (CGImageGetAlphaInfo(self.CGImage) == kCGImageAlphaNone) && !radius && !transparency;
    
	UIGraphicsBeginImageContextWithOptions(size, opaque, 0.0f);
	CGContextSetInterpolationQuality(UIGraphicsGetCurrentContext(), kCGInterpolationHigh);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    
	// Round rectangle clip
    CGContextSaveGState(ctx);
    
	if (radius)
	{
		DSContextClipForRoundCorners(ctx, bounds, radius, corners);
	}
    
	[self drawInRect:imageDrawRect];
    
	CGContextRestoreGState(ctx);
    
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return newImage;
}


@end
