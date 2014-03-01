//
//  OKIVideoAssetViewController.m
//  iOS Media Viewer
//
//  Created by Christopher Shell on 3/1/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import "OKIVideoAssetViewController.h"

@interface OKIVideoAssetViewController ()

@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;

@end

@implementation OKIVideoAssetViewController

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
    
    // configure a video player to play the video asset selected in the collection view, using the entire view frame
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:self.assetURL];
    [self.moviePlayerController prepareToPlay];
    [self.moviePlayerController.view setFrame:self.view.bounds];
    [self.view addSubview:self.moviePlayerController.view];
    
    self.moviePlayerController.shouldAutoplay = NO; // prevents the video from automatically playing as soon as the view finishes loading
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    // reset the image view frame after an orientation rotation
    [self.moviePlayerController.view setFrame:self.view.frame];
}

- (BOOL)prefersStatusBarHidden
{
    // the visibility of the status bar should toggle with the navigation bar
    return [self.navigationController navigationBar].hidden;
}

@end
