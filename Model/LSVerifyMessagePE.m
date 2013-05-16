//
//  LSVerifyMessagePE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSVerifyMessagePE.h"
#import "commonManager.h"
@implementation LSVerifyMessagePE
- (LSHTTPRequest*)request
{
    
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/manage?module=message&act=save&messageid="];
    
    
    strURL = [strURL stringByAppendingString:[NSString stringWithFormat:@"%d",_messageID]];
    
    
    NSDictionary *dic =  [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_messageID],@"messageid",
                          [NSNumber numberWithInt:2],@"state",
                          nil];
    strURL = [commonManager ManageAddDelete:strURL json:dic];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}
@end
