//
//  LSCommonErrorParser.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCommonErrorParser.h"
#import "SBJson.h"

static LSCommonErrorParser* sSharedInstance = nil;

@implementation LSCommonErrorParser

+ (LSCommonErrorParser*)sharedInstance
{
    if (!sSharedInstance) 
    {
		@synchronized(self) 
        {
			if (!sSharedInstance) 
            {
                sSharedInstance = [[self alloc] init];
			}
		}
	}
	return sSharedInstance;
}

- (NSError*)parserError:(NSString*)aRspString
{
    id jsonValue = [aRspString JSONValue];
    if (nil == jsonValue)
    {
        return LSError_ServerData;
    }
    
    if ([jsonValue isKindOfClass:[NSDictionary class]])
    {
        NSDictionary* dict = (NSDictionary*)jsonValue;
        if (3 == [dict count])
        {
            NSString* result = [dict valueForKey:@"success"];
            if ([result isEqualToString:@"false"])
            {
                NSInteger errorCode = [[dict valueForKey:@"code"] intValue];
                NSString* message = [dict valueForKey:@"message"];
                NSDictionary* userInfo = [NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey];
                return [NSError errorWithDomain:LSErrorDomain code:errorCode userInfo:userInfo];
            }
        }
    }
    return nil;
}
@end
