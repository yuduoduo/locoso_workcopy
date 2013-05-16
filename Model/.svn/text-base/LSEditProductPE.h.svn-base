//
//  LSEditProductPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseProtocolEngine.h"
@class LSProductRspData;
@interface LSEditProductPE : LSBaseProtocolEngine{

NSInteger _productid;

    NSDictionary* _dic;
LSProductRspData* _rspData;
}
@property (nonatomic) NSInteger productid;
@property (nonatomic, retain) LSProductRspData* rspData;
@property (nonatomic, retain) NSDictionary* dic;
@end
@interface LSProductRspData : LSBaseResponseData
{
    NSDictionary* _newsDic;
}
@property (nonatomic, retain) NSDictionary* newsDic;
@end