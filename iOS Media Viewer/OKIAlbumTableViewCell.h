//
//  OKIAlbumTableViewCell.h
//  iOS Media Viewer
//
//  Created by Christopher Shell on 2/20/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface OKIAlbumTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;

// initializes the album cell from an asset group
- (void)setFromAlbum:(ALAssetsGroup *)album;

@end
