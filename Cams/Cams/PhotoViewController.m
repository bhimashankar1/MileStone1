//
//  PhotoViewController.m
//  Cams
//
//  Created by Bhimashankar Vibhute on 1/1/13.
//  Copyright (c) 2013 Bhimashankar Vibhute. All rights reserved.
//

#import "PhotoViewController.h"

@implementation PhotoViewController
@synthesize photoImg;

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Preview"];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO];
    UIImageView *bkImgView = [[UIImageView alloc] initWithImage:photoImg];
    bkImgView.frame = CGRectMake(0, 0, 320, 440);
    [self.view addSubview:bkImgView];
}


- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}


@end
