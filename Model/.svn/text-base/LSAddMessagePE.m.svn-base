//
//  LSAddMessagePE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSAddMessagePE.h"
#import "commonManager.h"
#import "SBJson.h"
#import "LSParseDataUtils.h"

@implementation LSAddMessagePE
@synthesize content = _content;
@synthesize senderName = _senderName;
@synthesize companyID = _companyID;

- (void)dealloc
{
    self.content = nil;
    self.senderName = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSAssert([_content length] > 0 && [_senderName length] > 0 && _companyID > 0,@"");

    SBJsonWriter* writer = [[[SBJsonWriter alloc] init] autorelease];
    NSMutableDictionary* dict = [[[NSMutableDictionary alloc] initWithCapacity:5] autorelease];
    
    [dict setValue:_content forKey:LSJSONKEY_content];
    [dict setValue:[NSString stringWithFormat:@"%d",5] forKey:LSJSONKEY_score];
    [dict setValue:_senderName forKey:LSJSONKEY_senderuaname];
    [dict setValue:[NSString stringWithFormat:@"%d", _companyID] forKey:LSJSONKEY_companyid];
    
    NSError* error = nil;
    NSString* jsonstr = [writer stringWithObject:dict error:&error];
    if (error)
    {
        NSLog(@"contruct JSON failed.%@",error);
    }
    
    NSString* strURL = [[commonManager getHostStr] stringByAppendingFormat:@"/message.action?act=add&subgson=%@", jsonstr];
    
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* url = [NSURL URLWithString:strURL];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:url];
    return [request autorelease];
}

//- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
//{
//    //noop
//    return nil;
//}
@end
