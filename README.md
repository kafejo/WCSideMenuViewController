## WCSideMenuViewController

It is improved version of [TWTSideMenuViewController](https://github.com/twotoasters/TWTSideMenuViewController "TWTSideMenuViewController") 

<img src="https://raw.github.com/kafejo/WCSideMenuViewController/master/TWTSideMenuViewController-Sample/screenshots/screenshot01.png" width="400">

### Usage
It's designed for immediate usage in your project. You can edit menu directly in storyboard or programmatically in MenuViewController.

There's mutable array of menu items 
```objective-c
self.menuItems = [@[@"Whatever", @"More"] mutableCopy];
```

If you want to change background you can to it also in MenuViewController (Image should be for @2x version 900x1036 px for portrait)

```objective-c
 self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy2.png"]];
```

And finally cell actions. I'm using Storyboard ID for views identification.

```objective-c
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

	NSString* pageName = @"";
	switch (indexPath.row) {
		case 0:
			pageName = @"MainViewController";
			break;
		case 1:
			pageName = @"MoreViewController";
			break;
		
		default:
			break;
	}
	if (![pageName isEqualToString:@""]) {
		UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
		MoreViewController *moreView = (MoreViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: pageName];
		[self.sideMenuViewController setMainViewController: [[UINavigationController alloc] initWithRootViewController:moreView] animated:YES closeMenu:YES];
	}

	[self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];

}
```

Also you can turn swipe gesture off in AppDelegate

```objective-c
    [self.sideMenuViewController.swipeRecognizer setEnabled:NO]; // default YES
```


### TODO

- Automatically adding menu button into each view
- <del>Swipe gesture</del>

### Requirements

- Base SDK: iOS 7
- Deployment Target: iOS 7+

### License

Available under the MIT License. See the LICENSE file for more.
