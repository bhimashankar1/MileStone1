//
//  HomeViewController.h
//  Cams
//
//  Created by Bhimashankar Vibhute on 1/1/13.
//  Copyright (c) 2013 Bhimashankar Vibhute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
@class PhotoViewController;
@class AppDelegate;

UIImage *userImage;

BOOL newMedia;

@interface HomeViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    PhotoViewController *photoViewController;
    
    AppDelegate *appDelegate;
}

@property (nonatomic, retain) UIImage *userImage;

@property (nonatomic, retain) PhotoViewController *photoViewController;

@property (nonatomic, retain) AppDelegate *appDelegate;

- (void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType; 

- (void) pushView:(UIImage *) photosImg;

@end
