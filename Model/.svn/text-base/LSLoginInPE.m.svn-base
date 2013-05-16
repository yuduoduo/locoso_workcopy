//
//  LSLoginInPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSLoginInPE.h"
#import "commonManager.h"
#import "LSParseDataUtils.h"

@implementation LSLoginInPE
@synthesize password = _password;
@synthesize loginName = _loginName;

- (void)dealloc
{
    self.password = nil;
    self.loginName = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/member.action?act=login&subgson="];
    
    NSString *subgson = [NSString stringWithFormat: @"{\"account\":{\"password\":\"%@\",\"loginname\":\"%@\"},\"model\":\"\",\"verify\":{\"time\":\"2012-01-10\",\"permit\":\"verify\"}}",_password, _loginName];
    strURL = [strURL stringByAppendingString:subgson];
    
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
    
    NSDictionary* jsonDic = (NSDictionary*)jsonValue;
    if ([jsonDic isKindOfClass:[NSDictionary class]])
    {
        
        LSLoginRspData* rspData = [[[LSLoginRspData alloc] init] autorelease];
        rspData.session = [LSParseDataUtils parseSession:jsonDic];
        return rspData;
    }
    return nil;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSLoginRspData
@implementation LSLoginRspData
@synthesize session = _session;
- (void)dealloc
{
    self.session = nil;
    [super dealloc];
}

@end
