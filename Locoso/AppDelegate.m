//
//  AppDelegate.m
//  Locoso
//
//  Created by yongchang hu on 11-12-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ContentController.h"


#import "LSCategoryListViewController.h"


#import "LoginViewController.h"
#import "MoreViewController.h"
#import "CheckNetwork.h"
#import "JsonResturnCheck.h"
#import "MyDataSource.h"
#import "commonManager.h"
#import "LSHomePageViewController.h"
#import "LSMyCompanyViewController.h"
#import "LSBaseProtocolEngine.h"
#import "LSCommonErrorParser.h"
#import "LSGlobalData.h"
#import "LSSearchViewController.h"

@implementation UINavigationBar (CustomImage)  
- (void)drawRect:(CGRect)rect {  
    UIImage *image = [UIImage imageNamed: @"tou_bg.png"];  
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];  
}  
@end 


@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController,firstview,contentController;
//@synthesize navigationController;

- (void)initApp
{
    [[LSGlobalData sharedInstance] readFromLocal];
    [LSBaseProtocolEngine setDefaultErrorParser:[LSCommonErrorParser sharedInstance]];
}

- (void)uninitApp
{
    [[LSGlobalData sharedInstance] saveToLocal];
}

-(void)addMainView
{
    // Override point for customization after application launch.

    UIViewController *viewController1 = [[[LSHomePageViewController alloc] initWithNibName:@"LSHomePageViewController" bundle:nil] autorelease];
    
//    UIViewController *viewController2 = [[[SortViewController alloc] initWithNibName:@"SortViewController" bundle:nil]autorelease];
    UIViewController *viewController2 = [[[LSCategoryListViewController alloc] initWithNibName:@"LSCategoryListViewController" bundle:nil]autorelease];
//    UIViewController *viewController3 = [[[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil]autorelease];
        UIViewController *viewController3 = [[[LSSearchViewController alloc] initWithNibName:@"LSSearchViewController" bundle:nil]autorelease];
//    UIViewController *viewController4 = [[[MyCompanyViewController alloc] initWithNibName:@"MyCompanyViewController" bundle:nil]autorelease];
    UIViewController *viewController4 = [[[LSMyCompanyViewController alloc] initWithNibName:@"LSMyCompanyViewController" bundle:nil]autorelease];
    //UIViewController *viewController4 = [[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil];
    UIViewController *viewController5 = [[[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:nil]autorelease];
    
    
    UINavigationController *navIntroductionController1=[[[UINavigationController alloc] init]  autorelease];
    [navIntroductionController1 pushViewController:viewController1 animated:NO];
    UINavigationController *navIntroductionController2=[[[UINavigationController alloc] init]  autorelease];
    [navIntroductionController2 pushViewController:viewController2 animated:NO];
    UINavigationController *navIntroductionController3=[[[UINavigationController alloc] init] autorelease];
    [navIntroductionController3 pushViewController:viewController3 animated:NO];
    UINavigationController *navIntroductionController4=[[[UINavigationController alloc] init]  autorelease];
    [navIntroductionController4 pushViewController:viewController4 animated:NO];
    UINavigationController *navIntroductionController5=[[[UINavigationController alloc] init] autorelease];
    [navIntroductionController5 pushViewController:viewController5 animated:NO];
    
    
//        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 5.0) {
//            [navIntroductionController1.navigationBar setBackgroundImage:[UIImage imageNamed:@"tou_bg.png"] forBarMetrics:0]; 
//            [navIntroductionController2.navigationBar setBackgroundImage:[UIImage imageNamed:@"tou_bg.png"] forBarMetrics:0]; 
//            [navIntroductionController3.navigationBar setBackgroundImage:[UIImage imageNamed:@"tou_bg.png"] forBarMetrics:0]; 
//            [navIntroductionController4.navigationBar setBackgroundImage:[UIImage imageNamed:@"tou_bg.png"] forBarMetrics:0]; 
//    
//        }
//        else
    {
        float r = (float)(1.0);
        float g = (float)(0.7843);
        float b = (float)(0);
        navIntroductionController1.navigationBar.tintColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
        navIntroductionController2.navigationBar.tintColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
        navIntroductionController3.navigationBar.tintColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
        navIntroductionController4.navigationBar.tintColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
        navIntroductionController5.navigationBar.tintColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    }
    
    tabBarController = [[[UITabBarController alloc] init] autorelease];
    //self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2,viewController3, viewController4,viewController5, nil];
    tabBarController.viewControllers = [NSArray arrayWithObjects:navIntroductionController1, navIntroductionController2,navIntroductionController3, navIntroductionController4,navIntroductionController5, nil];
    self.window.rootViewController = self.tabBarController;
    
    
    tabBarController.delegate = self;
    [tabBarController setDelegate:self];
    //navigationController = [[UINavigationController alloc] initWithRootViewController:self.window.rootViewController];
    //navigationController = [[UINavigationController alloc] init];
    
    //[self.window addSubview:navigationController.view];
    [self.window addSubview:tabBarController.view];
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //程序初始化
    [self initApp];
    
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    BOOL firstrun = [[NSUserDefaults standardUserDefaults] boolForKey:@"firstrunapp"];
	if (!firstrun) 
    {
        [[NSBundle mainBundle] loadNibNamed:@"PhoneContent" owner:self options:nil];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"firstrunapp"];
        [self.window addSubview:self.contentController.view];
    }
    else
    {
        
        [self addMainView];
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

/*
- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after application launch

    BOOL firstrun = [[NSUserDefaults standardUserDefaults] boolForKey:@"firstrunapp"];
	if (!firstrun) {
        [[NSBundle mainBundle] loadNibNamed:@"PhoneContent" owner:self options:nil];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"firstrunapp"];
        [self.window addSubview:self.contentController.view];
    }else
    {
    
        [self addMainView];
    }
	
    
    [self.window makeKeyAndVisible];

    [self startCheckLastVersion];
}
 */
-(void)startCheckLastVersion
{
    NSString *hostStr = [commonManager getHostStr];hostStr = [hostStr stringByAppendingString:@"/client.action?client=iphone"];
    NSLog(@"%@",hostStr);
    
        NSDictionary *data = nil;
    if ([CheckNetwork isExistenceNetwork]) {
		data = [MyDataSource fetchLibraryInformation:hostStr];
	}
    if ([JsonResturnCheck JsonResturnCheck:data]) {
        
        return;
    }

    if ([data count]) {
        NSString *version = [data objectForKey:@"versions"];
        float iversion = [version floatValue];
        
        NSString *boundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        float iboundversion = [boundleVersion floatValue];
        
        if (iversion > iboundversion) {
            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"" message:@"访问AppStore获取最新版本？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil] autorelease];
            [alert show];
        }
        
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        //
    }
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    //[[NSUserDefaults standardUserDefaults] setBool:false  forKey:@"whetherLoginIn"];
    [[LSGlobalData sharedInstance] saveToLocal];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    if (![CheckNetwork isExistenceNetwork])
    {
        [tabBarController setSelectedIndex:0];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self uninitApp];
    [[NSUserDefaults standardUserDefaults] setBool:false  forKey:@"whetherLoginIn"];
}

-(BOOL)whetherLoginIn
{
    
    return [[[NSUserDefaults standardUserDefaults] stringForKey:@"whetherLoginIn"] boolValue];
}

// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{

    
    if (tabBarController.selectedIndex == 3) {
        //check if login
        if (![self whetherLoginIn]) {
            //
            LoginViewController *loginvew=[[[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil] autorelease];
            
            [self.tabBarController presentModalViewController:loginvew animated:NO];
            
        }
        
    }
}


/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/
//+ (UINavigationBar *)createNavigationBarWithBackgroundImage:(UIImage *)backgroundImage title:(NSString *)title {
//    
//    UINavigationBar *customNavigationBar = [[[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
//    UIImageView *navigationBarBackgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
//    [customNavigationBar addSubview:navigationBarBackgroundImageView];
//    UINavigationItem *navigationTitle = [[UINavigationItem alloc] initWithTitle:title];
//    [customNavigationBar pushNavigationItem:navigationTitle animated:NO];
//    [navigationTitle release];
//    [navigationBarBackgroundImageView release];
//    return customNavigationBar;
//}
//-(void)setNewTabbarIndex:(id)index{
//    tabBarController.selectedIndex = [index intValue];
//}
-(void)setTabBarIndex:(NSInteger)index
{
    [tabBarController setSelectedIndex:index];
    
//    [self performSelectorOnMainThread:@selector(setNewTabbarIndex:) withObject:[NSNumber numberWithInt: index] waitUntilDone:YES]; 
}
@end
