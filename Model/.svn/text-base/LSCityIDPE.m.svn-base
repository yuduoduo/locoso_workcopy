//
//  LSCityIDPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCityIDPE.h"
#import "commonManager.h"
#import "SBJson.h"
#import "LSData.h"
#import "LSParseDataUtils.h"

@implementation  LSCityIDPE 
@synthesize cityName = _cityName;
@synthesize rspData = _rspData;

- (void)dealloc
{
    self.cityName = nil;
    self.rspData = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSAssert([_cityName length] > 0, @"");
    
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/city.action?act=getcityid&name="];
    strURL = [strURL stringByAppendingString:_cityName];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* url = [NSURL URLWithString:strURL];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:url];
    request.cachePolicy = ASIDoNotReadFromCacheCachePolicy;
    return [request autorelease];
}

- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    id jsonValue = [aResponseString JSONValue];
    if (nil == jsonValue)
    {
        return nil;
    }
    
    NSDictionary* dict = (NSDictionary*)jsonValue;
    LSDataCity* city = [LSParseDataUtils parseCity:dict];
    if (city && city.ID > 0)
    {
        LSCityIDRspData* rspData = [[[LSCityIDRspData alloc] init] autorelease];
        rspData.city = city;
        return rspData;
    }
    return nil;
}

- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSCityIDRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end

@implementation LSCityIDRspData
@synthesize city = _city;
- (void)dealloc
{
    self.city = nil;
    [super dealloc];
}
@end
