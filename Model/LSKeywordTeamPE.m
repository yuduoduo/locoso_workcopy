//
//  LSKeywordTeamPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSKeywordTeamPE.h"

@implementation LSKeywordTeamPE
@synthesize keyword = _keyword;

- (void)dealloc
{
    self.keyword = nil;
    [super dealloc];
}

- (ASIHTTPRequest*)request
{
    if ([_keyword length] == 0)
    {
        return nil;
    }
    
    NSString* strURL = [commonManager getHostStr];
    strURL = [strURL stringByAppendingFormat:@"/search.action?act=term&keyword=%@",_keyword];
    strURL = [self requestURLByAppendPageParams:strURL];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* url = [NSURL URLWithString:strURL];
    LSHTTPRequest* request = [[[LSHTTPRequest alloc] initWithURL:url] autorelease];
    return request;
}

- (id)parseContent:(id)aContent
{
    return [LSParseDataUtils parseKeyword:aContent];
}
@end
