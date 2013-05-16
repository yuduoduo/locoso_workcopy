//
//  LSTrafficStaticsViewControllerViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseViewController.h"
#import "LSStaticsKeywordPE.h"
#import "LSStaticsReportPE.h"
@interface LSTrafficStaticsViewController : LSBaseViewController<LSBaseProtocolEngineDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    UIScrollView *upDownScrollView;
    UITableView	*myTableView;
    IBOutlet UIView *trafficDetailHeaderView;
    IBOutlet UIView *trafficFootView;
    IBOutlet UIImageView *buttonImage;
    IBOutlet UILabel *visitNumber;
    IBOutlet   UILabel *todayLable;
    NSInteger whoIsSelected;
    LSStaticsKeywordPE* _staticsKeyworldPE;
    LSStaticsReportPE* _staticsReportPE;
}
@property (nonatomic, retain) UIScrollView *upDownScrollView;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) UIView *trafficDetailHeaderView;
@property (nonatomic, retain) UIView *trafficFootView;
@property (nonatomic, retain) UIImageView *buttonImage;
@property (nonatomic, retain) UILabel *visitNumber;
@property (nonatomic ,retain ) UILabel *todayLable;
@end
