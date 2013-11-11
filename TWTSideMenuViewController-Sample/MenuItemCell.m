//
//  MenuItemCell.m
//  TWTSideMenuViewController-Sample
//
//  Created by Aleš Kocur on 11/11/13.
//  Copyright (c) 2013 Two Toasters. All rights reserved.
//

#import "MenuItemCell.h"

@implementation MenuItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
