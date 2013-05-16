//
//  LSCompanyInfoPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyInfoPE.h"
#import "commonManager.h"
#import "SBJson.h"
#import "LSData.h"
#import "LSParseDataUtils.h"
@interface LSCompanyInfoPE ()

@end

@implementation LSCompanyInfoPE

@synthesize rspData = _rspData;
@synthesize dataid = _dataid;
- (void)dealloc
{
    self.rspData = nil;
    
    [super dealloc];
}

- (LSHTTPRequest*)request
{

    
    
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/company?act=getmodel&type=company&id="];
    strURL = [strURL stringByAppendingFormat:@"%d",_dataid];
    
    
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
    

    LSDataCompanyDetail* category = [LSParseDataUtils parseCompanyDetail:jsonArray];

    LSComapnyInfoRspData* rspData = [[[LSComapnyInfoRspData alloc] init] autorelease];
    rspData.arrCategory = category;
    
    
    return rspData;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSComapnyInfoRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSComapnyInfoRspData
@implementation LSComapnyInfoRspData
@synthesize arrCategory = _arrCategory;
- (void)dealloc
{
    self.arrCategory = nil;
    [super dealloc];
}

@end