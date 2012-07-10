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

#### Images

    UIImage *icon = [UIImage imageNamed:@"icon"];
    UIImage *fill = [UIImage imageNamed:@"fill"];
    UIImage *finalIcon = [UIImage iconWithForeground:fill background:(UIColor*)backgroundColor radius:(CGFloat)radius];

#### Views

    UIView *view;
    [view setZRotation:35.0f];
    [view addRefleciton];

#### Animations

    UIView *view;
    [view setZRotation:35.0f];
