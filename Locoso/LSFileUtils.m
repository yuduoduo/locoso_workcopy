//
//  LSFileUtils.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSFileUtils.h"

@implementation RJFileUtils (LSDependent)
+ (NSString*)systemConfigFilePath
{
    return [RJFileUtils pathWithinDocumentDir:@"systemConfig.plist"];
}

+ (NSString*)userDocumentPath:(NSString*)aUserName
{
    if ([aUserName length] == 0)
    {
        return nil;
    }
    return [RJFileUtils pathWithinDocumentDir:aUserName];
}

+ (NSString*)userConfigFilePath:(NSString*)aUserName
{
    NSString* path = [RJFileUtils userDocumentPath:aUserName];
    return [path stringByAppendingPathComponent:@"config.plist"];
}

+ (NSString*)searchHistoryFilePath
{
    NSString* path = [RJFileUtils pathWithinDocumentDir:@"searchhistory.dat"];
    return path;
}
@end
