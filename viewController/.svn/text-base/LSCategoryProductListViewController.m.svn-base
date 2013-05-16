//
//  LSCategoryProductListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCategoryProductListViewController.h"
#import "LSCategoryProductListPE.h"

@implementation LSCategoryProductListViewController
@synthesize categoryID = _categoryID;

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSCategoryProductListPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    if ([aEngine isKindOfClass:[LSCategoryProductListPE class]]) 
    {
        LSCategoryProductListPE* ptl = (LSCategoryProductListPE*)aEngine;
        ptl.categoryID = _categoryID;
    }
}
@end
