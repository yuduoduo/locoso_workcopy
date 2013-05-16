//
//  LoginViewController.m
//  LoginApp
//
//  Created by Chris Riccomini on 12/5/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "CheckNetwork.h"
#import "MyDataSource.h"
#import "commonManager.h"
#import "AppDelegate.h"
#import "CheckAndShowMessage.h"
#import "MBProgressHUD.h"

@implementation LoginViewController

@synthesize usernameField;
@synthesize passwordField;

@synthesize myNaviBar,myTableView,registViewController;
@synthesize data;
@synthesize arrayData;
@synthesize loginIndicator;

// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"用户登录";
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view.
-(void)doBack: (id) sender
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate setTabBarIndex:0];
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationItem *naviItem = [[[UINavigationItem alloc] init] autorelease];
    
naviItem.title = @"用户登录";

    UIBarButtonItem *someBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"返回", @"返回") style:UIBarButtonItemStylePlain target:self action:@selector(doBack:)];
    
    [naviItem setLeftBarButtonItem:someBarButtonItem]; 
    [someBarButtonItem release]; 

    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"登录", @"登录") style:UIBarButtonItemStylePlain target:self action:@selector(doLogin:)];
    
    [naviItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 

    ////////////////////////
    
    [self.myNaviBar pushNavigationItem:naviItem animated:NO];
    
    float r = (float)(1.0);
    float g = (float)(0.7843);
    float b = (float)(0);
    myNaviBar.tintColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    

	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	//whether is open
	if([defaults objectForKey:kUsenameKey] != nil)
	{
		
		usernameField.text = [defaults objectForKey:kUsenameKey];
	}
	
	//port
	if([defaults objectForKey:kPasswordKey] != nil)
	{
		
		passwordField.text = [defaults objectForKey:kPasswordKey];
	}
	//password
	passwordField.secureTextEntry = YES; 
	//loginIndicator.hidden = TRUE;
    
    [usernameField becomeFirstResponder];
    
    [myTableView setDelegate:self];
    [myTableView setDataSource:self];
    myTableView.scrollEnabled = NO; 
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shu_bg.png"]];
    
    loginIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
    loginIndicator.frame = CGRectMake(160-10, 160, 20, 20);
    [self.view addSubview:loginIndicator];
}

- (void)keyboardWillShow:(NSNotification *)note {
	//[self	performTransition];
}

-(void)performTransition
{

	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationBeginsFromCurrentState:YES];
	self.view.center = CGPointMake(160,240-160);
	[UIView commitAnimations];
	
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    usernameField = nil;
    passwordField = nil;
    
    registViewController = nil;
    myTableView = nil;
    myNaviBar = nil;
}
- (void)dealloc {
    [myTableView release];
    [myNaviBar release];
    
    [usernameField release];
    [passwordField release];
    
    [registViewController release];
    [super dealloc];
}

- (IBAction) doLogin: (id) sender
{
    [loginIndicator startAnimating];
    
    [self performSelector:@selector(logoInAction) withObject:nil afterDelay:0.0];
    [loginIndicator stopAnimating];
}
-(void)logoInAction
{
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
    
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];
    
    MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	mbp.labelText = @"登录中,请等待...";
    

    if([self sendDataToServer:usernameField.text  password:passwordField.text])
    {
        NSDictionary *registdic = [[[NSDictionary alloc] initWithObjectsAndKeys:usernameField.text,@"registName",
                                    passwordField.text,@"registpassword",
                                    nil] autorelease];
        [[NSUserDefaults standardUserDefaults] setObject:registdic forKey:@"registdic"];
    }
}
- (IBAction)backgroundClick:(id)sender
{	
	[usernameField resignFirstResponder];
	[passwordField resignFirstResponder];
	
}
- (IBAction) registClick: (id) sender
{

	[self dismissModalViewControllerAnimated:YES];
}
-(void)viewDidAppear:(BOOL)animated
{

    NSDictionary *registdic = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"registdic"];
    if (registdic != nil) {
        if ([registdic isKindOfClass:[NSDictionary class]]) {
            usernameField.text = [registdic valueForKey:@"registName"];
            passwordField.text = [registdic valueForKey:@"registpassword"];
        }
    }
    // Add a notification for the keyboardwillshow event -  This is where we will add the button to the keyboard
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{

}
#pragma mark -
#pragma mark UITableView Delegate/Datasource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
            
        case 1:
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

	return 2; 
}

// Determines the number of rows for the argument section number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Since this sample has only one section, assume we were passed section = 1, and return the number of recipes
	//return menuList.count;
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 1;
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
        case 1:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"快速注册";
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

- (RegistViewController *)registViewController {
    // Instantiate the detail view controller if necessary.
    if (registViewController == nil) {
        registViewController = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil];
    }
    return registViewController;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 0) {
        [usernameField resignFirstResponder];
        [passwordField resignFirstResponder];
        
    
        RegistViewController *loginvew=[[[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil] autorelease];
        
        [self presentModalViewController:loginvew animated:NO];
    }

}

-(BOOL)sendDataToServer:(NSString*)sName password:(NSString*)sPassword
{
    NSString *hostStr = [commonManager getHostStr];hostStr = [hostStr stringByAppendingString:@"/member.action?act=login&subgson="];
    
    NSString *subgson = [NSString stringWithFormat: @"{\"account\":{\"password\":\"%@\",\"loginname\":\"%@\"},\"model\":\"\",\"verify\":{\"time\":\"2012-01-10\",\"permit\":\"verify\"}}",sPassword, sName];
	 
    hostStr = [hostStr stringByAppendingString:subgson];

    
    hostStr = [hostStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if ([CheckNetwork isExistenceNetwork]) {
	 	data = [[MyDataSource fetchLibraryInformation:hostStr] retain];
	}
    NSString *uaid = [[data valueForKey:@"uaid"] stringValue];

    if( uaid != nil)
    {
        [self  saveUandS:[[data valueForKey:@"uaid"] stringValue] session:[data valueForKey:@"session"]];
        
        
        [[NSUserDefaults standardUserDefaults] setBool:true  forKey:@"whetherLoginIn"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self performSelector:@selector(displayProgress) withObject:nil afterDelay:1];
        
        return  true;
    }
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [usernameField becomeFirstResponder];
    
    
    if ([data count] == 3) {
        UIAlertView *errorView;
        errorView = [[UIAlertView alloc] 
                 initWithTitle: @"" 
                 message: [data objectForKey:@"message"] 
                 delegate: self 
                 cancelButtonTitle: @"确定" otherButtonTitles: nil]; 
        [errorView show];
        [errorView autorelease];
        [[NSUserDefaults standardUserDefaults] setBool:false  forKey:@"whetherLoginIn"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return false;
}
-(void)displayProgress
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self dismissModalViewControllerAnimated:YES];
}
-(void)saveUandS:(NSString*) uaid session:(NSString*)session
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:uaid  forKey:@"uaid"];
    [defaults setObject:session  forKey:@"session"];
    [defaults synchronize];
}

@end
