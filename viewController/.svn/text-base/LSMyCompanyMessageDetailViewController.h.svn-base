//
//  LSMyCompanyMessageDetailViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseViewController.h"
#import "LSVerifyMessagePE.h"
#import "LSDeleteMessagePE.h"
#import "LSReplyMessagePE.h"
@interface LSMyCompanyMessageDetailViewController : LSBaseViewController
<LSBaseProtocolEngineDelegate,UITextViewDelegate>
{
    UIScrollView* _scrollView;
    LSDataMessage* _message;
    UIButton* _btnVerify;
    UILabel* _lbRemainNumber;
    UITextView* _replyView;
    
    UITapGestureRecognizer* _tapGesture;
    
    LSVerifyMessagePE* _verifyPE;
    LSDeleteMessagePE* _deletePE;
    LSReplyMessagePE* _replayMessage;
}
@property (nonatomic, retain) LSDataMessage* message;
@end
