//
//  LSCompanyNewsListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyNewsListViewController.h"
#import "LSCompanyNewsListPE.h"

@implementation LSCompanyNewsListViewController
@synthesize companyID = _companyID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = LSString_title_newslist;
    }
    return self;
}

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSCompanyNewsListPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    if ([aEngine isKindOfClass:[LSCompanyNewsListPE class]]) 
    {
        LSCompanyNewsListPE* ptl = (LSCompanyNewsListPE*)aEngine;
        ptl.companyID = _companyID;
    }
}


@end
