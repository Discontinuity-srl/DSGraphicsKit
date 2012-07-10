//
//  DSIconsViewController.m
//  DSGraphicsKitProject
//
//  Created by Fabio Angelo Pelosin on 10/07/12.
//  Copyright (c) 2012 Discontinuity s.r.l. All rights reserved.
//

#import "DSIconsViewController.h"
#import "DSGraphicsKit.h"

@implementation DSIconsViewController
@synthesize view0;
@synthesize view1;
@synthesize view2;
@synthesize view3;
@synthesize view4;
@synthesize view5;


-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    UIImage *source = [UIImage imageNamed:@"icon"];
    UIImage *fill   = [UIImage imageNamed:@"fill"];
    
    UIColor *color1 = [UIColor colorWithRed:0.86 
                                      green:0.08 
                                       blue:0.5 
                                      alpha:0.9];
    UIColor *color2 = [UIColor colorWithRed:1 
                                      green:0.4 
                                       blue:0.8 
                                      alpha:1];

    self.view0.image = [source gradientIconWithRGBColors:[NSArray arrayWithObjects:color1, color2, nil]];
    self.view1.image = [fill applyAlphaFromImage:source glowWidth:5.0f offset:CGSizeZero color:color1];
    self.view2.image = [source iconWithForeground:fill background:[UIColor colorWithWhite:0.1 alpha:1.0] radius:4.0];

    self.view3.image = [source lightIcon];
    self.view4.image = [source grayIcon];
    self.view5.image = [source darkIcon];
}


@end
