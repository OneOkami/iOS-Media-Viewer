//
//  OKIPhotoAssetViewController.h
//  iOS Media Viewer
//
//  Created by Christopher Shell on 2/24/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface OKIPhotoAssetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property ALAsset *photo;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@end
