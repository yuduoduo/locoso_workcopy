//
//  LSSearchPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSearchPE.h"

@implementation LSSearchPE
@synthesize keyword = _keyword;
@synthesize cityID = _cityID;
@synthesize cateID = _cateID;

- (void)dealloc
{
    self.keyword = nil;
    [super dealloc];
}

- (void)reset
{
    _cityID = 0;
    _cateID = 0;
    [super reset];
}

- (ASIHTTPRequest*)request
{
    NSString* strURL = [commonManager getHostStr];
    strURL = [strURL stringByAppendingFormat:@"/search.action?keyword=%@", _keyword];
    if (_cityID > 0)
    {
        strURL = [strURL stringByAppendingFormat:@"&cityid=%d",_cityID];
    }
    if (_cateID > 0)
    {
        strURL = [strURL stringByAppendingFormat:@"&cateid=%d",_cateID];
    }
    strURL = [self requestURLByAppendPageParams:strURL];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* url = [NSURL URLWithString:strURL];
    LSHTTPRequest* request = [[[LSHTTPRequest alloc] initWithURL:url] autorelease];
    return request;
    
}

- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    id jsonValue = [aResponseString JSONValue];
    if (nil == jsonValue)
    {
        return nil;
    }
    
    NSDictionary* jsonDict = (NSDictionary*)jsonValue;
    NSArray* jsonArray = [jsonDict valueForKey:LSJSONKEY_listCompany];
    NSMutableArray* arrContent = [[NSMutableArray alloc] initWithCapacity:10];
    for (id content in jsonArray)
    {
        if ([content isKindOfClass:[NSDictionary class]])
        {
            id contentData = [self parseContent:content];
            if (contentData)
            {
                [arrContent addObject:contentData];
            }
        }
    }
    
    LSListRspData* rspData = [[[LSListRspData alloc] init] autorelease];
    rspData.arrContent = arrContent;
    [arrContent release];
    
    return rspData;
}

- (id)parseContent:(id)aContent
{
    return [LSParseDataUtils parseCompany:aContent];
}
@end
