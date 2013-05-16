//
//  LoginViewController.h
//  LoginApp
//
//  Created by Chris Riccomini on 12/5/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//
#define kUsenameKey @"usernamekey"
#define kPasswordKey @"passwordkey"

#import <UIKit/UIKit.h>
@protocol ProcessDataDelegate <NSObject>
@required
- (void) SwitchView;
- (void)switchViewToTable;
-(BOOL)getNetworkStatue;
@end
@class RegistViewController;
@interface LoginViewController : UIViewController<UINavigationBarDelegate,UITableViewDelegate,
UITableViewDataSource> {
	IBOutlet UITextField *usernameField;
	IBOutlet UITextField *passwordField;
//	IBOutlet UIButton *loginButton;
//	IBOutlet UIButton *registButton;
//	IBOutlet UIActivityIndicatorView *loginIndicator;
//	IBOutlet UIImageView *loginInputView;
	//remote message
//	id <ProcessDataDelegate> delegate;
    
    IBOutlet UINavigationBar *myNaviBar;
    
    UITableView	*myTableView;
    RegistViewController *registViewController;
    NSDictionary * data;
    NSArray *arrayData;
    UIActivityIndicatorView *loginIndicator;
    
}

@property (nonatomic, retain) UITextField *usernameField;
@property (nonatomic, retain) UITextField *passwordField;
//@property (nonatomic, retain) UIButton *loginButton;
//@property (nonatomic, retain) UIButton *registButton;
//@property (nonatomic, retain) UIActivityIndicatorView *loginIndicator;

//@property (nonatomic, retain) UIImageView *loginInputView;
//remote message
//@property (retain) id delegate;
@property (nonatomic, retain) UINavigationBar *myNaviBar;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) RegistViewController *registViewController;
@property (nonatomic, retain) NSDictionary * data;
@property (nonatomic, retain) NSArray *arrayData;
@property (nonatomic, retain) UIActivityIndicatorView *loginIndicator;

- (IBAction) doLogin: (id) sender;
- (IBAction) registClick: (id) sender;
- (IBAction)backgroundClick:(id)sender;
@end
