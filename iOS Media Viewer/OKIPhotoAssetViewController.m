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
    
    // hide the navigation bar
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
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
    [self.imageView setFrame:self.view.frame];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.imageView setFrame:self.view.frame];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
