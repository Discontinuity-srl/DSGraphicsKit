//
// DSReflectionLayer.h
//
// Copyright 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/** Renders the reflection of a layer. 
 It is possible to ajust the opacity of the reflection with the CALayer setOpacity: method.
 To avoid clipping issues it is advidable to add the reflected layer to the super layer of the
 reflected one. A cathegory of UIView is provided to simplify the process. 
 */
@interface DSReflectionLayer : CALayer

/** The reflected layer as specified at initialization time. */
@property (nonatomic, readonly, strong) CALayer *reflectedLayer;

/** 
 The height of the reflection in relative coordinates from 0 to 1.
 
 The default value is 0.4.
 */
@property (nonatomic) CGFloat reflectionHeight;

/** 
 The vertical offset from the reflected layer expressed in UIKit points.

 The default value is 1.0.
 */
@property (nonatomic) CGFloat verticalOffset;

/** Designated initializer.
 
 During intialization the name of the layer is set to reflectionLayerOf{reflectedLayer.name}.
 @param layer The layer that will be reflected.
 */
- (id)initWithLayer:(CALayer *)layer;

@end