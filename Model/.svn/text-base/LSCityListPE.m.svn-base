//
//  LSCityListPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCityListPE.h"

@implementation LSCityListPE
@synthesize cityID = _cityID;

-(ASIHTTPRequest*)request
{
    NSString* strURL = [commonManager getHostStr];
    strURL = [strURL stringByAppendingString:@"/city.action?act=getlist"];
    if (_cityID > 0)
    {
        strURL = [strURL stringByAppendingFormat:@"&id=%d", _cityID];
    }
    strURL = [self requestURLByAppendPageParams:strURL];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}

- (id)parseContent:(id)aContent
{
    return [LSParseDataUtils parseCity:aContent];
}
@end
