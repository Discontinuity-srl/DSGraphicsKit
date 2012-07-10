//
//  UIImage+DSGraphicsResizeAndRounding.h
//
//  Copyright (c) 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSCoreGraphicsFunctions.h"

/** Provides utilities for resizing and rounding images. */
@interface UIImage (DSResizeAndRound)

/** 
 Resizes and rounds the corner of an image.
 
 This method performs two operations to avoid to double paint an image when
 it is necessary to resize and repaint it.
 
 @param size The size of the desired image. It is rounded.
 @param radius The radius of the corners.
 @param corners A DSConer enumerator bitmask that specifies the corners that
 should be rounded.
 @param transparency Can disable transparency if possible (no corner radius 
 and opaque source image) as opaque images perform better in UIKit.
 
 @return A resized and rounded copy of the image.
 */
- (UIImage *)imageResizedToSize:(CGSize)size
               withCornerRadius:(CGFloat)radius
                        corners:(DSCorner)corners
                   transparency:(BOOL)transparency;

/** Convenience method for [UIImage imageResizedToSize:withCornerRadius:corners:transparency:].
 
 @param size The size of the desired image. It is rounded.
 @param radius The radius of the corners.
 @param transparency Can disable transparency if possible (no corner radius
 and opaque source image) as opaque images perform better in UIKit.
 
 @return A resized and rounded copy of the image.
 */
- (UIImage *)imageResizedToSize:(CGSize)size
               withCornerRadius:(CGFloat)radius
                   transparency:(BOOL)transparency;

/** Convenience method for [UIImage imageResizedToSize:withCornerRadius:corners:transparency:].
 
 @param size The size of the desired image. It is rounded.
 @param radius The radius of the corners.
 
 @return A resized and rounded copy of the image.
 */
- (UIImage *)imageResizedToSize:(CGSize)size withCornerRadius:(CGFloat)radius;

/** Convenience method for imageResizedToSize:withCornerRadius:corners:transparency:.
 
 @param size The size of the desired image. It is rounded.
 
 @return A resized image.
 */
- (UIImage *)imageResizedToSize:(CGSize)size;

/** Resize an image avoiding upsampling.
 
 @param size The size of the desired image. It is rounded.
 
 @return A resized image.
 */
- (UIImage *)imageWithMaximumSize:(CGSize)size;

@end
