//
//  LSWatchHistoryViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSWatchHistoryViewController.h"
#import "LSWatchHistoryPE.h"
#import "RJFileUtils.h"

@implementation LSWatchHistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"浏览历史";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.morePage = NO;
    [self setNavigationBarButtonItemWithTitleStytlePlain:@"清空" itemType:LSNavigationbarButtonItem_Right];
}

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSWatchHistoryPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
}

- (void)navigationRightButtonItemClicked:(id)aSender
{
    NSString *filename = @"LSCompanyDetailViewControllerhistory.rtf";
    [RJFileUtils removeItemAtPathWithinDocumentDir:filename];
    
    _listPE.rspData = nil;
    [self loadComponentViews];
    [_tableView reloadData];
}


@end
