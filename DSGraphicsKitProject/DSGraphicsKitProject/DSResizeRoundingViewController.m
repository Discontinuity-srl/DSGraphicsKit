//
//  DSResizeRoundingViewController.m
//  DSGraphicsKitProject
//
//  Created by Fabio Angelo Pelosin on 10/07/12.
//  Copyright (c) 2012 Discontinuity s.r.l. All rights reserved.
//

#import "DSResizeRoundingViewController.h"
#import "DSGraphicsKit.h"

@implementation DSResizeRoundingViewController
@synthesize imageView;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.imageView.image = [imageView.image 
                       imageResizedToSize:CGSizeMake(160, 160) 
                       withCornerRadius:24 
                       corners:DSCornerTopLeft | DSCornerBottomRight
                       transparency:NO];
    
    self.imageView.image = [imageView.image 
                       imageResizedToSize:CGSizeMake(160, 160) 
                       withCornerRadius:8 
                       corners:DSCornerBottomLeft | DSCornerTopRight
                       transparency:NO];
    
    [self.imageView addReflectionToSuperLayer];
}

@end
