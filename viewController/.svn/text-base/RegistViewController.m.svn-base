//
//  RegistViewController.m
//  Locoso
//
//  Created by yongchang hu on 11-12-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "RegistViewController.h"
//@implementation UINavigationBar (CustomImage)  
//- (void)drawRect:(CGRect)rect {  
//    UIImage *image = [UIImage imageNamed: @"tou_bg.png"];  
//    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];  
//}  
//@end 
#import "CheckNetwork.h"
#import "MyDataSource.h"
#import "ASIHTTPRequest.h"
#import "commonManager.h"
#import "CheckAndShowMessage.h"
#import "JsonResturnCheck.h"
@implementation RegistViewController
@synthesize myNaviBar,myTableView;
@synthesize data;
@synthesize arrayData;
@synthesize indicatorview,usernameField,passwordField;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"免费注册";
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
    [self dismissModalViewControllerAnimated:YES];
}
-(void)doRegist: (id) sender
{
    [indicatorview startAnimating];
//    if ([self sendDataToServer:usernameField.text password:passwordField.text]) {
//        [self dismissModalViewControllerAnimated:YES];
//    }else
//    {
//        UIAlertView *errorView;
//		errorView = [[UIAlertView alloc] 
//					 initWithTitle: @"" 
//					 message: @"注册失败" 
//					 delegate: self 
//					 cancelButtonTitle: @"确定" otherButtonTitles: nil]; 
//		[errorView show];
//		[errorView autorelease];
//    }
//    [indicatorview stopAnimating];
    
    BOOL checkcontent =   [CheckAndShowMessage checkNullAndShowMsg:usernameField.text msg:@"请输入帐户"];
    if (checkcontent) {
        [usernameField becomeFirstResponder];
        return;
    }
    BOOL checkcontent2 =   [CheckAndShowMessage checkNullAndShowMsg:passwordField.text msg:@"请输入密码"];
    if (checkcontent2) {
        [passwordField becomeFirstResponder];
        return;
    }


    [self sendDataToServer:usernameField.text password:passwordField.text];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationItem *naviItem = [[[UINavigationItem alloc] init] autorelease];
    naviItem.title = @"免费注册";
    /////////////////////
//    UIImage* image= [UIImage imageNamed:@"back_icon.png"]; 
//    CGRect frame_1= CGRectMake(0, 0, image.size.width, image.size.height); 
//    UIButton* backButton= [[UIButton alloc] initWithFrame:frame_1]; 
//    [backButton setBackgroundImage:image forState:UIControlStateNormal]; 
//    
//    [backButton addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside]; 
//    
//    //定制自己的风格的 UIBarButtonItem
//    UIBarButtonItem* someBarButtonItem= [[UIBarButtonItem alloc] initWithCustomView:backButton]; 
    UIBarButtonItem *someBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"返回", @"返回") style:UIBarButtonItemStylePlain target:self action:@selector(doBack:)];
    [naviItem setLeftBarButtonItem:someBarButtonItem]; 
    [someBarButtonItem release]; 
//    [backButton release]; 
    ////////////////////////
    
    /////////////////////
//    UIImage* image2= [UIImage imageNamed:@"zhuce.png"]; 
//    CGRect frame_2= CGRectMake(0, 0, image2.size.width, image2.size.height); 
//    UIButton* backButton2= [[UIButton alloc] initWithFrame:frame_2]; 
//    [backButton2 setBackgroundImage:image2 forState:UIControlStateNormal]; 
//    
//    [backButton2 addTarget:self action:@selector(doRegist:) forControlEvents:UIControlEventTouchUpInside]; 
//    
//    //定制自己的风格的 UIBarButtonItem
//    UIBarButtonItem* someBarButtonItem2 = [[UIBarButtonItem alloc] initWithCustomView:backButton2]; 
    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"注册", @"注册") style:UIBarButtonItemStylePlain target:self action:@selector(doRegist:)];
    [naviItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 
//    [backButton2 release]; 
    ////////////////////////
    
    float r = (float)(1.0);
    float g = (float)(0.7843);
    float b = (float)(0);
    myNaviBar.tintColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
    [self.myNaviBar pushNavigationItem:naviItem animated:NO];
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
//        [myNaviBar setBackgroundImage:[UIImage imageNamed:@"tou_bg.png"] forBarMetrics:0];
//    }else
//    {
//        myNaviBar.tintColor = [UIColor purpleColor];
//    }
    
    [usernameField becomeFirstResponder];
    
    [myTableView setDelegate:self];
    [myTableView setDataSource:self];
    myTableView.scrollEnabled = NO; 
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shu_bg.png"]];
    
    indicatorview = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
    indicatorview.frame = CGRectMake(160-10, 160, 20, 20);
    [self.view addSubview:indicatorview];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    myNaviBar = nil;
    usernameField = nil;
    passwordField = nil;
    myTableView = nil;
}
- (void)dealloc
{
	[myNaviBar release];
    [usernameField release];
    [passwordField release];
    [myTableView release];
    [super dealloc];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark -
#pragma mark UITableView Delegate/Datasource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
            
        case 0:
            return @"免费注册";
            break; 
        default:
            return @"";
            break;
    }
    return @"";
}
// Determines the number of sections within this table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // This displays a single list of recipes, so one section will do.
    
	return 1; 
}

// Determines the number of rows for the argument section number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Since this sample has only one section, assume we were passed section = 1, and return the number of recipes
	//return menuList.count;
    switch (section) {
        case 0:
            return 2;
            break;
        default:
            break;
    }
    return 2;
}

// Create or Access and return appropriate cell identified by the argument indexPath (i.e. Section number and Row number combination)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *kCellIdentifier = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (!cell)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier] autorelease];
        
		cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.backgroundColor = [UIColor clearColor];
		cell.textLabel.opaque = NO;
		cell.textLabel.textColor = [UIColor blackColor];
		cell.textLabel.highlightedTextColor = [UIColor whiteColor];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
		
		cell.detailTextLabel.backgroundColor = [UIColor clearColor];
		cell.detailTextLabel.opaque = NO;
		cell.detailTextLabel.textColor = [UIColor grayColor];
		cell.detailTextLabel.highlightedTextColor = [UIColor whiteColor];
		cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    }
    
	// get the view controller's info dictionary based on the indexPath's row
    //NSLog(@"menuList count = %d",menuList.count);
    
    cell.textLabel.font = [UIFont fontWithName:@"KaiTi_GB2312" size:16];
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"帐户：";
                    break;
                case 1:
                    cell.textLabel.text = @"密码：";
                    break;    
                default:
                    break;
            }
            break;

        default:
            break;
    }
    
    
    

	return cell;
}

-(void)sendDataToServer:(NSString*)sName password:(NSString*)sPassword
{
    
    //NSString *hostStr = @"http://api.locoso.org/v1/member.action?act=register";
    NSString *hostStr = [commonManager getHostStr];hostStr = [hostStr stringByAppendingString:@"/member.action?act=register"];
    
   hostStr = [commonManager ManageLogion:hostStr username:sName password:sPassword];

    
    hostStr = [hostStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if ([CheckNetwork isExistenceNetwork]) {
		data = [[MyDataSource fetchLibraryInformation:hostStr] retain];
	}

    if ([JsonResturnCheck JsonResturnCheck:data]) {
        UIAlertView *errorView;
        errorView = [[UIAlertView alloc] 
                     initWithTitle: @"" 
                     message: [data objectForKey:@"message"] 
                     delegate: self 
                     cancelButtonTitle: @"确定" otherButtonTitles: nil]; 
        [errorView show];
        [errorView autorelease];
        indicatorview.hidden = true;
        [indicatorview stopAnimating];
        return ;
    }
    
    NSString *uaid = [[data valueForKey:@"uaid"] stringValue];


    if( uaid != nil)
    {
        //[self  saveUandS:[[data valueForKey:@"uaid"] stringValue] session:[data valueForKey:@"session"]];
        NSDictionary *registdic = [[[NSDictionary alloc] initWithObjectsAndKeys:sName,@"registName",
                                   sPassword,@"registpassword",
                                   nil] autorelease];
        [[NSUserDefaults standardUserDefaults] setObject:registdic forKey:@"registdic"];
        [self dismissModalViewControllerAnimated:YES];
        
    }
    
}

@end
