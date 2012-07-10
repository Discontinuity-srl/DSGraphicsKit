//
// DSGraphics.h
//
// Copyright 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSReflectionLayer.h"

/** Utilities for graphics effects on UIViews. */
@interface UIView (DSImages)

/// ---------------------------------
/// @name 3d Effects
/// ---------------------------------

/** Applies 3d rotation on the y axis of a view.
 @param radiants              The ammount of the rotation expressed in radiants.
 @param anchorPoint           The center of the rotation.
 @param perspectiveCoeficient The perspective coeficient (CATransform3D.m34).
 */
- (void)setYRotation:(CGFloat)radiants anchorPoint:(CGPoint)anchorPoint perspectiveCoeficient:(CGFloat)perspectiveCoeficient;

/** Applies 3d rotation on the y axis of a UIView. 
 
 It uses a perspective coeficient of 800 and the center of the view as the anchor point. 
 @param degrees               The ammount of the rotation expressed in degrees.
 */
- (void)setYRotation:(CGFloat)degrees;

/// ---------------------------------
/// @name Reflections
/// ---------------------------------

/** Add a reflection in the super layer. */
- (DSReflectionLayer *)addReflectionToSuperLayer;

/** Clears any DSReflectionLayer of the super layer linked with the receiver. */
- (void)clearReflecitonLayer;

@end
