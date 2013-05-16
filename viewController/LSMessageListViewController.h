//
//  LSMessageListViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSListViewController.h"
#import "LSMessageListPE.h"

@interface LSMessageListViewController : LSListViewController
{
    long _companyID;
    NSInteger _messageState;
}
@property (nonatomic) long companyID;
@property (nonatomic) NSInteger messageState;
@end
