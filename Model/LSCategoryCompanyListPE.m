//
//  LSCategoryCompanyListPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCategoryCompanyListPE.h"
#import "commonManager.h"
#import "SBJson.h"
#import "LSData.h"
#import "LSParseDataUtils.h"

@implementation LSCategoryCompanyListPE
@synthesize categoryID = _categoryID;
@synthesize cityID = _cityID;
- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/company?act=getlist"];
    if (_categoryID > 0)
    {
        strURL = [strURL stringByAppendingFormat:@"&cateid=%d", _categoryID];
    }
    if (_cityID > 0)
    {
        strURL = [strURL stringByAppendingFormat:@"&cityid=%d", _cityID];
    }
    strURL = [self requestURLByAppendPageParams:strURL];
    
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}

@end
