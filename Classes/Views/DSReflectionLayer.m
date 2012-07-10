//
// DSReflectionLayer.m
//
// Copyright 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import "DSReflectionLayer.h"

CGImageRef CreateGradientImage(NSUInteger pixelsHigh);

@interface DSReflectionLayer ()

@property (nonatomic, readwrite, strong) CALayer *reflectedLayer;

@end

@implementation DSReflectionLayer

@synthesize reflectedLayer   = _reflectedLayer;
@synthesize reflectionHeight = _reflectionHeight;
@synthesize verticalOffset   = _verticalOffset;

- (id)initWithLayer:(CALayer *)aLayer
{
	self = [super init];

	if (self)
	{
		self.needsDisplayOnBoundsChange = YES;
		self.contentsScale = [UIScreen mainScreen].scale;

		_reflectionHeight = 0.4;
        _verticalOffset = 1;
		self.opacity = 0.4;

		_reflectedLayer = aLayer;
		self.name = [NSString stringWithFormat:@"reflectionLayer%@", aLayer.name];
        [self udpateFrame];
	}

	return self;
}

- (void)udpateFrame {
    CGRect frame = _reflectedLayer.frame;
    frame.origin.y += frame.size.height + _verticalOffset;
    frame.size.height = frame.size.height * self.reflectionHeight;
    
    self.frame = frame;    
}

- (void)drawInContext:(CGContextRef)ctx
{
	CGContextSaveGState(ctx);
    CGContextSetInterpolationQuality(ctx, kCGInterpolationNone);
	CGContextTranslateCTM(ctx, 0.0f, self.reflectedLayer.frame.size.height);
	CGContextScaleCTM(ctx, 1.0f, -1.0f);

	CGRect contextRect = CGRectMake(0, self.reflectedLayer.frame.size.height - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);

	CGImageRef gradientMaskImage = CreateGradientImage(self.frame.size.height);
	CGContextClipToMask(ctx, contextRect, gradientMaskImage);
	CGImageRelease(gradientMaskImage);

	[self.reflectedLayer renderInContext:ctx];

	CGContextRestoreGState(ctx);
}

/** Returns the image to use as a mask for the reflection. */
CGImageRef CreateGradientImage(NSUInteger heightInPixels)
{
	CGImageRef image = NULL;

	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	CGFloat heightInPoints = heightInPixels * [UIScreen mainScreen].scale;
	CGContextRef gradientBitmapContext = CGBitmapContextCreate(NULL, 1.0f, heightInPoints, 8, 0, colorSpace, kCGImageAlphaNone);
	CGFloat colors[] = { 0.0, 1.0, 1.0, 1.0 };
	CGGradientRef grayScaleGradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);

	CGPoint gradientStartPoint = CGPointZero;
	CGPoint gradientEndPoint = CGPointMake(0, heightInPoints);

	CGContextDrawLinearGradient(gradientBitmapContext, grayScaleGradient, gradientStartPoint, gradientEndPoint, kCGGradientDrawsAfterEndLocation);
	image = CGBitmapContextCreateImage(gradientBitmapContext);
    
	CGGradientRelease(grayScaleGradient);
	CGColorSpaceRelease(colorSpace);
	CGContextRelease(gradientBitmapContext);
	return image;
}

- (void)setReflectionHeight:(CGFloat)reflectionHeight
{
    _reflectionHeight = reflectionHeight;
    [self udpateFrame];
}

- (void)setVerticalOffset:(CGFloat)verticalOffset 
{
    _verticalOffset = verticalOffset;
    [self udpateFrame];
}

@end



