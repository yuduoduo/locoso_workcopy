//
//  LSLocationPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSLocationPE.h"
#import "commonManager.h"
#import "SBJson.h"

@implementation LSLocationPE

@synthesize dic = _dic;

- (void)dealloc
{
    self.dic = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/manage?module=company&act=save"];
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
    
    NSMutableDictionary* jsonDic = (NSMutableDictionary*)jsonValue;
    if ([jsonDic isKindOfClass:[NSDictionary class]])
    {
        return jsonDic;
    }
    return nil;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    return [super handleResponseData:aNewData];
}
@end
