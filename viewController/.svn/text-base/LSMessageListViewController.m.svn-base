//
//  LSMessageListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMessageListViewController.h"
#import "LSMessageListPE.h"
#import "LSMessageListTableViewCellCell.h"
#import "LSMessageDetailViewController.h"
@implementation LSMessageListViewController
@synthesize companyID = _companyID;
@synthesize messageState = _messageState;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = LSString_messagelist;
    }
    return self;
}

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSMessageListPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    if ([aEngine isKindOfClass:[LSMessageListPE class]]) 
    {
        LSMessageListPE* ptl = (LSMessageListPE*)aEngine;
        ptl.companyID = _companyID;
        ptl.messageState = _messageState;
    }
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* reuseID = @"MessageViewCell";
    LSMessageListTableViewCellCell* cell = (LSMessageListTableViewCellCell*)[_tableView dequeueReusableCellWithIdentifier:reuseID];
    if (nil == cell)
    {
        cell = [[[LSMessageListTableViewCellCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    LSDataMessage* message = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    [cell updateWithData:message];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDataMessage* message = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    return [LSMessageListTableViewCellCell minumumHeight:message];
}


@end
