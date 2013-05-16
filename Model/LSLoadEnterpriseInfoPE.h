//
//  LSLoadEnterpriseInfoPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseProtocolEngine.h"
#import "LSData.h"
@class LSEnterpriseInfoRspData;
@interface LSLoadEnterpriseInfoPE : LSBaseProtocolEngine
{
    long companyID;
    LSEnterpriseInfoRspData* _rspData;
}
@property (nonatomic) long companyID;

@property (nonatomic, retain) LSEnterpriseInfoRspData* rspData;

@end

@interface LSEnterpriseInfoRspData : LSBaseResponseData
{
    NSDictionary* _arrCategory;
}
@property (nonatomic, retain) NSDictionary* arrCategory;
@end