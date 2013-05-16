//
//  LSCompanyIntroduceViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-4-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyIntroduceViewController.h"

@interface LSCompanyIntroduceViewController ()

@end

@implementation LSCompanyIntroduceViewController
@synthesize company = _company;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"企业介绍";
    if (nil == _textView)
    {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10,10, 300, 460-44-49-20)];
        _textView.editable = NO;
        [self.view addSubview:_textView];
    }
    _textView.text = _company.info;
    _textView.font = [UIFont systemFontOfSize:13];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_textView release];
    _textView = nil;
}

- (void)dealloc
{
    [_textView release];
    self.company = nil;
    [super dealloc];
}
@end
