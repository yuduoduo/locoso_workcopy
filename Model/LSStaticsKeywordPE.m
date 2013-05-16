//
//  LSStaticsKeywordPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSStaticsKeywordPE.h"
#import "commonManager.h"
@implementation LSStaticsKeywordPE

@synthesize companyID = _companyID;
@synthesize startDay = _startDay;
@synthesize endDay = _endDay;

- (void)dealloc
{
    self.startDay = nil;
    self.endDay = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSString *strURL = [commonManager getHostStr];
    
    strURL = [strURL stringByAppendingFormat:@"/v1/flow.action?id=%@&module=reportkeyword&begin=%@&end=%@",_companyID,_startDay,_endDay];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}
@end
