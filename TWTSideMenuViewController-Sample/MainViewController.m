//
//  MainViewController.m
//  TWTSideMenuViewController-Sample
//
//  Created by Aleš Kocur on 11/11/13.
//  Copyright (c) 2013 Two Toasters. All rights reserved.
//

#import "MainViewController.h"
#import "TWTSideMenuViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    openItem.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = openItem;
    

	// Do any additional setup after loading the view.
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
