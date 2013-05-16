//
//  LSAddNewsPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseProtocolEngine.h"
@class LSAddNewsRspData;
@interface LSAddNewsPE : LSBaseProtocolEngine{
    NSString *_content;
    NSString *_title;
    LSAddNewsRspData* _rspData;
}
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) LSAddNewsRspData* rspData;
@end
@interface LSAddNewsRspData : LSBaseResponseData
{
    NSDictionary* _rspDic;
}
@property (nonatomic, retain) NSDictionary* rspDic;
@end