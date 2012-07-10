//
//  UIImage+DSGraphicsIcons.m
//
//  Copyright (c) 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#define RGB_COLOR_WITH_WHITE(w) [UIColor colorWithRed : w green : w blue : w alpha : 1]

#import "UIImage+DSIcons.h"
#import <QuartzCore/QuartzCore.h>
#import "CALayer+DSImages.h"
#import "DSCoreGraphicsFunctions.h"

@implementation UIImage (DSIcons)

- (UIImage *)applyAlphaFromImage:(UIImage *)alphaImage 
             backgroundColor:(UIColor*)bakgroundColor 
                       glowWidth:(CGFloat)glowWidth 
                      glowOffset:(CGSize)glowOffset 
                       glowColor:(UIColor *)glowColor
                    cornerRadius:(CGFloat)cornerRadius
{
    // Set up
    BOOL opaque     = (bakgroundColor && !cornerRadius);
    CGRect imageRect = CGRectMake(0, 0, alphaImage.size.width, alphaImage.size.height);
	UIGraphicsBeginImageContextWithOptions(imageRect.size, opaque, 0.0);
	CGContextRef context = UIGraphicsGetCurrentContext();        
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 0, imageRect.size.height);
	CGContextScaleCTM(context, 1.0f, -1.0f);
    
    // Radius
    if (cornerRadius)
	{
		DSContextClipForRoundCorners(context, imageRect, cornerRadius, DSCornerAll);
	}
    
    // Painting the background
    if (bakgroundColor) {
        CGContextSetFillColorWithColor(context, bakgroundColor.CGColor);
        CGContextFillRect(context, imageRect);
    }
    
    // Glow
	if (glowWidth != 0 && glowColor != nil)
	{
		CGContextSetShadowWithColor(context, glowOffset, glowWidth, glowColor.CGColor);
	}
    
    // Painting the foreground with the alpha channel
	CGContextBeginTransparencyLayer(context, NULL);
	CGContextClipToMask(context, imageRect, alphaImage.CGImage);
	CGContextFillRect(context, imageRect);
	CGContextDrawImage(context, imageRect, self.CGImage);
	CGContextEndTransparencyLayer(context);
    
    // Clen up
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	CGContextRestoreGState(context);
	UIGraphicsEndImageContext();
	return newImage;
    
}

- (UIImage *)applyAlphaFromImage:(UIImage *)alphaImage glowWidth:(CGFloat)glowWidth offset:(CGSize)glowOffset color:(UIColor *)glowColor
{
    return [self applyAlphaFromImage:alphaImage 
                 backgroundColor:nil 
                           glowWidth:glowWidth 
                          glowOffset:glowOffset 
                           glowColor:glowColor 
                        cornerRadius:0];
}

- (UIImage*)iconWithForeground:(UIImage*)foreground background:(UIColor*)backgroundColor radius:(CGFloat)radius;
{
	UIImage *icon = [foreground applyAlphaFromImage:self 
                                backgroundColor:backgroundColor 
                                          glowWidth:0.0 
                                         glowOffset:CGSizeZero
                                          glowColor:nil
                                       cornerRadius:radius];
	return icon;
}

- (UIImage *)gradientIconWithRGBColors:(NSArray *)colors
{
	NSMutableArray *CGColors = [NSMutableArray array];
    
	for (UIColor *color in colors) {
		NSAssert(CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) == kCGColorSpaceModelRGB, @"gradientIconWithRGBColors: - incorrect color space model");
		[CGColors addObject:(id)color.CGColor];
	}
    
	CAGradientLayer *gradient = [CAGradientLayer layer];
	gradient.frame     = CGRectMake(0, 0, self.size.width, self.size.height);
	gradient.colors    = CGColors;
	gradient.locations = [NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:0.2f], 
                          [NSNumber numberWithFloat:0.8f], nil];
	
    UIImage *gradientImage = [gradient imageFromLayer];
    UIColor *shadowColor   = [UIColor colorWithWhite:0.0f alpha:0.6f];
    
	UIImage *icon = [gradientImage applyAlphaFromImage:self 
                                             glowWidth:2.0f
                                                offset:CGSizeMake(0.0f, 1.0f) 
                                                 color:shadowColor];
	return icon;
}

- (UIImage *)lightIcon
{
	NSArray *array = [NSArray arrayWithObjects:RGB_COLOR_WITH_WHITE(1.0f), RGB_COLOR_WITH_WHITE(0.7f), nil];
	return [self gradientIconWithRGBColors:array];
}

- (UIImage *)grayIcon
{
	NSArray *array = [NSArray arrayWithObjects:RGB_COLOR_WITH_WHITE(0.7f), RGB_COLOR_WITH_WHITE(0.4f), nil];
	return [self gradientIconWithRGBColors:array];
}

- (UIImage *)darkIcon
{
	NSArray *array = [NSArray arrayWithObjects:RGB_COLOR_WITH_WHITE(0.4f), RGB_COLOR_WITH_WHITE(0.2f), nil];
	return [self gradientIconWithRGBColors:array];
}

@end
