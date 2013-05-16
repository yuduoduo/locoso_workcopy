//
//  LSHotSearchPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSHotSearchPE.h"

@implementation LSHotSearchPE
- (ASIHTTPRequest*)request
{
    NSString* strURL = [commonManager getHostStr];
    strURL = [strURL stringByAppendingString:@"/flow.action?module=hotsearchword"];
    strURL = [self requestURLByAppendPageParams:strURL];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* url = [NSURL URLWithString:strURL];
    LSHTTPRequest* request = [[[LSHTTPRequest alloc] initWithURL:url] autorelease];
    return request;
}

- (id)parseContent:(id)aContent
{
    NSString* name = [(NSDictionary*)aContent valueForKey:LSJSONKEY_name];
    return name;
}
@end
