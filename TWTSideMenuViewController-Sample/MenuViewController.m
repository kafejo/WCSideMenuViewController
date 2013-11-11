//
//  MenuViewController.m
//  TWTSideMenuViewController-Sample
//
//  Created by Aleš Kocur on 11/11/13.
//  Copyright (c) 2013 Two Toasters. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) NSMutableArray *menuItems;

@end

@implementation MenuViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy2.png"]];
    [self.view insertSubview:self.backgroundImageView belowSubview:self.tableView];
    
    self.menuItems = [@[@"Whatever", @"More", @"Whatever", @"More", @"Whatever", @"More"] mutableCopy];
    
    self.searchBar.backgroundImage = [UIImage new];
    self.searchBar.alpha = 0.8f;
    // For removing empty cells in table view
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    // Registering cell indentifier for search bar
    [self.searchDisplayController.searchResultsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MenuItemCell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuWasOpened:) name:@"MenuWasOpened" object:nil];
}

- (void)menuWasOpened:(NSNotification*)note {
    [self hideAllCells];
    [self animateCellsAtIndex:0 withDelay:0.2];
}

-(void)hideAllCells{
    for (int i = 0; i < [self.menuItems count]; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:index];
        cell.alpha = 0.0f;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        
    
    static NSString *CellIdentifier = @"MenuItemCell";
    
    
    MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    
    cell.text.text = [self.menuItems objectAtIndex:indexPath.row];
    cell.text.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    
    
    return cell;
    
    
}

-(void)animateCellsAtIndex:(NSInteger)i withDelay:(CGFloat)delay{
    
    if (i >= [self.menuItems count]) {
        return ;
    }
    
    NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:index];
    [UIView animateWithDuration:0.45 delay:delay options:UIViewAnimationOptionTransitionCurlDown animations:^{
        cell.alpha = 0.0f;
        cell.alpha = 1.0f;
    } completion:^(BOOL finished) {
        
    }];
    [self animateCellsAtIndex:(i+1) withDelay:(delay+0.04)];
    /*
    [UIView animateWithDuration:2.0 animations:^{
      
    } completion:^(BOOL finished) {
        
    }];
    */
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   // NSLog(@"Selected: %i", indexPath.row);
    NSString* storyboardID = @"";
    switch (indexPath.row) {
        case 0:
            storyboardID = @"MainViewController";
            break;
        case 1:
            storyboardID = @"MoreViewController";
            break;
            
        default:
            break;
    }
    if (![storyboardID isEqualToString:@""]) {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
        MoreViewController *moreView = (MoreViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: storyboardID];
        [self.sideMenuViewController setMainViewController: [[UINavigationController alloc] initWithRootViewController:moreView] animated:YES closeMenu:YES];
    }
    
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
  
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
