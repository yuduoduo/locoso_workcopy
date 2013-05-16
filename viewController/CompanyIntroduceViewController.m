//
//  CompanyIntroduceViewController.m
//  Locoso
//
//  Created by yongchang hu on 11-12-31.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CompanyIntroduceViewController.h"

@implementation CompanyIntroduceViewController
@synthesize info,infoStr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)doBack: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES]; 
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title =@"企业详情";

    if (![infoStr isEqualToString:@""]) {
        info.text  = infoStr;
    }
    info.editable = YES;
    info.scrollEnabled = YES;
    info.backgroundColor = [UIColor redColor];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
