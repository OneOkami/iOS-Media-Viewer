//
//  OKIAlbumTableViewCell.m
//  iOS Media Viewer
//
//  Created by Christopher Shell on 2/20/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import "OKIAlbumTableViewCell.h"

@implementation OKIAlbumTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFromAlbum:(ALAssetsGroup *)album
{
    self.albumTitleLabel.text = [album valueForProperty:ALAssetsGroupPropertyName];
    self.albumImageView.image = [UIImage imageWithCGImage:album.posterImage];
}

@end
