//
//  LSDeleteNewsPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSDeleteNewsPE.h"
#import "commonManager.h"
@implementation LSDeleteNewsPE
@synthesize articleid = _articleid;
- (LSHTTPRequest*)request
{
    NSString* strURL = [commonManager getHostStr];
    strURL = [strURL stringByAppendingFormat:@"/manage?module=news&act=delete&articleid=",_articleid];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt: _articleid], @"articleid", nil];
    strURL = [commonManager ManageAddDelete:strURL json:dic];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}
@end
