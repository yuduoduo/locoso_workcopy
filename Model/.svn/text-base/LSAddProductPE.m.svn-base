//
//  LSAddProductPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSAddProductPE.h"
#import "commonManager.h"
#import "SBJson.h"

@implementation LSAddProductPE

@synthesize rspData = _rspData;
@synthesize dic = _dic;

- (void)dealloc
{
    self.rspData = nil;
    self.dic = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    
    
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/manage?module=product&act=add"];
    strURL = [commonManager ManageAddDelete:strURL json:_dic];
    
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    request.requestMethod = @"POST";
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
        
        LSAddProductRspData* rspData = [[[LSAddProductRspData alloc] init] autorelease];
        rspData.rspDic = jsonDic;
        return rspData;
    }
    return nil;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSAddProductRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSAddProductRspData
@implementation LSAddProductRspData
@synthesize rspDic = _rspDic;
- (void)dealloc
{
    self.rspDic = nil;
    [super dealloc];
}

@end