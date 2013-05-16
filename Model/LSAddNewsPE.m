//
//  LSAddNewsPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSAddNewsPE.h"
#import "commonManager.h"
#import "NSObject+SBJson.h"
@implementation LSAddNewsPE
@synthesize title = _title;
@synthesize content = _content;
@synthesize rspData = _rspData;

- (void)dealloc
{
    self.content = nil;
    self.title = nil;
    self.rspData  = nil;
    [super dealloc];
}

- (LSHTTPRequest*)request
{
    NSString *strURL = [commonManager getHostStr];strURL = [strURL stringByAppendingString:@"/manage?module=news&act=add&cateid=0"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_title, @"title", 
                         _content, @"content",
                         @"test", @"uaname",
                         @"test", @"author",
                         [NSNumber numberWithFloat:0], @"displayorder",
                         @"test", @"tag",
                         @"test", @"summary",
                         [NSNumber numberWithFloat:0], @"cateid",
                         [NSNumber numberWithFloat:1], @"state",
                         [NSNumber numberWithFloat:0], @"view",
                         [NSNumber numberWithFloat:0], @"siteid",
                         [NSNumber numberWithFloat:0], @"topart",
                         nil];
    
    strURL = [commonManager ManageAddDelete:strURL json:dic];
    
    
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    LSHTTPRequest* request = [[LSHTTPRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    request.requestMethod = @"POST";
    return [request autorelease];
}

- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    id jsonValue = [aResponseString JSONValue];
    if (nil == jsonValue)
    {
        return nil;
    }
    
    NSDictionary* jsonDic = (NSDictionary*)jsonValue;
    if ([jsonDic isKindOfClass:[NSDictionary class]])
    {
        
        LSAddNewsRspData* rspData = [[[LSAddNewsRspData alloc] init] autorelease];
        rspData.rspDic = jsonDic;
        return rspData;
    }
    return nil;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSAddNewsRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
@end
#pragma mark - LSAddNewsRspData
@implementation LSAddNewsRspData
@synthesize rspDic = _rspDic;
- (void)dealloc
{
    self.rspDic = nil;
    [super dealloc];
}

@end