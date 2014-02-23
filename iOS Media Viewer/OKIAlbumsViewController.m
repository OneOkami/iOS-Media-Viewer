//
//  OKIAlbumsViewController.m
//  iOS Media Viewer
//
//  Created by Christopher Shell on 2/20/14.
//  Copyright (c) 2014 OneOkami.com. All rights reserved.
//

#import "OKIAlbumsViewController.h"
#import "OKIAssetsLibrary.h"
#import "OKIAlbumTableViewCell.h"
#import "OKIAlbumCollectionViewController.h"

@interface OKIAlbumsViewController ()

@property NSMutableArray *albums;

@end

@implementation OKIAlbumsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // load all albums on the iOS device
    self.albums = [NSMutableArray new];
    OKIAssetsLibrary *assetsLibrary = [OKIAssetsLibrary defaultInstance];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll
                                 usingBlock:^(ALAssetsGroup *group, BOOL *stop)
    {
                                     if (group)
                                     {
                                         [self.albums addObject:group];
                                     }
                                     else
                                     {
                                         [self.tableView performSelectorOnMainThread:@selector(reloadData)
                                                                          withObject:nil
                                                                       waitUntilDone:YES];
                                     }
    }
                                    failureBlock:^(NSError *error) {
                                        NSLog(@"Problem loading albums: %@", error);
                                    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.albums count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // reuse the default cell in the table view for each row
    static NSString *CellIdentifier = @"albumCell";
    OKIAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setFromAlbum:self.albums[indexPath.row]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    OKIAlbumCollectionViewController *albumCollectionVC = [segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
    ALAssetsGroup *album = self.albums[selectedIndex.row];
    [albumCollectionVC setAlbum:album];
    
    [self.tableView deselectRowAtIndexPath:selectedIndex animated:YES];
}

@end
