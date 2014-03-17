//
//  CLVImageListViewController.m
//  practice-webp
//
//  Created by slightair on 2014/03/16.
//  Copyright (c) 2014年 slightair. All rights reserved.
//

#import "CLVImageListViewController.h"
#import "CLVImageViewController.h"

@interface CLVImageListViewController ()

@property (nonatomic, strong) NSArray *imageList;

@end

@implementation CLVImageListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Image List";
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"imageList" ofType:@"plist"];
    self.imageList = [NSArray arrayWithContentsOfFile:filePath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowImages"]) {
        NSInteger row = self.tableView.indexPathForSelectedRow.row;

        NSDictionary *imageInfoDict = self.imageList[row];
        CLVImageViewController *imageViewController = segue.destinationViewController;
        imageViewController.imageInfoDict = imageInfoDict;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.imageList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTitleCell"];

    cell.textLabel.text = self.imageList[indexPath.row][@"name"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ShowImages" sender:self];
}

@end
