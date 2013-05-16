//
//  LSMyCompanyMessageDetailViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyCompanyMessageDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

#define LSTEXTVIEWMOVEOOFFSETY 160

@interface LSMyCompanyMessageDetailViewController ()
- (void)sendReplyContent;//发表回复
- (void)addTapGesture;
- (void)handleTapGesture:(id)aSender;
- (void)loadComponentsView;
- (void)postNotification:(NSString*)aName;
@end

@implementation LSMyCompanyMessageDetailViewController
@synthesize message = _message;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = LSSting_messagedetail;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavigationBarButtonItemWithTitleStytlePlain:LSString_sendreply itemType:LSNavigationbarButtonItem_Right];
    [self loadComponentsView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_replyView resignFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_lbRemainNumber release];
    _lbRemainNumber = nil;
    [_btnVerify release];
    _btnVerify = nil;
    [_replyView resignFirstResponder];
    [_replyView release];
    _replyView = nil;
    [_scrollView release];
    _scrollView = nil;
}

- (void)dealloc
{
    self.message = nil;
    [_lbRemainNumber release];
    _lbRemainNumber = nil;
    [_btnVerify release];
    _btnVerify = nil;
    [_replyView release];
    _replyView = nil;
    [_scrollView release];
    _scrollView = nil;
    
    [_tapGesture release];
    
    [_verifyPE release];
    [_deletePE release];
    [super dealloc];
}

- (void)navigationRightButtonItemClicked:(id)aSender
{
    [self sendReplyContent];
}

#pragma mark UITextViewDelegate methods
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (_replyView == textView)
    {
        [_scrollView setContentOffset:CGPointMake(0, LSTEXTVIEWMOVEOOFFSETY) animated:YES];
        [self addTapGesture];
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView 
{
	NSString *postContent = textView.text;
    NSInteger number = LSSendMessageTextViewContentMaxLength - [postContent length];
    _lbRemainNumber.text = [NSString stringWithFormat:@"%d", number];
    _lbRemainNumber.textColor = number > 0 ? LSCOLOR_6A6A6A : [UIColor redColor];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if([text isEqualToString:@"\n"])//对应键盘的"send"
    {
        [self sendReplyContent];
        return NO;
    }
    return YES;
}

#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];

    if (aEngine == _verifyPE) 
    {
        [LSModalAlertView messageBox:nil message:LSString_operation_success];
        _btnVerify.hidden = YES;
    }
    else if (aEngine == _deletePE) 
    {
        [LSModalAlertView messageBox:nil message:LSString_delete_success];
        [self postNotification:LSNOTIFICATION_MESSAGE_DELETE_SUCCESS];
    }
    else if (aEngine == _replayMessage) 
    {
        [LSModalAlertView messageBox:nil message:LSString_sendMessaegSuccess];
        [self postNotification:LSNOTIFICATION_MESSAGE_REPLY_SUCCESS];
    }
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
    [self stopWaiting];
    NSLog(@"%s %@",__FUNCTION__, aError);
    [LSModalAlertView messageBox:nil message:LSString_sendFailed];
}

#pragma mark private methods
- (void)sendReplyContent
{
    //input check
    NSInteger contentLength =[_replyView.text length];
    if (0 == contentLength)
    {
        [LSModalAlertView messageBox:nil message:LSString_MessageNoLength];
        return;
    }
    else if (contentLength > LSSendMessageTextViewContentMaxLength)
    {
        [LSModalAlertView messageBox:nil message:LSString_MessageLengthOverflowHint];
        return;
    }
    
    //页面还原
    [_replyView resignFirstResponder];
    [_scrollView setContentOffset:CGPointZero animated:YES];
    
    [self startHUDWaiting:LSString_sending];
    
    //发送网络请求
    if (nil == _replayMessage) 
    {
        _replayMessage = [[LSReplyMessagePE alloc]init];
        _replayMessage.delegate = self;
    }
    _replayMessage.messageID = _message.messageID;
    _replayMessage.replyContent = _replyView.text;
    [_replayMessage sendRequest];
}

- (void)addTapGesture
{
    if (nil == _tapGesture) 
    {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self   
                                                              action:@selector(handleTapGesture:)];
        _tapGesture.numberOfTouchesRequired = 1; //手指数  
        _tapGesture.numberOfTapsRequired = 1; //tap次数
    }
  
    [_scrollView addGestureRecognizer:_tapGesture];  
}
- (void)handleTapGesture:(id)aSender
{
    if ([aSender isKindOfClass:[UITapGestureRecognizer class]])
    {
        [_scrollView removeGestureRecognizer:_tapGesture];
        [_replyView resignFirstResponder];
        [_scrollView setContentOffset:CGPointZero animated:YES];
    }
}

- (void)verifyButtonClicked
{
    if (nil == _verifyPE) {
        _verifyPE = [[LSVerifyMessagePE alloc]init];
        _verifyPE.delegate = self;
    }
    _verifyPE.messageID = _message.messageID;
    [_verifyPE sendRequest];
}

- (void)deleteButtonClicked
{
    if (nil == _deletePE) {
        _deletePE = [[LSDeleteMessagePE alloc]init];
        _deletePE.delegate = self;
    }
    _deletePE.messageID = _message.messageID;
    [_deletePE sendRequest];
}

- (void)loadComponentsView
{
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    scrollView.contentSize = CGSizeMake(320, scrollView.bounds.size.height + LSTEXTVIEWMOVEOOFFSETY);
    
    UILabel* lbSenderName = [[UILabel alloc] initWithFrame:CGRectMake(10,5,150,20)];
    lbSenderName.font = LSFontNormal;
    lbSenderName.textColor = LSCOLOR_6A6A6A;
    lbSenderName.text = _message.senderuaname;
    [scrollView addSubview:lbSenderName];
    [lbSenderName release];
    
    UILabel* lbTime = [[UILabel alloc] initWithFrame:CGRectMake(150, 5, 150, 20)];
    lbTime.adjustsFontSizeToFitWidth = YES;
    lbTime.font = LSFontNormal;
    lbTime.textColor = LSCOLOR_6A6A6A;
    lbTime.textAlignment = UITextAlignmentRight;
    lbTime.text = _message.createtime;
    [scrollView addSubview:lbTime];
    [lbTime release];
    
    UITextView* contentView = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, 300, 100)];
    contentView.editable = NO;
    CALayer* contentLayer = contentView.layer;
    contentLayer.cornerRadius = 8.0f;
    contentLayer.borderWidth = 1;
    contentLayer.borderColor = LSCOLOR_Border.CGColor;
    contentView.textColor = LSCOLOR_BLACK;
    contentView.font = LSFontNormal;
    contentView.text = _message.content;
    [scrollView addSubview:contentView];
    [contentView release];
    
    NSInteger state = _message.state;
    
    if (state != 2) 
    {
        UIButton* btnVerify = [UIButton buttonWithType:UIButtonTypeCustom];
        UIEdgeInsets inset = UIEdgeInsetsMake(-5, 20, 0, 0);
        btnVerify.titleEdgeInsets = inset;
        btnVerify.frame = CGRectMake(5, 140, 157, 36);
        [btnVerify setBackgroundImage:LSImageByName(LSImage_message_verify) forState:UIControlStateNormal];
        [btnVerify setTitleColor:LSCOLOR_6A6A6A forState:UIControlStateNormal];
        [btnVerify setTitle:LSString_verifySuccess forState:UIControlStateNormal];
        [btnVerify addTarget:self action:@selector(verifyButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btnVerify];
        _btnVerify = btnVerify;
        [_btnVerify retain];
    }
    
    UIButton* btnDelete = [UIButton buttonWithType:UIButtonTypeCustom];
    UIEdgeInsets inset = UIEdgeInsetsMake(-5, 20, 0, 0);
    btnDelete.titleEdgeInsets = inset;
    btnDelete.frame = CGRectMake(160, 140, 157, 36);
    [btnDelete setBackgroundImage:LSImageByName(LSImage_message_delete) forState:UIControlStateNormal];
    [btnDelete setTitleColor:LSCOLOR_6A6A6A forState:UIControlStateNormal];
    [btnDelete setTitle:LSString_deleteleavemessage forState:UIControlStateNormal];
    [btnDelete addTarget:self action:@selector(deleteButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btnDelete];
    
    UILabel* lbReply = [[UILabel alloc] initWithFrame:CGRectMake(10, 188, 50, 25)];
    lbReply.font = LSFontMoreBig;
    lbReply.textColor = LSCOLOR_6A6A6A;
    lbReply.text = LSString_reply;
    [scrollView addSubview:lbReply];
    [lbReply release];
    
    _lbRemainNumber = [[UILabel alloc] initWithFrame:CGRectMake(250,188,60,25)];
    _lbRemainNumber.font = LSFontNormal;
    _lbRemainNumber.textColor = LSCOLOR_6A6A6A;
    _lbRemainNumber.text = [NSString stringWithFormat:@"%d",LSSendMessageTextViewContentMaxLength];
    [scrollView addSubview:_lbRemainNumber];
    
    _replyView = [[UITextView alloc] initWithFrame:CGRectMake(10, 215, 300, 130)];
    _replyView.delegate = self;
    _replyView.returnKeyType = UIReturnKeySend;
    _replyView.text = _message.replyContent;
    CALayer* replyLayer = _replyView.layer;
    replyLayer.cornerRadius = 8.0f;
    replyLayer.borderWidth = 1;
    replyLayer.borderColor = LSCOLOR_Border.CGColor;
    _replyView.textColor = LSCOLOR_BLACK;
    _replyView.font = LSFontNormal;
    [scrollView addSubview:_replyView];
    
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
}

- (void)postNotification:(NSString*)aName
{
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:self userInfo:nil];
}
@end
