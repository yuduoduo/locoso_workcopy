//
//  LSReplyMessagePE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSReplyMessagePE.h"
#import "commonManager.h"

@implementation LSReplyMessagePE
@synthesize replyContent = _replyContent;

- (void)dealloc
{
    self.replyContent = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/manage?module=message&act=save&messageid="];
    
    
    strURL = [strURL stringByAppendingString:[NSString stringWithFormat:@"%d",_messageID]];
    
    
    NSDictionary *dic =  [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_messageID],@"messageid",
                          _replyContent,@"replycontent",
                          nil];
    strURL = [commonManager ManageAddDelete:strURL json:dic];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}
@end
