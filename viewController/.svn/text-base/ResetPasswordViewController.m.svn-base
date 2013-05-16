//
//  ResetPasswordViewController.m
//  Locoso
//
//  Created by yongchang hu on 11-12-21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "CheckNetwork.h"
#import "MyDataSource.h"
#import "commonManager.h"
#import "CheckAndShowMessage.h"
@implementation ResetPasswordViewController
@synthesize oldPasswordField = _oldPasswordField,PasswordField = _PasswordField,PasswordField2 = _PasswordField2,myTableView;
@synthesize data;
@synthesize arrayData;
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
-(void)doResetPsw: (id) sender
{
    BOOL checkcontent =   [CheckAndShowMessage checkNullAndShowMsg:_oldPasswordField.text msg:@"请输入旧密码"];
    if (checkcontent) {
        [_oldPasswordField becomeFirstResponder];
        return;
    }
    BOOL checkcontent2 =   [CheckAndShowMessage checkNullAndShowMsg:_PasswordField.text msg:@"请输入新密码"];
    if (checkcontent2) {
        [_PasswordField becomeFirstResponder];
        return;
    }
    BOOL checkcontent3 =   [CheckAndShowMessage checkNullAndShowMsg:_PasswordField2.text msg:@"请输入新密码"];
    if (checkcontent3) {
        [_PasswordField2 becomeFirstResponder];
        return;
    }
    if (![_PasswordField.text isEqualToString:_PasswordField2.text]) {
        UIAlertView *errorView;
        errorView = [[UIAlertView alloc] 
                     initWithTitle: @"" 
                     message: @"密码不一致"
                     delegate: self 
                     cancelButtonTitle: @"确定" otherButtonTitles: nil]; 
        [errorView show];
        [errorView autorelease];
        return;
    }
    [self sendDataToServer:[self getDataUAID] password:_oldPasswordField.text newpassword:_PasswordField.text session:[self getDataSession]];
    
  
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"修改密码";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_oldPasswordField becomeFirstResponder];
    
    [myTableView setDelegate:self];
    [myTableView setDataSource:self];
    myTableView.scrollEnabled = NO; 
    
    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"确认", @"确认") style:UIBarButtonItemStylePlain target:self action:@selector(doResetPsw:)];
    [self.navigationItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 

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
#pragma mark -
#pragma mark UITableView Delegate/Datasource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
            
        case 0:
            return @"修改密码";
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
            return 3;
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
                    cell.textLabel.text = @"旧密码：";
                    break;
                case 1:
                    cell.textLabel.text = @"新密码：";
                    break;
                case 2:
                    cell.textLabel.text = @"确认新密码：";
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
-(BOOL)sendDataToServer:(NSString*)suaid password:(NSString*)sPassword newpassword:(NSString*)snewPassword session:(NSString*)ssession
{
    //NSString *hostStr = @"http://api.locoso.org/v1/member.action?act=login";
    //NSString *hostStr = @"http://api.locoso.org/v1/member.action?act=modifypwd&subgson=";
    NSString *hostStr = [commonManager getHostStr];hostStr = [hostStr stringByAppendingString:@"/member.action?act=modifypwd&subgson="];
    
    
    
    
    NSString *subgson = [NSString stringWithFormat: @"{\"account\":{\"uaid\":%@,\"password\":%@,\"newpassword\":%@,\"session\":%@},\"model\":\"\",\"verify\":{\"time\":\"2012-01-10\",\"permit\":\"verify\"}}",suaid,sPassword,snewPassword,ssession];
    
    hostStr = [hostStr stringByAppendingString:subgson];

    
    hostStr = [hostStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *returnStr = nil;
    if ([CheckNetwork isExistenceNetwork]) {
		returnStr = [MyDataSource fetchLibraryInformation:hostStr];
	}

    if( [returnStr count] == 3 )
    {
        NSString *successed = [returnStr objectForKey:@"success"];
        if ([successed isEqualToString:@"success"]) {
            [self.navigationController popViewControllerAnimated:YES];
            return  true;
        }else{
        
    
            UIAlertView *errorView;
            errorView = [[UIAlertView alloc] 
                 initWithTitle: @"" 
                 message: [returnStr objectForKey:@"message"] 
                 delegate: self 
                 cancelButtonTitle: @"确定" otherButtonTitles: nil]; 
            [errorView show];
            [errorView autorelease];
            }
        }
    return false;
}
-(NSString*)getDataUAID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:@"uaid"];
    
}
-(NSString*)getDataSession
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:@"session"];
    
}
@end
