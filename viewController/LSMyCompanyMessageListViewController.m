//
//  LSMyCompanyMessageListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyCompanyMessageListViewController.h"
#import "LSMyCompanyMessageDetailViewController.h"

@implementation LSMyCompanyMessageListViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didNotification:) name:LSNOTIFICATION_MESSAGE_DELETE_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didNotification:) name:LSNOTIFICATION_MESSAGE_REPLY_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didNotification:) name:LSNOTIFICATION_SENDMESSAGE_SUCCESS object:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    if ([aEngine isKindOfClass:[LSMessageListPE class]]) 
    {
        LSMessageListPE* ptl = (LSMessageListPE*)aEngine;
        ptl.companyID = _companyID;
        ptl.messageState = 0;
    }
}

#pragma mark UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSMyCompanyMessageDetailViewController* vc = [[LSMyCompanyMessageDetailViewController alloc] initWithNibName:@"LSMyCompanyMessageDetailViewController" bundle:nil];
    LSDataMessage* message = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    vc.message = message;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

#pragma mark LSBaseProtocolEngineDelegate
//- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
//{
//    [self stopWaiting];
//    if (_listPE == aEngine)
//    {
//        if (LSProtocolEngineOp_More == aEngine.op)
//        {
//            [self loadComponentViews];
//        }
//        else 
//        {
//            [self reloadComponentViews];
//        }
//        [_tableView makeMoreButtonHidden:[self checkNeedShowMoreButton:aData]];
//    }
//}
//
//- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
//{
//    [self stopWaiting];
//    if (_listPE == aEngine)
//    {
//        if ([aError.domain isEqualToString:LSErrorDomain]) 
//        {
//            if (LSProtocolEngineOp_More == aEngine.op)
//            {
//                [self loadComponentViews];
//            }
//            else 
//            {
//                [self reloadComponentViews];
//            }
//        }
//        else 
//        {
//            [self defaultDidProtocolEngineFailed:aError];
//        }
//    }
//}

#pragma mark private methods
- (void)didNotification:(NSNotification*)aNotification
{
    if ([aNotification.name isEqualToString:LSNOTIFICATION_MESSAGE_DELETE_SUCCESS]
        || [aNotification.name isEqualToString:LSNOTIFICATION_MESSAGE_REPLY_SUCCESS]
        || [aNotification.name isEqualToString:LSNOTIFICATION_SENDMESSAGE_SUCCESS] )
    {
        self.needRefreshEvenIfHaveData = YES;
        [_listPE reset];
        _listPE.forceRefresh = YES;
        [self.navigationController popToViewController:self animated:YES];
    }
}
@end
