//
//  LSFileUtils.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RJFileUtils.h"

@interface RJFileUtils (LSDependent)
+ (NSString*)systemConfigFilePath;
+ (NSString*)userDocumentPath:(NSString*)aUserName;
+ (NSString*)userConfigFilePath:(NSString*)aUserName;
+ (NSString*)searchHistoryFilePath;
@end
