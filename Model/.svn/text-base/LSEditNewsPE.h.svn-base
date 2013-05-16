//
//  LSEditNewsPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseProtocolEngine.h"
#import "LSData.h"

@class LSNewsRspData;
@interface LSEditNewsPE : LSBaseProtocolEngine{
NSInteger _productid;

    LSNewsRspData* _rspData;
}
@property (nonatomic) NSInteger productid;
@property (nonatomic, retain) LSNewsRspData* rspData;

@end
@interface LSNewsRspData : LSBaseResponseData
{
    NSDictionary* _newsDic;
}
@property (nonatomic, retain) NSDictionary* newsDic;
@end