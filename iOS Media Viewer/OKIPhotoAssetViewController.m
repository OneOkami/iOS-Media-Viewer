//
//  OKIPhotoAssetViewController.m
//  iOS Media Viewer
//
//  Created by Christopher Shell on 2/24/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import "OKIPhotoAssetViewController.h"

@interface OKIPhotoAssetViewController ()

@end

@implementation OKIPhotoAssetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // display the photo in the image view
    UIImage *image = [UIImage imageWithCGImage:[[self.photo defaultRepresentation] fullScreenImage]];
    [self.imageView sizeThatFits:[image size]];
    self.imageView.image = image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender
{
    // dismiss the view when the user taps the back button
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLayoutSubviews
{
    // set the image view to the full screen frame once all views have been laid out
    [self.imageView setFrame:self.view.frame];
}

- (BOOL)prefersStatusBarHidden
{
    // the visibility of the status bar should toggle with the navigation bar
    return [self.navigationController navigationBar].hidden;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    // reset the image view frame after an orientation rotation
    [self.imageView setFrame:self.view.frame];
}

- (IBAction)userTappedScene:(UITapGestureRecognizer *)sender
{
    // toggle the visibility of the status bar and naviation bar when the user taps the scene and update the background color to white or black depending on if the bars or visible or not respectively
    BOOL navigationBarIsHidden = [self.navigationController navigationBar].hidden;
    if(navigationBarIsHidden)
    {
        [self.imageView setBackgroundColor:[UIColor  whiteColor]];
    }
    else
    {
        [self.imageView setBackgroundColor:[UIColor blackColor]];
    }
    
    [self.navigationController setNavigationBarHidden:!navigationBarIsHidden animated:NO];
    [self setNeedsStatusBarAppearanceUpdate];
}

@end
