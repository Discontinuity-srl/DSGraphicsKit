//
//  DSAnimationViewController.m
//  DSGraphicsKitProject
//
//  Created by Fabio Angelo Pelosin on 10/07/12.
//  Copyright (c) 2012 Discontinuity s.r.l. All rights reserved.
//

#import "DSAnimationViewController.h"
#import "DSGraphicsKit.h"

@implementation DSAnimationViewController
@synthesize targetView;


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    targetView.image = [targetView.image lightIcon];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(addPopUpAnimation:) withObject:nil afterDelay:0.25];
}

- (IBAction)addPopUpAnimation:(id)sender {
    [targetView.layer addPopUpAnimation];
}

@end
