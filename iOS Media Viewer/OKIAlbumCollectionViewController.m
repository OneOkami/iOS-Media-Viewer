//
//  OKIAlbumCollectionViewController.m
//  iOS Media Viewer
//
//  Created by Christopher Shell on 2/22/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import "OKIAlbumCollectionViewController.h"
#import "OKIAssetsLibrary.h"
#import "OKIAlbumCollectionViewCell.h"
#import "OKIPhotoAssetViewController.h"
#import "OKIVideoAssetViewController.h"

@interface OKIAlbumCollectionViewController ()

@end

@implementation OKIAlbumCollectionViewController

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
    
    // set the view name to the name of the album
    self.title = [self.album valueForProperty:ALAssetsGroupPropertyName];
    
    // load all photo and video assets in the album into an array
    self.assets = [NSMutableArray new];
    [self.album enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop)
    {
        id assetType = [result valueForProperty:ALAssetPropertyType];
        if(assetType == ALAssetTypePhoto || assetType == ALAssetTypeVideo)
        {
            [self.assets addObject:result];
        }
    }];
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    // photos and videos will be grouped together in one section
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // return the number of media assets in the album
    return [self.assets count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // reuse the standard cell for performance reasons
    static NSString *CellIdentifier = @"assetCell";
    OKIAlbumCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier
                                                                                      forIndexPath:indexPath];
    
    // identify the media asset to be displayed in the cell and set the cell's image to a thumbnail of the asset
    ALAsset *asset = self.assets[indexPath.row];
    cell.imageView.image = [UIImage imageWithCGImage:asset.thumbnail];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(104.0f, 104.0f);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.0f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2.0f, 0.0f, 2.0f, 0.0f);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // determine the type of asset selected (should be either a photo or video) and peform the appropriate segue
    ALAsset *selectedAsset = self.assets[indexPath.row];
    NSString *assetType = [selectedAsset valueForProperty:ALAssetPropertyType];
    if([assetType isEqualToString:ALAssetTypePhoto])
    {
        [self performSegueWithIdentifier:@"photoSelectionSegue" sender:selectedAsset];
    }
    else if([assetType isEqualToString:ALAssetTypeVideo])
    {
        [self performSegueWithIdentifier:@"videoSelectionSegue" sender:selectedAsset];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // the sender should be referencing the asset tapped in the album collection view
    ALAsset *asset = (ALAsset *)sender;
    NSString *segueIdentifier = [segue identifier];
    
    // prepare for the segue depending on which scene we're segueing to
    if([segueIdentifier isEqualToString:@"photoSelectionSegue"])
    {
        OKIPhotoAssetViewController *photoAssetViewController = (OKIPhotoAssetViewController *)[segue destinationViewController];
        photoAssetViewController.photo = asset;
    }
    else if([segueIdentifier isEqualToString:@"videoSelectionSegue"])
    {
        OKIVideoAssetViewController *videoAssetViewController = (OKIVideoAssetViewController *)[segue destinationViewController];
        videoAssetViewController.assetURL = [asset valueForProperty:ALAssetPropertyAssetURL];
    }
}

@end
