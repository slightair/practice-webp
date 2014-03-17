//
//  CLVImageViewController.m
//  practice-webp
//
//  Created by slightair on 2014/03/16.
//  Copyright (c) 2014年 slightair. All rights reserved.
//

#import "CLVImageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "CLVImageCell.h"

@interface CLVImageViewController ()

@end

@implementation CLVImageViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.title = self.imageInfoDict[@"name"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.imageInfoDict[@"images"] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.imageInfoDict[@"images"][section][@"name"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CLVImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];

    NSDictionary *imageInfo = self.imageInfoDict[@"images"][indexPath.section];
    NSURL *imageURL = [NSURL URLWithString:imageInfo[@"url"]];

    [cell.contentImageView setImageWithURL:imageURL];

    return cell;
}

@end
