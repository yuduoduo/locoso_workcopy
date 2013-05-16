//
//  LSMyCompanyPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyCompanyPE.h"
#import "commonManager.h"
#import "SBJson.h"
#import "LSData.h"
#import "LSParseDataUtils.h"
@implementation LSMyCompanyPE

@synthesize rspData = _rspData;
@synthesize companyID = _companyID;
- (void)dealloc
{
    self.rspData = nil;
    
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    
    
    
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/manage.action?module=company&act=getmodel"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber  numberWithUnsignedInt: _companyID], @"producid", nil];
    
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
    
    NSDictionary* jsonDic = (NSDictionary*)jsonValue;
    if ([jsonDic isKindOfClass:[NSDictionary class]])
    {
//        LSDataCompanyDetail* category = [LSParseDataUtils parseCompanyDetail:jsonDic];
        
        LSMyCompanyRspData* rspData = [[[LSMyCompanyRspData alloc] init] autorelease];
        rspData.arrCategory = jsonDic;
        return rspData;
    }
    

    return nil;
    
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSMyCompanyRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSMyCompanyRspData
@implementation LSMyCompanyRspData
@synthesize arrCategory = _arrCategory;
- (void)dealloc
{
    self.arrCategory = nil;
    [super dealloc];
}

@end