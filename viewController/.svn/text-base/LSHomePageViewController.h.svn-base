//
//  LSHomePageViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSImagesViewController.h"
#import "LSBaseProtocolEngine.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LSRecomCompanyPE.h"
#import "LSADPE.h"
#import "LSSelectDistrictProtocol.h"

@interface LSHomePageViewController : LSImagesViewController<LSBaseProtocolEngineDelegate,CLLocationManagerDelegate,UISearchBarDelegate,UINavigationBarDelegate,LSSelectDistrictProtocol>{
    
    IBOutlet UISearchBar		*mySearchBar;
    UILabel *cityLabel;
    NSInteger dataid;

    IBOutlet UIImageView* _ADView;//后期imagekit增加对button的处理后改成button
    
    IBOutlet UIImageView *company1;
    IBOutlet UIImageView *company2;
    IBOutlet UIImageView *company3;
    IBOutlet UILabel *companyName1;
    IBOutlet UILabel *companyName2;
    IBOutlet UILabel *companyName3;
    IBOutlet UIImageView *company4;
    IBOutlet UIImageView *company5;
    IBOutlet UIImageView *company6;
    IBOutlet UILabel *companyName4;
    IBOutlet UILabel *companyName5;
    IBOutlet UILabel *companyName6;

    IBOutlet UIImageView *company7;
    IBOutlet UIImageView *company8;
    IBOutlet UIImageView *company9;
    IBOutlet UILabel *companyName7;
    IBOutlet UILabel *companyName8;
    IBOutlet UILabel *companyName9;
    
    IBOutlet UIScrollView *updownScrollView;
    IBOutlet UIView *recommendView;
    
    LSRecomCompanyPE* _recomCompanyPE;
    LSADPE*  _ADPE;
    
    long _curCityID;
}
@property (nonatomic, retain) UISearchBar *mySearchBar;

@property (nonatomic, retain) UIImageView* ADView;


@property (nonatomic, retain) UIImageView *company1;
@property (nonatomic, retain) UIImageView *company2;
@property (nonatomic, retain) UIImageView *company3;
@property (nonatomic, retain) UILabel *companyName1;
@property (nonatomic, retain) UILabel *companyName2;
@property (nonatomic, retain) UILabel *companyName3;
@property (nonatomic, retain) UIImageView *company4;
@property (nonatomic, retain) UIImageView *company5;
@property (nonatomic, retain) UIImageView *company6;
@property (nonatomic, retain) UILabel *companyName4;
@property (nonatomic, retain) UILabel *companyName5;
@property (nonatomic, retain) UILabel *companyName6;

@property (nonatomic, retain) UIImageView *company7;
@property (nonatomic, retain) UIImageView *company8;
@property (nonatomic, retain) UIImageView *company9;
@property (nonatomic, retain) UILabel *companyName7;
@property (nonatomic, retain) UILabel *companyName8;
@property (nonatomic, retain) UILabel *companyName9;

@property (nonatomic, retain) UIScrollView *updownScrollView;
@property (nonatomic, retain) UIView *recommendView;
//@property (nonatomic, retain) NSString *cityID;

@end
