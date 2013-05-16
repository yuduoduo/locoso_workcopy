//
//  LSCategoryNewsListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCategoryNewsListViewController.h"
#import "LSCategoryNewsListPE.h"

@implementation LSCategoryNewsListViewController
@synthesize categoryID = _categoryID;

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSCategoryNewsListPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    if ([aEngine isKindOfClass:[LSCategoryNewsListPE class]]) 
    {
        LSCategoryNewsListPE* ptl = (LSCategoryNewsListPE*)aEngine;
        ptl.categoryID = _categoryID;
    }
}
@end
