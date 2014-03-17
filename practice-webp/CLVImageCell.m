//
//  CLVImageCell.m
//  practice-webp
//
//  Created by slightair on 2014/03/16.
//  Copyright (c) 2014年 slightair. All rights reserved.
//

#import "CLVImageCell.h"

@implementation CLVImageCell

- (void)awakeFromNib
{
    self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"squares"]];
}

@end
