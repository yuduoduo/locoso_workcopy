//
//  LSSearchResultViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyListViewController.h"
#import "LSSelectDistrictProtocol.h"
#import "LSSelectIndustryProtocol.h"

@interface LSSearchResultViewController : LSCompanyListViewController
<LSSelectDistrictProtocol,LSSelectIndustryProtocol>
{
    NSString* _keyword;
    LSDataCity* _district;
    LSDataCategory* _industry;
}
@property (nonatomic, copy) NSString* keyword;
@property (nonatomic,retain) LSDataCity* district;
@property (nonatomic,retain) LSDataCategory* industry;
@end
