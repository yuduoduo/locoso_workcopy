//
//  LSMyCompanyViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverlayViewController.h"
#import "LSGetCompanyIdPE.h"
#import  "LSMyCompanyPE.h"
#import "LSMyCompanyCountPE.h"
#import "LSImagesViewController.h"
#import "LSPhotoUploadPE.h"
#import "LSCompanyMapViewController.h"
#import "LSLoginOutManagePE.h"

@interface LSMyCompanyViewController : LSImagesViewController<UIScrollViewDelegate,UITableViewDelegate,
UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,
OverlayViewControllerDelegate,LSBaseProtocolEngineDelegate,LSCompanyMapDelegate>{
    //head detail view
    UIView *myCompanyDetailHeaderView;
    UIButton *photoButton;
	UILabel *certifyLabel;
    UILabel *adressLabel;
    UILabel *phoneLabel;
    UILabel *companynameLabel;
    UILabel *popularLable;
    UILabel *websiteLable;
    //scroll
    UIScrollView *upDownScrollView;
    
    //product manage
    UIButton *productManageButton;
    UIButton *newsManageButton;
    UIButton *photoManageButton;
    UIView *myCompanyManageView;
    
    //menu list
    NSMutableArray *menuList;
    UITableView	*myTableView;

    
    UIImageView *companyLogoImage;
    UIImageView *markImage;

    
    
    OverlayViewController *overlayViewController; // the camera custom overlay view
    NSMutableArray *capturedImages;
    

    NSArray *imageIconArray;
    
    LSGetCompanyIdPE *_getCompanyIdPE;
    LSMyCompanyPE *_myCompanyPE;
    LSMyCompanyCountPE *_companyCountPE;
    LSPhotoUploadPE* _photoUploadPE;
    LSLoginOutManagePE* _loginOutPE;
}
@property (nonatomic, retain) IBOutlet UILabel *popularLable;
@property (nonatomic, retain) IBOutlet UILabel *websiteLable;


@property (nonatomic, retain) IBOutlet UIView *myCompanyDetailHeaderView;
@property (nonatomic, retain) IBOutlet UIButton *photoButton;
@property (nonatomic, retain) IBOutlet UILabel *companynameLabel;
@property (nonatomic, retain) IBOutlet UILabel *certifyLabel;
@property (nonatomic, retain) IBOutlet UILabel *adressLabel;
@property (nonatomic, retain) IBOutlet UILabel *phoneLabel;

@property (nonatomic, retain) IBOutlet UIButton *productManageButton;
@property (nonatomic, retain) IBOutlet UIButton *newsManageButton;
@property (nonatomic, retain) IBOutlet UIButton *photoManageButton;

@property (nonatomic, retain) IBOutlet UIView *myCompanyManageView;

@property (nonatomic, retain) NSMutableArray *menuList;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;


@property (nonatomic, retain) IBOutlet UIImageView *companyLogoImage;
@property (nonatomic, retain) IBOutlet UIImageView *markImage;


@property (nonatomic, retain) OverlayViewController *overlayViewController;
@property (nonatomic, retain) NSMutableArray *capturedImages;


@end
