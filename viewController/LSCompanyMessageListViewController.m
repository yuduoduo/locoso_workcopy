//
//  LSCompanyMessageListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyMessageListViewController.h"
//#import "SendAMessageViewController.h"
#import "LSSendMessageViewController.h"
#import "LSMessageDetailViewController.h"
#import "LSMessageListPE.h"

@implementation LSCompanyMessageListViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavigationBarButtonItemWithTitleStytlePlain:LSString_iwantmessage itemType:LSNavigationbarButtonItem_Right];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    if ([aEngine isKindOfClass:[LSMessageListPE class]]) 
    {
        LSMessageListPE* ptl = (LSMessageListPE*)aEngine;
        ptl.companyID = _companyID;
        ptl.messageState = 2;
    }
}

- (void)navigationRightButtonItemClicked:(id)aSender
{
//    SendAMessageViewController *vc = [[[SendAMessageViewController alloc] initWithNibName:@"SendAMessageViewController" bundle:nil] autorelease];
//    vc.title = LSString_message;
//    [vc setdataid:_companyID];
//    [self.navigationController pushViewController:vc animated:YES];

    LSSendMessageViewController* vc = [[LSSendMessageViewController alloc] initWithNibName:@"LSSendMessageViewController" bundle:nil];
    vc.companyID = _companyID;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDataMessage* message = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    LSMessageDetailViewController *viewcontroller = [[LSMessageDetailViewController alloc]initWithNibName:@"LSMessageDetailViewController" bundle:nil];
    viewcontroller.message = message;
    [self.navigationController pushViewController:viewcontroller animated:YES];
}
@end
