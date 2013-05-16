//
//  LSGetCompanyIdPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSGetCompanyIdPE.h"

@implementation LSGetCompanyIdPE
@synthesize rspData = _rspData;

- (void)dealloc
{
    self.rspData = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/manage?module=company&act=getmodel"];
    
    NSString* md5Head = [commonManager getFormMD5];
    strURL  = [strURL stringByAppendingString:@"&subgson="];
    strURL = [strURL stringByAppendingString:md5Head];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL*  url = [NSURL URLWithString:strURL];
    
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:url];
    return [request autorelease];
}

- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    id jsonValue = [aResponseString JSONValue];
    if (nil == jsonValue)
    {
        return nil;
    }
    
    NSMutableDictionary* jsonDic = (NSMutableDictionary*)jsonValue;
    if ([jsonDic isKindOfClass:[NSDictionary class]])
    {
        NSString *companyid = [[jsonDic objectForKey:@"companyid"] stringValue];
        LSCompanyIDRspData* rspData = [[[LSCompanyIDRspData alloc] init] autorelease];
        rspData.companyID = companyid;
        return rspData;
    }
    return nil;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSCompanyIDRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSCompanyIDRspData
@implementation LSCompanyIDRspData
@synthesize companyID = _companyID;
- (void)dealloc
{
    self.companyID = nil;
    [super dealloc];
}

@end