//
//  LSCategoryProductListPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCategoryProductListPE.h"

@implementation LSCategoryProductListPE
@synthesize categoryID = _categoryID;

- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingFormat:@"/product?act=getlist&type=cate&id=%d",_categoryID];
    strURL = [self requestURLByAppendPageParams:strURL];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}
@end
