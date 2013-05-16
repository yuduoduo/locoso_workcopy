//
//  LSCompanyInfoPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseProtocolEngine.h"
#import "LSData.h"
@class LSComapnyInfoRspData;
@interface LSCompanyInfoPE : LSBaseProtocolEngine{
    
    LSComapnyInfoRspData* _rspData;
    NSUInteger _dataid;
}
@property (nonatomic, retain) LSComapnyInfoRspData* rspData;
@property (nonatomic) NSUInteger dataid;
@end

@interface LSComapnyInfoRspData : LSBaseResponseData
{
    LSDataCompanyDetail* _arrCategory;
}
@property (nonatomic, retain) LSDataCompanyDetail* arrCategory;
@end