//
//  AppDelegate.h
//  Locoso
//
//  Created by yongchang hu on 11-12-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstHelpViewController.h"
@class ContentController;
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate,UITabBarDelegate>{
    //UINavigationController *navigationController;
    UITabBarController *tabBarController;
    FirstHelpViewController *firstview;
    ContentController *contentController;
}
@property (nonatomic, retain) UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
//@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) FirstHelpViewController *firstview;
@property (nonatomic, retain) IBOutlet ContentController *contentController;

- (void)initApp;
- (void)uninitApp;
-(void)setTabBarIndex:(NSInteger)index;
-(void)addMainView;
@end
