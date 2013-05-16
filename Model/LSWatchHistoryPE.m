//
//  LSWatchHistoryPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSWatchHistoryPE.h"
#import "FileStoreManager.h"

@implementation LSWatchHistoryPE
- (void)sendRequest
{
    _state = LSProtocolEngineState_Loading;
    [NSThread detachNewThreadSelector:@selector(getWatchHistory) toTarget:self withObject:nil];
}

- (void)getWatchHistory
{
    @synchronized (self)
    {
        self.rspData = [[[LSListRspData alloc] init] autorelease];
        
        NSString* controllerClassName = @"LSCompanyDetailViewControllerhistory.rtf";
        NSArray* tempdata = [FileStoreManager ReadDataFromFile:controllerClassName];
        NSInteger tempCount = [tempdata count];
        if (tempCount == 0)
        {
            //noop
        }
        else
        {
            if (tempCount > 20)
            {
                NSRange range = NSMakeRange(tempCount - 20, 20);
                tempdata = [tempdata subarrayWithRange:range];
            }
        }
        
        NSMutableArray* arrCompany = [[[NSMutableArray alloc] initWithCapacity:20] autorelease];
        for (id content in tempdata)
        {
            LSDataCompany* company = [LSParseDataUtils parseCompany:content];
            if (company)
            {
                [arrCompany addObject:company];
            }
        }
        NSArray* reverseArray = [[arrCompany reverseObjectEnumerator] allObjects];
        self.rspData.arrContent = [NSMutableArray arrayWithArray:reverseArray];
        [self performSelectorOnMainThread:@selector(getWatchHistoryFinished) withObject:nil waitUntilDone:NO];
    }
}
         
- (void)getWatchHistoryFinished
{
    _state = LSProtocolEngineState_Finished;
    _op = LSProtocolEngineOp_Pending;
    [_delegate didProtocolEngineFinished:self newData:self.rspData];
}
@end
