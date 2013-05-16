//
//  LSDeleteProductPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSDeleteProductPE.h"
#import "commonManager.h"
@implementation LSDeleteProductPE
@synthesize productid = _productid;
- (LSHTTPRequest*)request
{
    NSString* strURL = [commonManager getHostStr];
    strURL = [strURL stringByAppendingFormat:@"/manage?module=product&act=delete&productid=",_productid];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_productid], @"producid", nil];
    
    strURL = [commonManager ManageAddDelete:strURL json:dic];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    return [request autorelease];
}
@end
