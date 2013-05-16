//
//  LSPhotoDeletePE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSPhotoDeletePE.h"

@implementation LSPhotoDeletePE
@synthesize dic;

- (void)dealloc
{
    self.dic = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSString* strURL = [commonManager getHostStr];
    strURL = [strURL stringByAppendingFormat:@"/manage?module=photo&act=delete&mediaid=%d",_mediaid];
    strURL = [commonManager ManageAddDelete:strURL json:dic];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
//    request.requestMethod = @"POST";
    request.cachePolicy = ASIDoNotReadFromCacheCachePolicy;
    return [request autorelease];
}
@end
