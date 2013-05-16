//
//  LSSaveEnterpriseInfoPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSaveEnterpriseInfoPE.h"
#import "commonManager.h"
@implementation LSSaveEnterpriseInfoPE
@synthesize dic = _dic;

- (void)dealloc
{
    self.dic = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/manage?module=company&act=save"];
    strURL = [commonManager ManageAddDelete:strURL json:_dic];

    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    
    return [request autorelease];
}
@end
