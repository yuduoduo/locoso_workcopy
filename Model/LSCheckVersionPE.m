//
//  LSCheckVersionPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCheckVersionPE.h"
#import "commonManager.h"

@implementation LSCheckVersionPE
- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/client.action?client=iphone"];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}

- (id)parseResponseData:(NSString*)aResponseString
{
    //noop
    return nil;
}
@end
