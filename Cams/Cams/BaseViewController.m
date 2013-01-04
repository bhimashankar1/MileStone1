//
//  BaseViewController.m
//  Cams
//
//  Created by Bhimashankar Vibhute on 1/1/13.
//  Copyright (c) 2013 Bhimashankar Vibhute. All rights reserved.
//


#import "BaseViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"

@implementation BaseViewController
@synthesize progessBackView, progressLabel, viewController, theProgressView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UIImage *img = [UIImage imageNamed:@"Background.png"];
    
    UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
    [imgView setAlpha:1.0];
    
    progessBackView = [[UIView alloc] init];
    theProgressView = [[UIProgressView alloc] init];
    progressLabel = [[UILabel alloc] init];
    
        imgView.frame = CGRectMake(0, 0, 320, 480);
        [progessBackView setFrame:CGRectMake(20, 350, 280, 60)];
        [theProgressView setFrame:CGRectMake(0, 30, 280, 20)];
        [progressLabel setFrame:CGRectMake(0, 0, 280, 30)];
    
    [self.view addSubview:imgView];
    
    viewController = [[HomeViewController alloc] init];
    
    [progressLabel setBackgroundColor:[UIColor clearColor]];
    [progressLabel setTextColor:[UIColor whiteColor]];
    [progressLabel setText:@"Loading"];
    [progressLabel setTextAlignment:UITextAlignmentCenter];
    [progessBackView addSubview:progressLabel];
    
    [theProgressView setProgress:0.0];
    [progessBackView addSubview:theProgressView];
    
    [self.view addSubview:progessBackView];
    
    [self updateProgressbar];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

#pragma Mark
#pragma Mark Update Progress bar
-(void) updateProgressbar
{
    float progressValue = [theProgressView progress];
    
    if(progressValue < 1.0)
    {
        [theProgressView setProgress:(progressValue + 0.1)];
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateProgressbar) userInfo:nil repeats:NO];
    }
    else
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        //Call to Home view
        [self pushView];
    }
}

#pragma Mark
#pragma Mark Push To Next View
- (void) pushView
{
    [self.navigationController pushViewController:self.viewController animated:YES];
}


- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
