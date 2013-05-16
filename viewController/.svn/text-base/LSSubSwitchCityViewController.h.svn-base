//
//  LSSubSwitchCityViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSListViewController.h"
#import "LSCityListPE.h"
#import "LSSelectDistrictProtocol.h"

@interface LSSubSwitchCityViewController : LSListViewController
{
    id<LSSelectDistrictProtocol> _selectDelegate;
    LSDataCity* _city;
    BOOL _canToSub;
}
//--------输入参数------
@property (nonatomic, retain) LSDataCity* city;
@property (nonatomic, assign) id<LSSelectDistrictProtocol> selectDelegate;
@property (nonatomic) BOOL canToSub;//进入下一级
@end
