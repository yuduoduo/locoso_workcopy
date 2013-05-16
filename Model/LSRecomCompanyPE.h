//
//  NSObject+LSRecomCompanyPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSBaseProtocolEngine.h"
@class LSRecommComapnyRspData;

@interface  LSRecomCompanyPE: LSBaseProtocolEngine{
    LSRecommComapnyRspData* _rspData;
    long _cityID;
}
@property (nonatomic, retain) LSRecommComapnyRspData* rspData;
@property (nonatomic) long cityID;
@end

@interface LSRecommComapnyRspData : LSBaseResponseData
{
    NSMutableArray* _arrCategory;
}
@property (nonatomic, retain) NSMutableArray* arrCategory;
@end