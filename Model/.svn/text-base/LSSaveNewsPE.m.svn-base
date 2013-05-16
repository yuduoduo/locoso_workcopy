//
//  LSSaveNewsPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSaveNewsPE.h"
#import "commonManager.h"
#import "NSObject+SBJson.h"
@implementation LSSaveNewsPE

@synthesize dic = _dic;

- (void)dealloc
{
    self.dic = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    
    
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/manage?module=news&act=save"];
    
    
    
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
        
        
        
//        LSNewsRspData* rspData = [[[LSNewsRspData alloc] init] autorelease];
//        rspData.newsDic = jsonDic;
        return jsonDic;
    }
    return nil;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{

    
    return [super handleResponseData:aNewData];
}
@end

