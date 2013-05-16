//
//  LSCompanyNewsListPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyNewsListPE.h"

@implementation LSCompanyNewsListPE
@synthesize companyID = _companyID;

- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingFormat:@"/news?act=getlist&type=company&id=%d",_companyID];
    strURL = [self requestURLByAppendPageParams:strURL];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}


- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    id jsonValue = [aResponseString JSONValue];
    if (nil == jsonValue)
    {
        return nil;
    }
    
    NSMutableDictionary* jsonArray = (NSMutableDictionary*)jsonValue;
    NSMutableArray* arrCategory = [[NSMutableArray alloc] initWithCapacity:10];
    for (id content in jsonArray)
    {
        if ([content isKindOfClass:[NSDictionary class]])
        {
            LSDataNews* category = [LSParseDataUtils parseNews:content];
            [arrCategory addObject:category];
        }
    }    
    
    LSMyNewsRspData* rspData = [[[LSMyNewsRspData alloc] init] autorelease];
    rspData.arrContent = arrCategory;
    
    
    return rspData;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSMyNewsRspData
@implementation LSMyNewsRspData
@synthesize arrContent = _arrContent;
- (void)dealloc
{
    self.arrContent = nil;
    [super dealloc];
}

@end
