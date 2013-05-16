//
//  LSCategoryListPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCategoryListPE.h"

@implementation LSCategoryListPE
@synthesize categoryID = _categoryID;

- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingString:@"/cate.action?act=getlist&type=id"];
    if (_categoryID > 0)
    {
        strURL = [strURL stringByAppendingFormat:@"&id=%d", _categoryID];
    }
    strURL = [self requestURLByAppendPageParams:strURL];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}

- (id)parseContent:(id)aContent
{
    return [LSParseDataUtils parseCategory:aContent];
}
@end

