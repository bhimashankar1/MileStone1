//
//  HomeViewController.m
//  Cams
//
//  Created by Bhimashankar Vibhute on 1/1/13.
//  Copyright (c) 2013 Bhimashankar Vibhute. All rights reserved.
//


#import "HomeViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "PhotoViewController.h"
#import "AppDelegate.h"

@implementation HomeViewController

@synthesize userImage;
@synthesize photoViewController;;
@synthesize appDelegate;

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIImage *img = [UIImage imageNamed:@"HomeScreeniPhone.png"];
	UIImageView *bkImgView = [[UIImageView alloc] initWithImage:img];
    bkImgView.frame = CGRectMake(0, 0, 320, 480);
    [self.view addSubview:bkImgView];
    
     photoViewController = [[PhotoViewController alloc] init];
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cameraBtn addTarget:self 
               action:@selector(takePicture)
     forControlEvents:UIControlEventTouchUpInside];
    [cameraBtn setBackgroundColor:[UIColor clearColor]];
    [cameraBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    cameraBtn.frame = CGRectMake(25.0, 305.0, 120.0, 40.0);
    [self.view addSubview:cameraBtn];
    
    UIButton *libraryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [libraryBtn addTarget:self 
                  action:@selector(cameraRoll)
        forControlEvents:UIControlEventTouchUpInside];
    [libraryBtn setBackgroundColor:[UIColor clearColor]];
    [libraryBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    libraryBtn.frame = CGRectMake(175.0, 305.0, 120.0, 40.0);
    [self.view addSubview:libraryBtn];

}


- (void) takePicture
{
	//Check camera available on not
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIAlertView *altView = [[UIAlertView alloc]initWithTitle:@"" message:@"Sorry, you do not have a camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [altView show];
        return;
    }
    [self getMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}

- (void) cameraRoll
{
    [self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma Mark
#pragma Mark Push To Next View
- (void) pushView:(UIImage *) photosImg
{
    photoViewController.photoImg = photosImg;
    [self.navigationController pushViewController:self.photoViewController animated:YES];
}


#pragma Mark
#pragma Mark UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info
						   objectForKey:UIImagePickerControllerMediaType];
    [self dismissModalViewControllerAnimated:YES];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
		
		UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        CGSize newSize;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            newSize = CGSizeMake(768, 1024);
            
        }
        else {
            newSize  = CGSizeMake(320, 480);  //whaterver size
        }
		
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        userImage = UIGraphicsGetImageFromCurrentImageContext();
         UIGraphicsEndImageContext();
    }
	[self performSelector:@selector(pushView:) withObject:userImage afterDelay:0.2];
}



-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle: @"Error"
							  message: @"Error during saving image"
							  delegate: nil
							  cancelButtonTitle:@"OK"
							  otherButtonTitles:nil];
        [alert show];
    }
}


- (void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType 
{
		NSArray *mediaTypes = [UIImagePickerController
							   availableMediaTypesForSourceType:sourceType];
		UIImagePickerController *picker =
		[[UIImagePickerController alloc] init];
		picker.mediaTypes = mediaTypes;
		picker.delegate = self;
		picker.allowsEditing = NO;
		picker.sourceType = sourceType;
		[self presentModalViewController:picker animated:YES];
}




@end
