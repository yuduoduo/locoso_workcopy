//
//  LSStarCompanyListPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSStarCompanyListPE.h"

@implementation LSStarCompanyListPE
- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/company.action?act=getlist&type=random"];
    strURL = [self requestURLByAppendPageParams:strURL];
    
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    request.cachePolicy = ASIFallbackToCacheIfLoadFailsCachePolicy | ASIAskServerIfModifiedCachePolicy;
    return [request autorelease];
}
@end
