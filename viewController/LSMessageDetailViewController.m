//
//  LSMessageDetailViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMessageDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface LSMessageDetailViewController ()

@end

@implementation LSMessageDetailViewController
@synthesize message = _message;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadComponentsView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    contentView.editable = FALSE;
    [scrollView addSubview:contentView];
    [contentView release];

    if (_message.replyContent.length > 0) {
        UILabel* lbReply = [[UILabel alloc] initWithFrame:CGRectMake(10, 168, 50, 25)];
        lbReply.font = LSFontMoreBig;
        lbReply.textColor = LSCOLOR_6A6A6A;
        lbReply.text = LSString_reply;
        [scrollView addSubview:lbReply];
        [lbReply release];
        
        _replyView = [[UITextView alloc] initWithFrame:CGRectMake(10, 195, 300, 130)];
        _replyView.delegate = self;
        _replyView.returnKeyType = UIReturnKeySend;
        _replyView.text = _message.replyContent;
        _replyView.editable = FALSE;
        CALayer* replyLayer = _replyView.layer;
        replyLayer.cornerRadius = 8.0f;
        replyLayer.borderWidth = 1;
        replyLayer.borderColor = LSCOLOR_Border.CGColor;
        _replyView.textColor = LSCOLOR_BLACK;
        _replyView.font = LSFontNormal;
        [scrollView addSubview:_replyView];
    }
    
    
    
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
}
@end
