//
//  OKIAssetsLibrary.m
//  iOS Media Viewer
//
//  Created by Christopher Shell on 2/17/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import "OKIAssetsLibrary.h"

@implementation OKIAssetsLibrary

+ (OKIAssetsLibrary *)defaultInstance
{
    // declare the static singleton pointer and use a predicate to initialize it
    static OKIAssetsLibrary *singleton = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^
                  {
                      singleton = [super new];
                  });
    
    return singleton;
}

@end
