//
//  UIImage+DSGraphicsIcons.h
//
//  Copyright (c) 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Provides for generating icons from images. */
@interface UIImage (DSIcons)


/** 
 Adds to the current image the alpha channel of a given one and can optionally 
 add a glow/shadow, a solid color background and round the corners of the image.
 
 @param alphaImage      The image that provides the alpha chanel.
 @param bakgroundColor  The color for the background.
 @param glowWidth       The width of the glow.
 @param glowOffset      The offset of the glow.
 @param glowColor       The color of the glow.
 @param cornerRadius    The radius of the corners.
 
 @return The modified copy of the image.
 */
- (UIImage *)applyAlphaFromImage:(UIImage *)alphaImage
             backgroundColor:(UIColor*)bakgroundColor
                       glowWidth:(CGFloat)glowWidth
                      glowOffset:(CGSize)glowOffset
                       glowColor:(UIColor *)glowColor
                    cornerRadius:(CGFloat)cornerRadius;

/** 
 Adds to the current image the alpha channel of a given one and can optionally 
 add a glow/shadow.
 
 Equivalent to call [UIImage applyAlphaFromImage:withBackgroundColor:glowWidth:glowOffset:glowColor:cornerRadius:]
 with no conerRadius and no backgroundColor.

 @param alphaImage      The image for getting the alpha chanel.
 @param glowWidth       The width of the glow.
 @param glowOffset      The offset of the glow.
 @param glowColor       The color of the glow.
 
 @return The modified copy of the image.
 */
- (UIImage *)applyAlphaFromImage:(UIImage *)alphaImage
                   glowWidth:(CGFloat)glowWidth
                          offset:(CGSize)glowOffset
                           color:(UIColor *)glowColor;

/** 
 Paints the alpha channel of the receiver with a given image, fills the 
 background with the given color and rounds the image to a given corner radius.
 
 @param foreground      The image to use for filling the alpha.
 @param backgroundColor The color to use for the background.
 @param radius          The corner radius of the resulting image.
 
 @return The modified copy of the image.
 */
- (UIImage*)iconWithForeground:(UIImage*)foreground background:(UIColor*)backgroundColor radius:(CGFloat)radius;


///---------------------
/// @name Glowing fills
///---------------------


/** Fills an image alpha channel with a gradient and adds a subtle drop shadow.

 The vertical gradient spans from 0.2 to 0.8 of the height of the image.
 
 @param colors  Array containing two UIColors to use for creating the gradient.
 The colors must be in the RGB color space ie. [UIColor colorWithWhite:alpha:] 
 is not allowed.
 
 @return A new image filled with the gradient.
 */
- (UIImage *)gradientIconWithRGBColors:(NSArray *)colors;

/** Returns a light gray icon. */
- (UIImage *)lightIcon;

/** Returns a gray icon. */
- (UIImage *)grayIcon;

/** Returns a dark gray icon. */
- (UIImage *)darkIcon;

@end
