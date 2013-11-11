//
//  MenuViewController.h
//  TWTSideMenuViewController-Sample
//
//  Created by Aleš Kocur on 11/11/13.
//  Copyright (c) 2013 Two Toasters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemCell.h"
#import "MoreViewController.h"
#import "TWTSideMenuViewController.h"

@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;


@end
