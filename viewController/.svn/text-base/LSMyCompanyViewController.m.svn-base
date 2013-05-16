//
//  LSMyCompanyViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyCompanyViewController.h"
#import "URLTranslateTool.h"

#import "LSTrafficStaticsViewController.h"
#import "EnterpriseCertificateViewController.h"
#import "commonManager.h"
#import "LSEnterpriseInfoViewController.h"
#import "ResetPasswordViewController.h"

#import "SizeOfControllerFont.h"
#import "UIColorTool.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "LSMyLogoViewController.h"

#import "LSCompanyMapViewController.h"
#import "LSCompanyDetailViewController.h"
#import "CheckNetwork.h"
#import "UploadImageToServerCom.h"
#import "LSMyProductManageViewController.h"
#import "LSMyNewsManageViewController.h"
#import "LSMyCompanyMessageListViewController.h"
#import "LSCompanyPhotosListViewController.h"
#import "LSString.h"
#import "LSViewUtils.h"
#import "UIImageTool.h"
@interface LSMyCompanyViewController ()

@end

@implementation LSMyCompanyViewController
@synthesize myCompanyDetailHeaderView,photoButton,certifyLabel,adressLabel,phoneLabel,companynameLabel;
@synthesize productManageButton,newsManageButton,photoManageButton;
@synthesize myCompanyManageView;
@synthesize menuList,myTableView;
@synthesize companyLogoImage,markImage,popularLable,websiteLable;

@synthesize overlayViewController,capturedImages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"我的企业", @"我的企业");
        self.tabBarItem.image = [UIImage imageNamed:@"wodeqiye_hui"];
    }
    return self;
}
-(void)loadComponetView
{
    //scroll
    if (nil == upDownScrollView) {
        upDownScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
        upDownScrollView.backgroundColor = [UIColor whiteColor];
        upDownScrollView.alwaysBounceVertical = YES;
        upDownScrollView.bounces = YES;
        upDownScrollView.delegate = self;
        upDownScrollView.contentSize = CGSizeMake(320, 870);
    }
    
    [self.view addSubview:upDownScrollView];
    
    
    if (myCompanyDetailHeaderView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"LSMyCompanyDetailHeaderView" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [self.companyLogoImage setCornerAndBorderNormal];
        companyLogoImage.image = LSImageByName(LSImage_icon_placeholder);
        markImage.hidden = YES;
        
	}
    [upDownScrollView addSubview:myCompanyDetailHeaderView];
    
    
    if (myCompanyManageView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"LSMyCompanyManageView" owner:self options:nil];
		myCompanyManageView.frame = CGRectMake(0,120,320, 720);        
	}
    [upDownScrollView addSubview:myCompanyManageView];
    [myTableView setDelegate:self];
    [myTableView setDataSource:self];
    myTableView.scrollEnabled = NO;
    companyLogoImage.image = [UIImage imageNamed:@"yuanshi.png"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    ////////////////////////
    
//    markImage.image = [UIImage imageNamed:@"tu_bg01.png"];
    
    //image picker
    self.overlayViewController =
    [[[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:nil] autorelease];
    
    // as a delegate we will be notified when pictures are taken and when to dismiss the image picker
    self.overlayViewController.delegate = self;
    
    self.capturedImages = [NSMutableArray array];
    imageIconArray = [[NSArray alloc] initWithObjects:
                      @"myep_mng_product.png",
                      @"myep_mng_news.png",
                      @"myep_mng_photo.png",
                      @"myep_mng_flowcount.png",
                      @"myep_mng_authen.png",
                      @"myep_mng_contact.png",
                      @"icon05.png",
                      @"map_icon.png",
                      @"myep_mng_leavemsg.png",
                      @"ico01.png",
                      @"myep_mng_chgpswd.png",
                      @"icon06.png",nil];
    

    
    UIBarButtonItem *someBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"刷新", @"刷新") style:UIBarButtonItemStylePlain target:self action:@selector(doRefresh)];
    
    [self.navigationItem setRightBarButtonItem:someBarButtonItem]; 
    [someBarButtonItem release]; 
    

    
    if (nil == _getCompanyIdPE)
    {
        _getCompanyIdPE = [[LSGetCompanyIdPE alloc] init];
        _getCompanyIdPE.delegate = self;
    }
    if (nil == _myCompanyPE)
    {
        _myCompanyPE = [[LSMyCompanyPE alloc] init];
        _myCompanyPE.delegate = self;
    }
    if (nil == _companyCountPE)
    {
        _companyCountPE = [[LSMyCompanyCountPE alloc] init];
        _companyCountPE.delegate = self;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didNotification:) name:LSNOTIFICATION_MYCOMPANY_CLEAR_DATA object:nil];
    
    [UIImageTool setLayerCorner:companyLogoImage.layer];
}
- (void)didNotification:(NSNotification*)aNotification
{
    if ([aNotification.name isEqualToString:LSNOTIFICATION_MYCOMPANY_CLEAR_DATA])
    {
        [[NSUserDefaults standardUserDefaults] setBool:false  forKey:@"whetherLoginIn"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [_getCompanyIdPE release];
        [_myCompanyPE release];
        [_companyCountPE release];
        [_photoUploadPE release];
        _getCompanyIdPE = nil;
        _myCompanyPE = nil;
        _companyCountPE = nil;
        _photoUploadPE = nil;
        self.view = nil;
    }
}
- (void)dealloc {
	[myCompanyDetailHeaderView release];
	[photoButton release];
	[certifyLabel release];
	[adressLabel release];
	[phoneLabel release];
    
    [menuList release];
    [myTableView release];

    [ _getCompanyIdPE cancelRequest];
    [_getCompanyIdPE release];
    [ _myCompanyPE cancelRequest];
    [_myCompanyPE release];
    [ _companyCountPE cancelRequest];
    [_companyCountPE release];
	[super dealloc];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    myCompanyDetailHeaderView  = nil;
    photoButton = nil;
    certifyLabel = nil;
    adressLabel = nil;
    phoneLabel = nil;
    
    menuList = nil;
    myTableView = nil;
}
-(void)doRefresh
{
    [self startWaiting];
    _myCompanyPE.companyID = [_getCompanyIdPE.rspData.companyID intValue];
    [_myCompanyPE sendRequest];
    [_companyCountPE sendRequest];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (nil == _getCompanyIdPE.rspData)
    {
        [self startWaiting];
        [_getCompanyIdPE sendRequest];
    }
    else 
    {
        if (nil == _myCompanyPE.rspData) {
            [self startWaiting];
            _myCompanyPE.companyID = [_getCompanyIdPE.rspData.companyID intValue];
            [_myCompanyPE sendRequest];
        }else {
            [self loadComponetView];
            [self setDataToController];
        }
        
    }

}
-(void)viewWillDisappear:(BOOL)animated
{
    [_getCompanyIdPE cancelRequest];
    [_myCompanyPE cancelRequest];
    [_companyCountPE cancelRequest];
    [super viewWillDisappear:animated];
}
-(void)setDataToController
{
    NSDictionary *company =  _myCompanyPE.rspData.arrCategory ;
    companynameLabel.text = [company objectForKey:LSJSONKEY_companyname];
    websiteLable.text = [company objectForKey:LSJSONKEY_website];
    NSString *logo = [company objectForKey:LSJSONKEY_logo];
    if (nil != logo && logo.length > 0) {
        [self addImage:companyLogoImage imageURL:[URLTranslateTool OldUrlTranslateTo:logo  idd:@"3"]];
    }
     
    [myTableView reloadData];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark -
#pragma mark UITableView Delegate/Datasource

// Determines the number of sections within this table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // This displays a single list of recipes, so one section will do.
	return 5; 
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
            
        case 0:
            return @"信息发布";
            break;
        case 1:
            return @"企业推广";
            break;
        case 2:
            return @"企业管理";
            break;
        case 3:
            return @"帐户管理";
            break;  

            
        default:
            return @"";
            break;
    }
    return @"";
}
// Determines the number of rows for the argument section number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Since this sample has only one section, assume we were passed section = 1, and return the number of recipes
    switch (section) {
            
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 5;
            break;
        case 3:
            return 2;
            break;    

            
        default:
            break;
    }
	return 0;
}
-(NSString*)getCountFromStr:(NSInteger)type
{
    if (_companyCountPE.rspData  != nil) {
        LSDataCount *count = _companyCountPE.rspData.arrCategory;
        switch (type) {
            case 0:
                return count.procount;
                break;
            case 1:
                return count.newscount;
                break;
            case 2:
                return count.photocount;
                break;
            case 3:
                return count.viewCount;
                break;
            case 4:
                return count.mesgcount;
                break;
            default:
                break;
        }
    }else {
        return @"0";
    }
     return @"0";
}
-(NSInteger)getVerifyState
{
    NSDictionary *company =  _myCompanyPE.rspData.arrCategory;
    
    return [[company objectForKey:LSJSONKEY_state] intValue];
}
// Create or Access and return appropriate cell identified by the argument indexPath (i.e. Section number and Row number combination)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *kCellIdentifier = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (!cell)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kCellIdentifier] autorelease];
        
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textLabel.backgroundColor = [UIColor clearColor];
		cell.textLabel.opaque = NO;
		cell.textLabel.textColor = [UIColor blackColor];
		cell.textLabel.highlightedTextColor = [UIColor whiteColor];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:MYCOMPANYVIEWCONTROLLER_LIST_HEAD_SIZE];
		
		cell.detailTextLabel.backgroundColor = [UIColor clearColor];
		cell.detailTextLabel.opaque = NO;
        //		cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.textColor = [UIColorTool colorWithHexString:MYCOMPANYVIEWCONTROLLER_LIST_DETAIL_COLOR];
		cell.detailTextLabel.highlightedTextColor = [UIColor whiteColor];
		cell.detailTextLabel.font = [UIFont systemFontOfSize:MYCOMPANYVIEWCONTROLLER_LIST_DETAIL_SIZE];
    }
    
	// get the view controller's info dictionary based on the indexPath's row

    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"产品管理";
                    
                    cell.detailTextLabel.text = [self getCountFromStr:0];
                    break;
                case 1:
                    cell.textLabel.text = @"企业新闻";
                    cell.detailTextLabel.text =  [self getCountFromStr:1];
                    break;
                case 2:
                    cell.textLabel.text = @"企业相册";
                    cell.detailTextLabel.text =  [self getCountFromStr:2];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"流量统计";
                    cell.detailTextLabel.text =  [self getCountFromStr:3];
                    break;
                case 1:
                    cell.textLabel.text = @"企业认证";
                    
                    if ([self getVerifyState]) {
                        cell.detailTextLabel.text = @"已认证";
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }else{
                        cell.detailTextLabel.text = @"";
                    }
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"企业资料";
                    break;
                case 1:
                    cell.textLabel.text = @"企业形象";
                    NSDictionary *company =  _myCompanyPE.rspData.arrCategory;
                    NSString *logo = [company objectForKey:LSJSONKEY_logo];
                    if (nil == logo || logo.length <= 0 ) {
                        cell.detailTextLabel.text = @"未设置";
                        cell.detailTextLabel.textColor = [UIColor grayColor];
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }else
                    {
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                        cell.detailTextLabel.text = @"";
                    }
                    break;
                case 3:
                    cell.textLabel.text = @"留言管理";
                    cell.detailTextLabel.text =  [self getCountFromStr:4];
                    break;
                case 2:
                    cell.textLabel.text = @"企业地图";
                    
                    break;
                case 4:
                    cell.textLabel.text = @"企业预览";
                    break;
                default:
                    break;
            }
            break;
        case 3:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"修改密码";
                    break;
                case 1:
                    cell.textLabel.text = @"退出登录";
                    break;
                default:
                    break;
            }
            break;    
            
            
        default:
            
            break;
    }
    
    
    if ([imageIconArray count]) {
        
        NSInteger count = [self sectionindexcount:indexPath.section];
        
        
        if ([imageIconArray count] > count+indexPath.row) {
            cell.image=  [UIImage imageNamed:[imageIconArray objectAtIndex:count+indexPath.row]] ;
        }
        
    }
    
	return cell;
}
-(NSInteger)sectionindexcount:(NSInteger)section
{
    
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 5;
            break;
        case 3:
            return 10;
            
            break;
        case 4:
            return 12;
            break;
        default:
            break;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return MYCOMPANYVIEWCONTROLLER_LIST_HEIGHT;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *targetViewController = nil;
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    
                    LSMyProductManageViewController* Controller = [[[LSMyProductManageViewController alloc] initWithNibName:@"LSMyProductManageViewController" bundle:nil] autorelease];
                     
                    Controller.companyID = [_getCompanyIdPE.rspData.companyID intValue];
                    targetViewController = Controller;
                }
                    break;
                case 1:
                {
                    
                    LSMyNewsManageViewController* Controller = [[[LSMyNewsManageViewController alloc] initWithNibName:@"LSMyNewsManageViewController" bundle:nil] autorelease];
                    
                    Controller.companyID = [_getCompanyIdPE.rspData.companyID intValue];
                    targetViewController = Controller;
                }
                    break;
                case 2:
                {
                    
                    LSCompanyPhotosListViewController *Controller = [[[LSCompanyPhotosListViewController alloc] initWithNibName:@"LSCompanyPhotosListViewController" bundle:nil] autorelease];

                     Controller.companyID = [_getCompanyIdPE.rspData.companyID intValue];
                    targetViewController = Controller;
                }
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    
                    
                    targetViewController = [[[LSTrafficStaticsViewController alloc] initWithNibName:@"LSTrafficStaticsViewController" bundle:nil] autorelease];
                    
                    break;
                case 1:
                {
                    if (![self getVerifyState])
                    {
                        EnterpriseCertificateViewController *Controller = [[[EnterpriseCertificateViewController alloc] initWithNibName:@"EnterpriseCertificateViewController" bundle:nil] autorelease];
                        NSDictionary *company =  _myCompanyPE.rspData.arrCategory;
                        NSString *name = [company objectForKey:LSJSONKEY_companyname];
                        Controller.scompanyName  = name;
                        Controller.companyID = [_getCompanyIdPE.rspData.companyID intValue];
                        targetViewController = Controller;
                    }
                    
                }
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                {
                 
                    
                    
                    LSEnterpriseInfoViewController* Controller = [[[LSEnterpriseInfoViewController alloc] initWithNibName:@"LSEnterpriseInfoViewController" bundle:nil] autorelease];
                    Controller.companyID = [_getCompanyIdPE.rspData.companyID intValue];
                    targetViewController = Controller;
                    
                }
                    break;
                case 1:
                {
                    NSDictionary *company =  _myCompanyPE.rspData.arrCategory;
                    NSString *logo = [company objectForKey:LSJSONKEY_logo];
                    if(nil == logo ||  logo.length == 0)
                    {
                        [self updateLogoAction:nil];
                    }else
                    {
                       
                        
                        
                        LSMyLogoViewController *controller = [[LSMyLogoViewController alloc] initWithNibName:@"LSMyLogoViewController" bundle:nil];
                        controller.url = logo ;
                        
                        targetViewController = controller;
                    }
                }
                    break;
                case 2:
                {
                    LSCompanyMapViewController*controller=[[LSCompanyMapViewController alloc] initWithNibName:@"LSCompanyMapViewController" bundle:nil];
                    controller.delegate = self;
                    NSDictionary *company =  _myCompanyPE.rspData.arrCategory;
                    [controller setDicToCompanyMap: company];
                    targetViewController = controller;
                }
                    break;
                case 3:
                {
                    
                    
                    LSMyCompanyMessageListViewController* Controller = [[[LSMyCompanyMessageListViewController alloc] initWithNibName:@"LSMyCompanyMessageListViewController" bundle:nil] autorelease];
                    Controller.companyID = [_getCompanyIdPE.rspData.companyID intValue];
                    targetViewController = Controller;
                }
                    break;
                case 4:
                {
                    
                    LSCompanyDetailViewController* Controller = [[[LSCompanyDetailViewController alloc] initWithNibName:@"LSCompanyDetailViewController" bundle:nil] autorelease];
                    Controller.companyID = [_getCompanyIdPE.rspData.companyID intValue];
                    targetViewController = Controller;
                }
                    break;
                default:
                    break;
            }
            break;
        case 3:
            switch (indexPath.row) {
                case 0:
                    
                    
                    targetViewController = [[[ResetPasswordViewController alloc] initWithNibName:@"ResetPasswordViewController" bundle:nil] autorelease];
                    break;
                case 1:
                    
                    targetViewController = [[[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil] autorelease];
                    
                    [self presentModalViewController:targetViewController animated:NO];
                    
                    
                    [NSThread detachNewThreadSelector:@selector(sendLoginOutMsg) toTarget:self withObject:nil];
                    return;
                    break;
                default:
                    break;
            }
            break;    

            
        default:
            
            break;
    }
    
    [self.navigationController pushViewController:targetViewController animated:YES];
}
-(void)sendLoginOutMsg{
    if (nil == _loginOutPE) {
        _loginOutPE = [[LSLoginOutManagePE alloc]init];
        _loginOutPE.delegate = self;
    }
    [_loginOutPE sendRequest];
   [[NSNotificationCenter defaultCenter] postNotificationName:LSNOTIFICATION_MYCOMPANY_CLEAR_DATA object:self userInfo:nil];
}
#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    
    
    
    if (_getCompanyIdPE == aEngine) {
        
        
        
        if (nil == _myCompanyPE.rspData)
        {
            _myCompanyPE.companyID = [_getCompanyIdPE.rspData.companyID intValue];
            [_myCompanyPE sendRequest];
        }
        else 
        {
            [self setDataToController];
            if (nil == _companyCountPE.rspData) {
                [_companyCountPE sendRequest];
            }else {
                [myTableView reloadData];
                [self stopWaiting];
            }
        }
    }else  if (_myCompanyPE == aEngine)
    {
        
        [self loadComponetView];
        [self setDataToController];
        if (nil == _companyCountPE) {
            [_companyCountPE sendRequest];
        }else {
            [myTableView reloadData];
            [self stopWaiting];
        }
        
    }else  if (_companyCountPE == aEngine)
    {
        [myTableView reloadData];
        [self stopWaiting];
    }else
    if (aEngine == _photoUploadPE) {
        if (nil != _photoUploadPE.rspData) {
            LSDataPhoto *photo = _photoUploadPE.rspData.photoDic;
            [self addImage:companyLogoImage imageURL:[photo.filepath stringByHandleImageURL]];
            
            [self stopWaiting];
        }
    }else if(aEngine == _loginOutPE)
    {
        
    }
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
    [self stopWaiting];
    NSLog(@"%@ didProtocolEngineFailed",[[self class] description]);

//    NSString* errString = [aError.userInfo valueForKey:NSLocalizedDescriptionKey];
//    [LSModalAlertView messageBox:nil message:errString];
//    
//    
//    if([LSModalAlertView confirmMessageBox:@"" message:@"登录失效，是否重新登录？" cancelButtonTitle:@"取消" otherButtonTitle:@"确定"]){
//         LoginViewController* targetViewController = [[[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil] autorelease];
//        
//        [self presentModalViewController:targetViewController animated:NO];
//    }
}


-(IBAction)updateLogoAction:(id)sender
{

    NSDictionary *company =  _myCompanyPE.rspData.arrCategory;
    NSString* logo = [company objectForKey:LSJSONKEY_logo];
    if(nil != logo && logo.length > 0){
                
        
        
        LSMyLogoViewController* targetViewController = [[LSMyLogoViewController alloc] initWithNibName:@"LSMyLogoViewController" bundle:nil];
        targetViewController.url = logo ;
        [self.navigationController pushViewController:targetViewController animated:YES];
        
    }else
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@""
                                      delegate:nil
                                      cancelButtonTitle:@"取消"
                                      destructiveButtonTitle:@"从相册获取"
                                      otherButtonTitles:@"拍照"
                                      ,nil
                                      ];
        //[actionSheet addButtonWithTitle:@"从相机获取图片"];
        actionSheet.delegate = self;
        [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
        [actionSheet release];
    }
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self photoLibraryAction];
            break;
        case 1:
            [self cameraAction];
            break;
        case 2:
            NSLog(@"click 2");
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark Toolbar Actions

- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{

    if (self.capturedImages.count > 0)
        [self.capturedImages removeAllObjects];
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        [self.overlayViewController setupImagePicker:sourceType];
        [self presentModalViewController:self.overlayViewController.imagePickerController animated:YES];
    }
}

- (void)photoLibraryAction
{   
	[self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)cameraAction
{
    [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
}


#pragma mark -
#pragma mark OverlayViewControllerDelegate

// as a delegate we are being told a picture was taken
- (void)didTakePicture:(UIImage *)picture
{
    [self.capturedImages addObject:picture];

    
    
}

// as a delegate we are told to finished with the camera
- (void)didFinishWithCamera
{
    [self dismissModalViewControllerAnimated:YES];
    
    if ([self.capturedImages count] > 0)
    {
        if ([self.capturedImages count] == 1)
        {
            if (_photoUploadPE == nil) {
                _photoUploadPE = [[LSPhotoUploadPE alloc]init];
                _photoUploadPE.delegate = self;
            }
            _photoUploadPE.isUploadLogo = true;
            _photoUploadPE.image =  [self.capturedImages objectAtIndex:0];
            [self startWaiting];
            [_photoUploadPE sendRequest];
            
        }
        
    }
}

-(void)refreshInfo
{
    [self.navigationController popToViewController:self animated:YES];
    
    [self startWaiting];
    _myCompanyPE.companyID = [_getCompanyIdPE.rspData.companyID intValue];

    _myCompanyPE.forceRefresh = TRUE;
    [_myCompanyPE sendRequest];
}
@end
