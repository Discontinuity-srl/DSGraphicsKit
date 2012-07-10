//
//  DSCoreGraphicsFunctions.h
//
//  Copyright (c) 2012 Discontinuity S.r.l. Unipersonale. All rights reserved.
//

/** DSCoreGraphics provides functions to perform common editing actions in Core Graphics. */

/** Identifies the corners of an image. */
typedef enum {
    DSCornerNone = 0x00000000,
    DSCornerAll  = 0xFFFFFFFF,
    
    DSCornerTop    = 0x0000000F,
    DSCornerTopRight    = 1 << 0,
    DSCornerTopLeft     = 1 << 1,

    DSCornerBottom = 0x000000F0,
    DSCornerBottomLeft  = 1 << 4,
    DSCornerBottomRight = 1 << 5,

} DSCorner;

/** Creates a rounded rectangle path.
 @param rect    The rect to round.
 @param radius  The radius of the rounding.
 @param corner  A bit enumerator mask specifing the corners to round.
 @return A CGMutablePathRef containing the rounded rectangle. 
 */
CGMutablePathRef DSRoundedRectCreate(CGRect rect, CGFloat radius, DSCorner corner);

/** Clips a core graphics context with a rounded rect.
 @param ctx     The core graphics context to clip.
 @param rect    The rectangle to clip.
 @param radius  The corner radius of the rectangle.
 @param corner  The corners to round of the rectangle.
 */
void DSContextClipForRoundCorners(CGContextRef ctx, CGRect rect, CGFloat radius, DSCorner corner);

/** Draws a vertical gradient in a core graphics context.
 @param ctx         The core graphics context to clip.
 @param startHeight The vertical coordinate where the gradient should start.
 @param stopHeight  The height of the gradient.
 @param color1      The start color of the gradient.
 @param color2      The end color of the gradient.
 */
void DSContextDrawVerticalGradient(CGContextRef ctx, CGFloat startHeight, CGFloat stopHeight, CGColorRef color1, CGColorRef color2);


