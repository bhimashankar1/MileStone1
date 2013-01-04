//
//  BaseViewController.h
//  Cams
//
//  Created by Bhimashankar Vibhute on 1/1/13.
//  Copyright (c) 2013 Bhimashankar Vibhute. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeViewController;


@interface BaseViewController : UIViewController
{
    UIView *progessBackView;
    
    UIProgressView *theProgressView;
    
    UILabel *progressLabel;
    
    HomeViewController *viewController;
}

@property (nonatomic, retain) UIView *progessBackView;

@property (nonatomic, retain) UIProgressView *theProgressView;

@property (nonatomic, retain) UILabel *progressLabel;

@property (nonatomic, strong) HomeViewController *viewController;
- (void) pushView;

-(void) updateProgressbar;

@end
