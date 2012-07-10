//
//  DSImagesViewController.m
//  DSGraphicsKitProject
//
//  Created by Fabio Angelo Pelosin on 10/07/12.
//  Copyright (c) 2012 Discontinuity s.r.l. All rights reserved.
//

#import "DSImagesViewController.h"
#import "DSGraphicsKit.h"

@interface DSImagesViewController ()

@property DSReflectionLayer *reflectionLayer;

@end

@implementation DSImagesViewController
@synthesize imageView;
@synthesize containerView;
@synthesize rotationSlider;
@synthesize opacitySlider;
@synthesize heightSlider;
@synthesize reflectionLayer;

-(void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];

    // Prevent aliasing
    self.containerView.layer.shouldRasterize = YES;
    self.containerView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
    [self.containerView.layer addAntialisingTopLeftHack];

    // Some decoration
    self.imageView.layer.cornerRadius = 6;
    self.imageView.layer.masksToBounds = YES;
    
    // Interesting part
    self.reflectionLayer = [self.imageView addReflectionToSuperLayer];
    self.reflectionLayer.verticalOffset = 4.0f;
    [self.containerView setYRotation:25];
    
    self.rotationSlider.value = 25;
    self.opacitySlider.value = self.reflectionLayer.opacity;
    self.heightSlider.value = self.reflectionLayer.reflectionHeight;
    
//    [self startRotation];
}

- (void)startRotation {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    anim.duration = 10;
    anim.repeatCount = HUGE_VALF;
    anim.autoreverses = NO;
    anim.fromValue = [NSNumber numberWithFloat:0];
    anim.toValue = [NSNumber numberWithFloat: 2 * M_PI ];
    [self.containerView.layer addAnimation:anim forKey: @"rotation"];
}

- (IBAction)rotationSliderChange:(UISlider *)sender {
    [self.containerView setYRotation:sender.value];
}

- (IBAction)opacitySliderChange:(UISlider *)sender {
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    reflectionLayer.opacity = sender.value;
    [CATransaction commit];
}

- (IBAction)heightSliderChange:(UISlider *)sender {
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    reflectionLayer.reflectionHeight = sender.value;   
    [CATransaction commit];
}

@end
