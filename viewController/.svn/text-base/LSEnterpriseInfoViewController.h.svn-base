//
//  LSEnterpriseInfoViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseViewController.h"
#import "LSLoadEnterpriseInfoPE.h"
#import "LSSaveEnterpriseInfoPE.h"
#import "LSSelectDistrictProtocol.h"
#import "LSSelectIndustryProtocol.h"
@interface LSEnterpriseInfoViewController : LSBaseViewController<LSBaseProtocolEngineDelegate,UIScrollViewDelegate,LSSelectDistrictProtocol,LSSelectIndustryProtocol>{
    IBOutlet    UIView *viewOne;
    IBOutlet    UIView *viewTwo;
    UIScrollView *upDownScrollView;
    
    IBOutlet    UITextField *companyNameField;
    IBOutlet    UITextField *companyPhoneField;
    IBOutlet    UITextField *companyAdressField;
    IBOutlet    UITextField *contactCallField;
    IBOutlet    UITextField *contactPhoneField;
    IBOutlet    UITextField *contactEmailField;
    IBOutlet    UITextField *contactWebField;
    IBOutlet    UITextField *contactNameField;
    NSInteger itype;

    
    IBOutlet   UITextField *cityLable;
    IBOutlet   UITextField *areaLable;
    NSMutableDictionary *modifyDic;
    LSLoadEnterpriseInfoPE* _loadEnterpriseInfoPE;
    LSSaveEnterpriseInfoPE* _saveEnterpriseInfoPE;
    LSDataEnterprise* enterpriseData;
    NSInteger _companyID;
    bool fromMain;
}
@property (nonatomic) NSInteger companyID;
@property (nonatomic, retain) NSMutableDictionary *modifyDic;
@property (nonatomic, retain) UIView *viewOne;
@property (nonatomic, retain) UIView *viewTwo;
@property (nonatomic, retain) UIScrollView *upDownScrollView;
@property (nonatomic, retain) LSDataEnterprise* enterpriseData;
@property (nonatomic, retain) UITextField *companyNameField;
@property (nonatomic, retain) UITextField *companyPhoneField;
@property (nonatomic, retain) UITextField *companyAdressField;
@property (nonatomic, retain) UITextField *contactCallField;
@property (nonatomic, retain) UITextField *contactPhoneField;
@property (nonatomic, retain) UITextField *contactEmailField;
@property (nonatomic, retain) UITextField *contactWebField;
@property (nonatomic, retain) UITextField *contactNameField;

@property (nonatomic, retain) UITextField *cityLable;
@property (nonatomic, retain) UITextField *areaLable;
@end
