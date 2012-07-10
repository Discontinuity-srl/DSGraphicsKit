//
//  DSCoreGraphics.c
//
//  Copyright (c) 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import "DSCoreGraphicsFunctions.h"

CGMutablePathRef DSRoundedRectCreate(CGRect rect, CGFloat radius, DSCorner corner)
{
	CGFloat
	  x                   = rect.origin.x,
	  y                   = rect.origin.y,
	  x2                  = rect.size.width + x,
	  y2                  = rect.size.height + y,
	  topLeftRadius       = corner & DSCornerTopLeft ? radius : 0,
	  bottomLeftRadius    = corner & DSCornerBottomLeft ? radius : 0,
	  bottomRightRadius   = corner & DSCornerBottomRight ? radius : 0,
	  topRightRadius      = corner & DSCornerTopRight ? radius : 0;

	CGMutablePathRef path = CGPathCreateMutable();

	CGPathMoveToPoint(path, NULL, topLeftRadius, y);

	// 1. Top Left
	CGPathAddLineToPoint(path, NULL, x2 - topLeftRadius, y);
	CGPathAddArcToPoint(path, NULL, x2, y, x2, topLeftRadius, topLeftRadius);

	// 2. Bottom Left
	CGPathAddLineToPoint(path, NULL, x2, y2 - bottomLeftRadius);
	CGPathAddArcToPoint(path, NULL, x2, y2, x2 - bottomLeftRadius, y2, bottomLeftRadius);

	// 3. Bottom Right
	CGPathAddLineToPoint(path, NULL, bottomRightRadius, y2);
	CGPathAddArcToPoint(path, NULL, x, y2, x, y2 - bottomRightRadius, bottomRightRadius);

	// 4. Top Right
	CGPathAddLineToPoint(path, NULL, x, topRightRadius);
	CGPathAddArcToPoint(path, NULL, x, y, topRightRadius, y, topRightRadius);

	CGPathCloseSubpath(path);

	return path;
}



void DSContextClipForRoundCorners(CGContextRef ctx, CGRect rect, CGFloat radius, DSCorner corner)
{
	CGPathRef path = DSRoundedRectCreate(rect, radius, corner);
	CGContextAddPath(ctx, path);
	CGPathRelease(path);
	CGContextClip(ctx);
}

void DSContextDrawVerticalGradient(CGContextRef ctx, CGFloat y, CGFloat height, CGColorRef color1, CGColorRef color2)
{
	CGPoint         start  = CGPointMake(0.0, y);
	CGPoint         stop   = CGPointMake(0.0, y + height);
	CGColorSpaceRef space  = CGColorSpaceCreateDeviceRGB();
	NSMutableArray *colors = [NSMutableArray arrayWithObjects:(__bridge id)color1, (__bridge id)color2, nil];
    
	CGGradientRef gradient = CGGradientCreateWithColors(space, (__bridge CFArrayRef)colors, NULL);
    
	CGContextDrawLinearGradient(ctx, gradient, start, stop, 0);
    
	CGColorSpaceRelease(space);
    CGGradientRelease(gradient);
}



