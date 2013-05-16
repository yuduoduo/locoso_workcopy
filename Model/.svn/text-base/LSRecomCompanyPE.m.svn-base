//
//  NSObject+LSRecomCompanyPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSRecomCompanyPE.h"
#import "commonManager.h"
#import "SBJson.h"
#import "LSData.h"
#import "LSParseDataUtils.h"

@implementation  LSRecomCompanyPE 
@synthesize rspData = _rspData;
@synthesize cityID = _cityID;

- (void)dealloc
{
    self.rspData = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/company.action?act=getlist&type=random&pageindex=1&pagesize=9"];
    
    if (_cityID > 0)
    {
        strURL = [strURL stringByAppendingFormat:@"&cityid=%d",_cityID];
    }
    
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}

- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    id jsonValue = [aResponseString JSONValue];
    if (nil == jsonValue)
    {
        return nil;
    }
    
    NSArray* jsonArray = (NSArray*)jsonValue;
    NSMutableArray* arrCategory = [[NSMutableArray alloc] initWithCapacity:10];
    for (id content in jsonArray)
    {
        if ([content isKindOfClass:[NSDictionary class]])
        {
            LSDataCompany* category = [LSParseDataUtils parseCompany:content];
            [arrCategory addObject:category];
        }
    }
    
    LSRecommComapnyRspData* rspData = [[[LSRecommComapnyRspData alloc] init] autorelease];
    rspData.arrCategory = arrCategory;
    [arrCategory release];
    
    return rspData;
}

- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSRecommComapnyRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSRecommComapnyRspData
@implementation LSRecommComapnyRspData
@synthesize arrCategory = _arrCategory;
- (void)dealloc
{
    self.arrCategory = nil;
    [super dealloc];
}

@end