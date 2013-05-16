//
//  LSMessageListPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMessageListPE.h"

//#define LSLOCALTEST_MESSAGELIST

@implementation LSMessageListPE
@synthesize companyID = _companyID;
@synthesize messageState = _messageState;

- (id)parseContent:(id)aContent
{
    return [LSParseDataUtils parseMessage:aContent];
}

- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingFormat:@"/message?act=getlist&type=company&id=%d&state=%d",_companyID,_messageState];  
    
    strURL = [self requestURLByAppendPageParams:strURL];
    strURL = [strURL stringByAppendingString:@"&subgson="];
    strURL = [commonManager ManageAddDelete:strURL json:nil];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    

    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}

#ifdef LSLOCALTEST_MESSAGELIST
- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    
    LSListRspData* rspData = [[[LSListRspData alloc] init] autorelease];

    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:10];
    
    LSDataMessage* message = [[LSDataMessage alloc] init];
    message.messageID = 1;
    message.senderuaid = 2;
    message.senderuaname = @"发送者发送者发送者发送者发送者";
    message.content = @"this is a message.this is a message.this is a message.this is a message.this is a message.this is a message.";
    message.replyContent = @"this is a reply.";
    message.createtime = @"20120321";
    [array addObject:message];
    
    LSDataMessage* message2 = [[LSDataMessage alloc] init];
    message2.messageID = 1;
    message2.senderuaid = 2;
    message2.senderuaname = @"发送者发送者发送者发送者发送者";
    message2.content = @"this is a message.";
    message2.replyContent = @"this is a reply.this is a reply.this is a reply.this is a reply.this is a reply.this is a reply.";
    message2.createtime = @"2012-03-21 18:00";
    [array addObject:message2];
    { 
    LSDataMessage* message2 = [[LSDataMessage alloc] init];
    message2.messageID = 1;
    message2.senderuaid = 2;
    message2.senderuaname = @"发送者发送者发送者发送者发送者";
    message2.content = @"this is a message.";
    message2.replyContent = @"";
    message2.createtime = @"2012-03-21 18:00";
    [array addObject:message2];
    }
    rspData.arrContent = array;
    
    return rspData;
}
#endif
@end
