//
//  EnterpriseCertificateViewController.m
//  Locoso
//
//  Created by yongchang hu on 11-12-21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "EnterpriseCertificateViewController.h"
#import "LSEnterpriseInfoViewController.h"
@implementation EnterpriseCertificateViewController
@synthesize recommendView,upDownScrollView,companyName,addtionMessage,scompanyName,companyID;

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
-(void)doCertificate: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES]; 
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"企业认证";
    companyName.text = scompanyName;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /////////////////////
//    UIImage* image= [UIImage imageNamed:@"quxiao2.png"]; 
//    CGRect frame_1= CGRectMake(0, 0, image.size.width, image.size.height); 
//    UIButton* backButton= [[UIButton alloc] initWithFrame:frame_1]; 
//    [backButton setBackgroundImage:image forState:UIControlStateNormal]; 
//    
//    [backButton addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside]; 
//    
//    //定制自己的风格的 UIBarButtonItem
//    UIBarButtonItem* someBarButtonItem= [[UIBarButtonItem alloc] initWithCustomView:backButton]; 
//    [self.navigationItem setLeftBarButtonItem:someBarButtonItem]; 
//    [someBarButtonItem release]; 
//    [backButton release]; 
    ////////////////////////
    
    /////////////////////
//    UIImage* image2= [UIImage imageNamed:@"renzheng_anniu.png"]; 
//    CGRect frame_2= CGRectMake(0, 0, image2.size.width, image2.size.height); 
//    UIButton* backButton2= [[UIButton alloc] initWithFrame:frame_2]; 
//    [backButton2 setBackgroundImage:image2 forState:UIControlStateNormal]; 
//    
//    [backButton2 addTarget:self action:@selector(doCertificate:) forControlEvents:UIControlEventTouchUpInside]; 
//    
//    //定制自己的风格的 UIBarButtonItem
//    UIBarButtonItem* someBarButtonItem2 = [[UIBarButtonItem alloc] initWithCustomView:backButton2]; 
    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"认证", @"认证") style:UIBarButtonItemStylePlain target:self action:@selector(doCertificate:)];
    
    [self.navigationItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 
//    [backButton2 release]; 
    ////////////////////////
    upDownScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	upDownScrollView.backgroundColor = [UIColor whiteColor];
    //	upDownScrollView.alwaysBounceVertical = YES;
    //	upDownScrollView.bounces = YES;
	upDownScrollView.delegate = self;
    //    upDownScrollView.pagingEnabled = YES;
    //    upDownScrollView.scrollEnabled = YES;
    upDownScrollView.showsVerticalScrollIndicator = YES;
    upDownScrollView.contentSize = CGSizeMake(320, 650);
    [self.view addSubview:upDownScrollView];
    if (recommendView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"EnterpriseCertificateView" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        
	}
    //    recommendView.frame = CGRectMake(0,0,320, 360);
    [upDownScrollView addSubview:recommendView];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    upDownScrollView = nil;
}
- (void)dealloc {
    
    [upDownScrollView release];

	[super dealloc];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//- (ContactViewController *)contactViewController {
//    // Instantiate the detail view controller if necessary.
//    if (contactViewController == nil) {
//        contactViewController = [[ContactViewController alloc] initWithNibName:@"ContactViewController" bundle:nil];
//    }
//    return contactViewController;
//}

- (IBAction)goContactButton
{
    LSEnterpriseInfoViewController *targetViewController = [[[LSEnterpriseInfoViewController alloc] initWithNibName:@"LSEnterpriseInfoViewController" bundle:nil] autorelease];
    targetViewController.companyID = companyID;
    [self.navigationController pushViewController:targetViewController animated:YES];
}

- (IBAction)backgroundClick:(id)sender
{	
	[addtionMessage resignFirstResponder];
	
}

@end
