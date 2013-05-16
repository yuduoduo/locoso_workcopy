//
//  LSMyCompanyCountPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSListProtocolEngine.h"
@class LSMyCountRspData;
@interface LSMyCompanyCountPE : LSBaseProtocolEngine{
    
    LSMyCountRspData* _rspData;
    
}
@property (nonatomic, retain) LSMyCountRspData* rspData;

@end

@interface LSMyCountRspData : LSBaseResponseData
{
    LSDataCount* _arrCategory;
}
@property (nonatomic, retain) LSDataCount* arrCategory;
@end


