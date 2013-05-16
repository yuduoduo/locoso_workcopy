//
//  LSCompanyDetailViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSImagesViewController.h"
#import "LSCompanyInfoPE.h"
#import "LSCompanyProductListPE.h"
#define COMPANY_DETAIL_HEAD_VIEW_HEIGHT 275
@interface LSCompanyDetailViewController : LSImagesViewController<LSBaseProtocolEngineDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{
    LSCompanyInfoPE* _companyInfoPE;
    LSCompanyProductListPE *_productListPE;
    
    UIView *companyDetailHeaderView;
    UIView *companyDetailManageHeaderView;
    UIButton *photoButton;
	UILabel *certifyLabel;
    UILabel *adressLabel;
    UILabel *phoneLabel;
    UILabel *companyName;
    UILabel *msnNumber;
    UILabel *popularNumber;
    UIButton *mapButton;

    
    //scroll
    UIScrollView *upDownScrollView;

    
    UIButton *companyDetailButton;
    UIButton *messageListButton;
    
    UIImageView *companyLogoImage;
    UIImageView *markImage;

    UITableView	*myTableView;
    long companyID;
}
@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) IBOutlet UIView *companyDetailHeaderView;
@property (nonatomic, retain) IBOutlet UIView *companyDetailManageHeaderView;
@property (nonatomic, retain) IBOutlet UIButton *photoButton;
@property (nonatomic, retain) IBOutlet UILabel *certifyLabel;
@property (nonatomic, retain) IBOutlet UILabel *adressLabel;
@property (nonatomic, retain) IBOutlet UILabel *phoneLabel;
@property (nonatomic, retain) IBOutlet UILabel *msnNumber;
@property (nonatomic, retain) IBOutlet UILabel *companyName;
@property (nonatomic, retain) IBOutlet UILabel *popularNumber;
@property (nonatomic, retain) IBOutlet UIButton *mapButton;


@property (nonatomic, retain) IBOutlet UIButton *companyDetailButton;
@property (nonatomic, retain) IBOutlet UIButton *messageListButton;

@property (nonatomic, retain) IBOutlet UIImageView *companyLogoImage;
@property (nonatomic, retain) IBOutlet UIImageView *markImage;
@property (nonatomic) long companyID;

@end
