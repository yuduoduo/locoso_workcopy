//
//  UserFeedbackViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-1-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UserFeedbackViewController.h"

@implementation UserFeedbackViewController

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
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"意见反馈";
}
#pragma mark - View lifecycle
-(void)doConfirm: (id) sender
{

    [self.navigationController popViewControllerAnimated:YES]; 
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //    /////////////////////
//    UIImage* image2= [UIImage imageNamed:@"queren.png"]; 
//    CGRect frame_2= CGRectMake(0, 0, image2.size.width, image2.size.height); 
//    UIButton* backButton2= [[UIButton alloc] initWithFrame:frame_2]; 
//    [backButton2 setBackgroundImage:image2 forState:UIControlStateNormal]; 
//    
//    [backButton2 addTarget:self action:@selector(doConfirm:) forControlEvents:UIControlEventTouchUpInside]; 
//    
//    //定制自己的风格的 UIBarButtonItem
//    UIBarButtonItem* someBarButtonItem2 = [[UIBarButtonItem alloc] initWithCustomView:backButton2]; 
    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"确认", @"确认") style:UIBarButtonItemStylePlain target:self action:@selector(doConfirm:)];
    [self.navigationItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 
//    [backButton2 release]; 
    ////////////////////////
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
