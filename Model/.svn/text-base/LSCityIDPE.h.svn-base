//
//  LSCityIDPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseProtocolEngine.h"

@class LSCityIDRspData,LSDataCity;

@interface  LSCityIDPE: LSBaseProtocolEngine
{
    NSString* _cityName;
    LSCityIDRspData* _rspData;
}
@property (nonatomic, retain) NSString* cityName;
@property (nonatomic, retain) LSCityIDRspData* rspData;;
@end

@interface LSCityIDRspData : LSBaseResponseData
{
    LSDataCity* _city;
}
@property (nonatomic, retain) LSDataCity* city;
@end