//
//  OKIAlbumCollectionViewController.h
//  iOS Media Viewer
//  View Controller for displaying media assets in an album
//
//  Created by Christopher Shell on 2/22/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AssetsLibrary/AssetsLibrary.h>

@interface OKIAlbumCollectionViewController : UICollectionViewController

@property (strong, nonatomic) ALAssetsGroup *album;
@property (strong, nonatomic) NSMutableArray *assets;

@end
