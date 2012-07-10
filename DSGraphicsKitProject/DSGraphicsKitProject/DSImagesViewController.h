//
//  DSImagesViewController.h
//  DSGraphicsKitProject
//
//  Created by Fabio Angelo Pelosin on 10/07/12.
//  Copyright (c) 2012 Discontinuity s.r.l. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSImagesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UISlider *rotationSlider;
@property (weak, nonatomic) IBOutlet UISlider *opacitySlider;
@property (weak, nonatomic) IBOutlet UISlider *heightSlider;

@end
