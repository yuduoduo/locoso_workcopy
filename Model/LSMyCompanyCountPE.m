//
//  LSMyCompanyCountPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyCompanyCountPE.h"

@implementation LSMyCompanyCountPE

@synthesize rspData = _rspData;

- (void)dealloc
{
    self.rspData = nil;
    
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    
    
    
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/manage?module=company&act=getcount"];
    
    NSString* subgson = @"&subgson=";
    NSString* md5Head = [commonManager getFormMD5];
    strURL = [strURL stringByAppendingString:subgson];
    strURL = [strURL stringByAppendingString:md5Head];

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
    
    NSMutableDictionary* jsonArray = (NSMutableDictionary*)jsonValue;
    
    //    for (id content in jsonArray)
    //    {
    //        if ([content isKindOfClass:[NSDictionary class]])
    //        {
    LSDataCount* category = [LSParseDataUtils parseCount:jsonArray];
    
    //        }
    //    }
    
    LSMyCountRspData* rspData = [[[LSMyCountRspData alloc] init] autorelease];
    rspData.arrCategory = category;
    
    
    return rspData;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSMyCountRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSMyCountRspData
@implementation LSMyCountRspData
@synthesize arrCategory = _arrCategory;
- (void)dealloc
{
    self.arrCategory = nil;
    [super dealloc];
}

@end