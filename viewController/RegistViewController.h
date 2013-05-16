//
//  RegistViewController.h
//  Locoso
//
//  Created by yongchang hu on 11-12-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistViewController : UIViewController<UINavigationBarDelegate,UITableViewDelegate,
UITableViewDataSource>{
    IBOutlet UINavigationBar *myNaviBar;
    
    IBOutlet UITextField *usernameField;
	IBOutlet UITextField *passwordField;

    UITableView	*myTableView;
    NSDictionary * data;
    NSArray *arrayData;
    UIActivityIndicatorView *indicatorview;
}
@property (nonatomic, retain) UINavigationBar *myNaviBar;

@property (nonatomic, retain) UITextField *usernameField;
@property (nonatomic, retain) UITextField *passwordField;

@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) NSDictionary * data;
@property (nonatomic, retain) NSArray *arrayData;
@property (nonatomic, retain) UIActivityIndicatorView *indicatorview;
@end
