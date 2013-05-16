//
//  LSCategoryCompanyListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCategoryCompanyListViewController.h"
#import "LSCategoryCompanyListPE.h"

@implementation LSCategoryCompanyListViewController
@synthesize categoryID = _categoryID;

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSCategoryCompanyListPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    if ([aEngine isKindOfClass:[LSCategoryCompanyListPE class]]) 
    {
        LSCategoryCompanyListPE* ptl = (LSCategoryCompanyListPE*)aEngine;
        ptl.categoryID = _categoryID;
    }
}


@end
