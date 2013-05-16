//
//  LSSendMessageViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSendMessageViewController.h"
#import "LSModalView.h"
#import <QuartzCore/QuartzCore.h>

@interface LSSendMessageViewController ()
- (void)loadComponentsView;
- (void)setRemainNumber:(NSInteger)aNumber;
- (void)sendMessage;
- (void)postNotification;
@end

@implementation LSSendMessageViewController
@synthesize companyID = _companyID;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = LSString_sendmessage;
    [self setNavigationBarButtonItemWithTitleStytlePlain:LSString_send itemType:LSNavigationbarButtonItem_Right];
    [self loadComponentsView];
    
    if (nil == _addMessagePE)
    {
        _addMessagePE = [[LSAddMessagePE alloc] init];
        _addMessagePE.delegate = self;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_textView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_textView resignFirstResponder];
    [_addMessagePE cancelRequest];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_lbDescrption release];
    _lbDescrption = nil;
    [_textView release];
    _textView = nil;
    [_lbRemainHint release];
    _lbRemainHint = nil;
    [_lbRemainNumber release];
    _lbRemainNumber = nil;
}

- (void)dealloc
{
    [_addMessagePE release];
    [_lbDescrption release];
    [_textView release];
    [_lbRemainHint release];
    [_lbRemainNumber release];
    [super dealloc];
}

- (void)navigationRightButtonItemClicked:(id)aSender
{
    [self sendMessage];
}

#pragma mark UITextViewDelegate methods

- (void)textViewDidChange:(UITextView *)textView {
	NSString *postContent = textView.text;
    [self setRemainNumber:LSSendMessageTextViewContentMaxLength - [postContent length]];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if([text isEqualToString:@"\n"])
    {
        [self sendMessage];
        return NO;
    }
    return YES;
}

#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    [LSModalAlertView messageBox:nil message:@"发表成功，请等待企业主审核"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
    [self stopWaiting];
    NSLog(@"%s %@",__FUNCTION__, aError);
    [_textView becomeFirstResponder];
    [LSModalAlertView messageBox:nil message:LSString_sendFailed];
}

#pragma mark private methods
- (void)loadComponentsView
{
    if (nil == _lbDescrption)
    {
        _lbDescrption = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 50)];
        _lbDescrption.font = LSFontBig;
        _lbDescrption.numberOfLines = 0;
        _lbDescrption.textColor = LSCOLOR_BLACK;
        _lbDescrption.text = LSString_messagehint;
        [self.view addSubview:_lbDescrption];
    }
    
    if (nil == _textView)
    {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 55, 300, 120)];
		_textView.returnKeyType = UIReturnKeySend;
		_textView.delegate = self;
        _textView.textColor = LSCOLOR_333333;
        _textView.font = LSFontNormal;
        CALayer* layer = _textView.layer;
        layer.borderWidth = 1.5;
        layer.borderColor = LSCOLOR_6A6A6A.CGColor;
        layer.cornerRadius = 8.0f;
		[self.view addSubview:_textView];
    }
    
    if (nil == _lbRemainHint)
    {
        _lbRemainHint = [[UILabel alloc] initWithFrame:CGRectMake(10,178,120,20)];
        _lbRemainHint.font = LSFontNormal;
        _lbRemainHint.textColor = LSCOLOR_6A6A6A;
        _lbRemainHint.text = LSString_messageremainnumber;
        [self.view addSubview:_lbRemainHint];
    }
    
    if (nil == _lbRemainNumber)
    {
        _lbRemainNumber = [[UILabel alloc] initWithFrame:CGRectMake(135,178,50,20)];
        _lbRemainNumber.font = LSFontNormal;
        _lbRemainNumber.textColor = LSCOLOR_6A6A6A;
        [self setRemainNumber:LSSendMessageTextViewContentMaxLength];
        [self.view addSubview:_lbRemainNumber];
    }
}

- (void)setRemainNumber:(NSInteger)aNumber
{
    _lbRemainNumber.text = [NSString stringWithFormat:@"%d", aNumber];
    _lbRemainNumber.textColor = aNumber > 0 ? LSCOLOR_6A6A6A : [UIColor redColor];
}

- (void)sendMessage
{
    //input check
    NSInteger contentLength =[_textView.text length];
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
    
    _addMessagePE.companyID = _companyID;
    _addMessagePE.content = _textView.text;
    NSString* senderName = [LSGlobalData sharedInstance].systemConfig.loginUsername;
    if (0 == [senderName length])
    {
        senderName = LSString_guest;
    }
    _addMessagePE.senderName = senderName;
    
    [_addMessagePE sendRequest];
    [_textView resignFirstResponder];
    [self startHUDWaiting:LSString_sending];
}

- (void)postNotification
{
    NSDictionary* userInfo = [NSDictionary dictionaryWithObject:[NSNumber numberWithLong:_companyID] forKey:LSNOTIFICATION_USERINFO_KEY_COMPANYID];
    [[NSNotificationCenter defaultCenter] postNotificationName:LSNOTIFICATION_SENDMESSAGE_SUCCESS object:nil userInfo:userInfo];
}
@end

