//
//  MoreViewController.m
//  Locoso
//
//  Created by yongchang hu on 11-12-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MoreViewController.h"
//#import "SwitchCityViewController.h"
#import "AboutUsViewController.h"
#import "UserFeedbackViewController.h"
#import "SizeOfControllerFont.h"
#import "JsonResturnCheck.h"
#import "CheckNetwork.h"
#import "MyDataSource.h"
#import "commonManager.h"
#import "LSWatchHistoryViewController.h"
#import "LSCollectionViewController.h"
#import "LSSwitchCityViewController.h"
#import "LSModalView.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
@implementation MoreViewController
@synthesize menuList,myTableView;

@synthesize userFeedbackViewController,aboutUsViewController,indicatorview,data;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"更多", @"更多");
        self.tabBarItem.image = [UIImage imageNamed:@"NewMoreTab"];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [myTableView setDelegate:self];
    [myTableView setDataSource:self];
}
- (void)dealloc {
    [menuList release];
    [myTableView release];
    [super dealloc];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    menuList = nil;
    myTableView = nil;
}
-(void)viewDidAppear:(BOOL)animated
{
    [myTableView reloadData];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark -
#pragma mark UITableView Delegate/Datasource

// Determines the number of sections within this table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // This displays a single list of recipes, so one section will do.
	return 2; 
}

// Determines the number of rows for the argument section number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Since this sample has only one section, assume we were passed section = 1, and return the number of recipes
	switch (section) {
            
        case 0:
            return 4;
            break;
        case 1:
            return 3;
            break;   
        default:
            break;
    }
    return 0;
}
-(BOOL)checkWhetherLogin
{
    
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"whetherLoginIn"];
}
// Create or Access and return appropriate cell identified by the argument indexPath (i.e. Section number and Row number combination)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *kCellIdentifier = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (!cell)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kCellIdentifier] autorelease];
        
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.backgroundColor = [UIColor clearColor];
		cell.textLabel.opaque = NO;
		cell.textLabel.textColor = [UIColor blackColor];
		cell.textLabel.highlightedTextColor = [UIColor whiteColor];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:MOREVIEWCONTROLLER_LIST_HEAD_SIZE];
		
		cell.detailTextLabel.backgroundColor = [UIColor clearColor];
		cell.detailTextLabel.opaque = NO;
		cell.detailTextLabel.textColor = [UIColor grayColor];
		cell.detailTextLabel.highlightedTextColor = [UIColor whiteColor];
		cell.detailTextLabel.font = [UIFont systemFontOfSize:MOREVIEWCONTROLLER_LIST_DETAIL_SIZE];
    }
    
	switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {    cell.textLabel.text = @"切换城市";
                    cell.detailTextLabel.text = [LSGlobalData sharedInstance].systemConfig.selectedCity.shortname;
                    break;
                }
                case 1:
                    cell.textLabel.text = @"帐户设置";
                    if ([self checkWhetherLogin]){
                        cell.detailTextLabel.text = @"已登录";
                    }else
                    {
                         cell.detailTextLabel.text = @"未登录";
                    }
                    
                    break;
                case 2:
                    cell.textLabel.text = @"浏览历史";
                    break;
                case 3:
                    cell.textLabel.text = @"收藏";
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"检查更新";
                    break;
                case 1:
                    cell.textLabel.text = @"意见反馈";
                    break;
                case 2:
                    cell.textLabel.text = @"关于";
                    break;    
                default:
                    break;
            }
            break;
        
        default:
            
            break;
    }

	
	return cell;
}

#pragma mark LSSelectDistrictProtocol
- (void)didSelectDistrict:(LSDataCity *)aCity
{
    [self.navigationController popToViewController:self animated:YES];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (AboutUsViewController *)aboutUsViewController {
    // Instantiate the detail view controller if necessary.
    if (aboutUsViewController == nil) {
        aboutUsViewController = [[AboutUsViewController alloc] initWithNibName:@"AboutUsViewController" bundle:nil];
    }
    return aboutUsViewController;
}
- (UserFeedbackViewController *)userFeedbackViewController {
    // Instantiate the detail view controller if necessary.
    if (userFeedbackViewController == nil) {
        userFeedbackViewController = [[UserFeedbackViewController alloc] initWithNibName:@"UserFeedbackViewController" bundle:nil];
    }
    return userFeedbackViewController;
}

-(void)goToTargetView:(UIViewController*)targetViewController
{
    //UIViewController *targetViewController = self.switchCityViewController;
    [self.navigationController pushViewController:targetViewController animated:YES];
}

-(void)startCheckLastVersion
{
    NSString *hostStr = [commonManager getHostStr];hostStr = [hostStr stringByAppendingString:@"/client.action?client=iphone"];
   
    
//    NSDictionary *data = nil;
    if ([CheckNetwork isExistenceNetwork]) {
		data = [[MyDataSource fetchLibraryInformation:hostStr] retain];
	}
    if ([JsonResturnCheck JsonResturnCheck:data]) {
        [indicatorview stopAnimating];
        return;
    }
	//NSLog(@"value=",[[data valueForKey:[[data allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]);
	
    

    
    
    
    [indicatorview stopAnimating];
    
    if ([data count]) {
        NSString *version = [data objectForKey:@"versions"];
        float iversion = [version floatValue];
        
        NSString *boundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        float iboundversion = [boundleVersion floatValue];
        
        if (iversion > iboundversion) {
            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"" message:@"访问AppStore获取最新版本？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil] autorelease];
            [alert show];
        }else
        {
            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"" message:@"当前版本是最新的！" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles:nil] autorelease];
            [alert show];
        }
    }
    
    
    [self stopWaiting];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        //
    }
}

-(void)checkTheLastVersion
{
    [indicatorview startAnimating];
    
    [self performSelector:@selector(startCheckLastVersion) withObject:nil afterDelay:0.0];
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    LSSwitchCityViewController* vc = [[LSSwitchCityViewController alloc] initWithNibName:@"LSSwitchCityViewController" bundle:nil];
                    vc.selectDelegate = self;
                    [self.navigationController pushViewController:vc animated:YES];
                    [vc release];
                    break;
                }
                case 1:
                {
                    BOOL islogin = [[NSUserDefaults standardUserDefaults] boolForKey:@"whetherLoginIn"];
                    if (islogin) {
                       if( [LSModalAlertView confirmMessageBox:@"" message:@"是否退出登录"]  )
                       {
                           [[NSNotificationCenter defaultCenter] postNotificationName:LSNOTIFICATION_MYCOMPANY_CLEAR_DATA object:self userInfo:nil];
                           [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"whetherLoginIn"];
                           [[NSUserDefaults standardUserDefaults] synchronize];
                           [myTableView reloadData];
                       }
                    }else {
                        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
                        [appDelegate setTabBarIndex:3];
                        {
                            //
                            LoginViewController *loginvew=[[[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil] autorelease];
                            
                            [self.tabBarController presentModalViewController:loginvew animated:NO];
                            
                        }
                    }
                }
                    break;  
                case 2:
                    
                {
                    LSWatchHistoryViewController *targetViewController = [[[LSWatchHistoryViewController alloc]initWithNibName:@"LSWatchHistoryViewController" bundle:nil] autorelease];
                    
                    [self.navigationController pushViewController:targetViewController animated:YES];
                    
                }
                    break; 
                case 3:
                    
                {
                    
                    LSCollectionViewController *targetViewController = [[[LSCollectionViewController alloc]initWithNibName:@"LSCollectionViewController" bundle:nil] autorelease];
                    
                    [self.navigationController pushViewController:targetViewController animated:YES];
                }
                    break; 
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    [self startWaiting];
                    [self checkTheLastVersion];   
                    
                    break;
                case 1:
                    [self goToTargetView:self.userFeedbackViewController];
                    break;  
                case 2:
                    [self goToTargetView:self.aboutUsViewController];
                    break; 
                default:
                    break;
            }
            break;   
        default:
            break;
    }
    
    
    
}

@end
