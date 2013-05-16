//
//  LSCompanyProductListPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyProductListPE.h"

@implementation LSCompanyProductListPE
@synthesize companyID = _companyID;

- (LSHTTPRequest*)request
{
    NSString* strURL = [[commonManager getHostStr] stringByAppendingFormat:@"/product?act=getlist&type=company&id=%d",_companyID];    
    strURL = [self requestURLByAppendPageParams:strURL];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    
    return [request autorelease];
}
@end
