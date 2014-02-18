//
//  OKIAssetsLibrary.h
//  iOS Media Viewer
//  Singleton class for accessing assets on the iOS device
//
//  Created by Christopher Shell on 2/17/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface OKIAssetsLibrary : ALAssetsLibrary

+ (OKIAssetsLibrary *)defaultInstance;

@end
