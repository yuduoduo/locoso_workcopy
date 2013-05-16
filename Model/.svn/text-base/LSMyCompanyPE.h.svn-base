//
//  LSMyCompanyPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSListProtocolEngine.h"
@class LSMyCompanyRspData;
@interface LSMyCompanyPE : LSBaseProtocolEngine{

    LSMyCompanyRspData* _rspData;
    NSUInteger _companyID;
}
@property (nonatomic, retain) LSMyCompanyRspData* rspData;
@property (nonatomic) NSUInteger companyID;
@end

@interface LSMyCompanyRspData : LSBaseResponseData
{
    NSDictionary* _arrCategory;
}
@property (nonatomic, retain) NSDictionary* arrCategory;
@end