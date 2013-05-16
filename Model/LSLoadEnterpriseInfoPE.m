//
//  LSLoadEnterpriseInfoPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSLoadEnterpriseInfoPE.h"
#import "commonManager.h"
#import "LSParseDataUtils.h"
@implementation LSLoadEnterpriseInfoPE
@synthesize companyID = _companyID;
@synthesize rspData = _rspData;

- (void)dealloc
{
    self.rspData = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/manage?module=company&act=getmodel"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_companyID], @"companyid", 
                         
                         nil];
    
    strURL = [commonManager ManageAddDelete:strURL json:dic];   
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    request.cachePolicy = ASIDoNotWriteToCacheCachePolicy | ASIDoNotReadFromCacheCachePolicy;
    return [request autorelease];
}


- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    id jsonValue = [aResponseString JSONValue];
    if (nil == jsonValue)
    {
        return nil;
    }
    
    NSDictionary* jsonArray = (NSDictionary*)jsonValue;

//    LSDataEnterprise* category = [LSParseDataUtils parseEnterprise:jsonArray];
//
//    
//    LSEnterpriseInfoRspData* rspData = [[[LSEnterpriseInfoRspData alloc] init] autorelease];
//    rspData.arrCategory = category;
//
//    
//    return rspData;
    if ([jsonArray isKindOfClass:[NSDictionary class]]) {
        LSEnterpriseInfoRspData* rspData = [[[LSEnterpriseInfoRspData alloc] init] autorelease];
            rspData.arrCategory = jsonArray;
        return rspData;
    }
    return nil;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSEnterpriseInfoRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSEnterpriseInfoRspData
@implementation LSEnterpriseInfoRspData
@synthesize arrCategory = _arrCategory;
- (void)dealloc
{
    self.arrCategory = nil;
    [super dealloc];
}

@end
