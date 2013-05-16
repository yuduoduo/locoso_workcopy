//
//  MoreViewController.h
//  Locoso
//
//  Created by yongchang hu on 11-12-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSBaseViewController.h"
#import "LSSelectDistrictProtocol.h"

@class AboutUsViewController;
@class UserFeedbackViewController;


@interface MoreViewController : LSBaseViewController<UITableViewDelegate,
UITableViewDataSource,LSSelectDistrictProtocol>{
    NSMutableArray *menuList;
    UITableView	*myTableView;

    NSArray *pageNames;

    AboutUsViewController *aboutUsViewController;
    UserFeedbackViewController *userFeedbackViewController;

    UIActivityIndicatorView *indicatorview;
    
    NSDictionary * data;
}
@property (nonatomic, retain) NSMutableArray *menuList;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;


@property (nonatomic, retain) AboutUsViewController *aboutUsViewController;
@property (nonatomic, retain) UserFeedbackViewController *userFeedbackViewController;

@property (nonatomic, retain) UIActivityIndicatorView *indicatorview;

@property (nonatomic, retain) NSDictionary * data;
@end
