//
//  LSFilterViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseViewController.h"
#import "LSSelectDistrictProtocol.h"
#import "LSSelectIndustryProtocol.h"

@interface LSFilterViewController : LSBaseViewController
<UITableViewDataSource,UITableViewDelegate/*,LSSelectDistrictProtocol,LSSelectIndustryProtocol*/>
{
    UITableView* _tableView;
    LSDataCity* _district;
    LSDataCategory* _industry;
    id<LSSelectDistrictProtocol,LSSelectIndustryProtocol> _selectDelegate;
}
@property (nonatomic, retain) LSDataCity* district;
@property (nonatomic, retain) LSDataCategory* industry ;
@property (nonatomic, assign) id<LSSelectDistrictProtocol,LSSelectIndustryProtocol> selectDelegate;
@end
