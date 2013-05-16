//
//  LSEditProductPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSEditProductPE.h"
#import "commonManager.h"
#import "LSParseDataUtils.h"
@implementation LSEditProductPE
@synthesize productid = _productid;
@synthesize dic = _dic;
@synthesize rspData = _rspData;

- (void)dealloc
{
    self.rspData = nil;
    self.dic = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    
    
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/manage?module=product&act=edit"];
    

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
        //        LSDataNews* category = [LSParseDataUtils parseNews:jsonDic];
        
        
        
        LSProductRspData* rspData = [[[LSProductRspData alloc] init] autorelease];
        rspData.newsDic = jsonDic;
        return rspData;
    }
    return nil;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSProductRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end

#pragma mark - LSProductRspData
@implementation LSProductRspData
@synthesize newsDic = _newsDic;
- (void)dealloc
{
    self.newsDic = nil;
    [super dealloc];
}

@end