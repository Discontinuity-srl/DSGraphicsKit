//
// DSGraphics.m
//
// Copyright 2011 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DSReflectionLayer.h"
#import "DSCoreGraphicsFunctions.h"
#import "UIView+DSImages.h"

@implementation UIView (DSImages)

#pragma mark - 3d Effects

- (void)setYRotation:(CGFloat)degrees anchorPoint:(CGPoint)point perspectiveCoeficient:(CGFloat)m34
{
	CATransform3D transfrom = CATransform3DIdentity;
	transfrom.m34 = 1.0 / m34;
    CGFloat radiants = degrees / 360.0 * 2 * M_PI;
	transfrom = CATransform3DRotate(transfrom, radiants, 0.0f, 1.0f, 0.0f);
	CALayer *layer = self.layer;
	layer.anchorPoint = point;
	layer.transform = transfrom;
}

- (void)setYRotation:(CGFloat)degrees
{
    [self setYRotation:degrees anchorPoint:CGPointMake(0.5, 0.5) perspectiveCoeficient:800];
}

#pragma mark - DSReflectionLayer

- (DSReflectionLayer *)addReflectionToSuperLayer
{
	DSReflectionLayer *layer = [[DSReflectionLayer alloc] initWithLayer:self.layer];
	CALayer *superLayer = [self.layer superlayer];
	[superLayer insertSublayer:layer below:self.layer];
	return layer;    
}

- (void)clearReflecitonLayer 
{
	CALayer *superLayer = [self.layer superlayer];
	NSArray *superLayerChilds = [superLayer sublayers];
	for (DSReflectionLayer *childLayer in superLayerChilds)
	{
		if ([childLayer isMemberOfClass:[DSReflectionLayer class]] && childLayer.reflectedLayer == self.layer)
		{
            [childLayer removeFromSuperlayer];
            return;
		}
	}    
}

@end

