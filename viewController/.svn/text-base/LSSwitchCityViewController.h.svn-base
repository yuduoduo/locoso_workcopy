//
//  LSSwitchCityViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSListViewController.h"
#import "LSLocationKit.h"
#import "LSLocationTableViewCell.h"
#import "LSCityIDPE.h"
#import "LSSelectDistrictProtocol.h"

@interface LSSwitchCityViewController : LSListViewController
<LSLocationKitDelegate,LSLocationTableViewCellDelegate>
{
    LSCityIDPE *_cityIDPE;
    BOOL _cityIDSuccess;
    id<LSSelectDistrictProtocol> _selectDelegate;
}
@property (nonatomic, assign) id<LSSelectDistrictProtocol> selectDelegate;
@end
