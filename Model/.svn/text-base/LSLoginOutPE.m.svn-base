//
//  LSLoginOutPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSLoginOutPE.h"
#import "commonManager.h"

@implementation LSLoginOutPE
- (LSHTTPRequest*)request
{
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/member.action?act=logout"];
    
    strURL = [commonManager ManageAddDelete:strURL json:nil];
        

    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];

    return [request autorelease];
}

@end
