# DSGraphicsKit

Utilities for common and advanced graphics operations.

DSGraphicsKit provides support to quickly perform the following operations:

- Images:
  - Create icons with fills, glows and shadows from the alpha channel of an image.
  - Resize with corner rounding.
  - Render a layer to an image.
- Views:
  - Add a 3d rotation along the y axis.
  - Add a reflection.
- Animations:
  - Add a pop up animation to a layer.


## Installation

Use [CocoaPods](https://github.com/CocoaPods/CocoaPods):

    pod 'DSGraphicsKit'

## Usage

![Preview](https://github.com/Discontinuity-srl/DSGraphicsKit/raw/master/README/Screenshots.png)

#### Rotating and adding a reflection to a view

    UIView *view;
    [view setYRotation:25.0f];
    [view addReflectionToSuperLayer];
    
#### Icons

    UIImage *source;
    UIImage *fill;    
    UIColor *color1;
    UIColor *color2;

    UIImage *icon0 = [source gradientIconWithRGBColors:[NSArray arrayWithObjects:color1, color2, nil]];
    UIImage *icon1 = [fill applyAlphaFromImage:source glowWidth:5.0f offset:CGSizeZero color:color1];
    UIImage *icon2 = [source iconWithForeground:fill background:[UIColor colorWithWhite:0.1 alpha:1.0] radius:4.0];
    
### Images resizing with corners rouding

    UIImage *original;
    UIImage *new = [original imageResizedToSize:CGSizeMake(160, 160) 
                               withCornerRadius:24.0f
                                        corners:DSCornerTopLeft | DSCornerBottomRight
                                   transparency:NO];


#### Animations

    UIView *view;
    [view.layer addPopUpAnimation];
