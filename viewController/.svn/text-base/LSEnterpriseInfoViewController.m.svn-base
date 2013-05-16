//
//  LSEnterpriseInfoViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSEnterpriseInfoViewController.h"
#import "CheckAndShowMessage.h"
#import "LSParseDataUtils.h"
#import "LSSwitchCityViewController.h"
#import "LSCategoryListViewController.h"

@interface LSEnterpriseInfoViewController ()

@end

@implementation LSEnterpriseInfoViewController
@synthesize modifyDic;
@synthesize viewOne,viewTwo,upDownScrollView;
@synthesize companyNameField,companyPhoneField,companyAdressField,contactCallField,contactPhoneField,contactEmailField,contactWebField,contactNameField;
@synthesize cityLable,areaLable,companyID = _companyID,enterpriseData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"企业资料";
    }
    return self;
}
-(void)loadCompontView
{
    //scroll
    if (nil == upDownScrollView) {
        upDownScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
        upDownScrollView.backgroundColor = [UIColor whiteColor];
        //	upDownScrollView.alwaysBounceVertical = YES;
        //	upDownScrollView.bounces = YES;
        upDownScrollView.delegate = self;
        //    upDownScrollView.pagingEnabled = YES;
        //    upDownScrollView.scrollEnabled = YES;
        upDownScrollView.showsVerticalScrollIndicator = YES;
        upDownScrollView.contentSize = CGSizeMake(320, 850);
    }
    
    [self.view addSubview:upDownScrollView];
    
    if (viewOne == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"LSEnterpriseViewOne" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        
	}
    viewOne.frame = CGRectMake(0,0,320, 280);
    
    [upDownScrollView addSubview:viewOne];
    if (viewTwo == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"LSEnterpriseViewTwo" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        
	}
    viewTwo.frame = CGRectMake(0,280,320, 280);
    [upDownScrollView addSubview:viewTwo];

    if (nil == modifyDic) {

        
        modifyDic = [[NSMutableDictionary alloc]init];
    }
    
}
-(void)doBack: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES]; 
}
-(BOOL)checkNotFill
{
    if (companyNameField.text != nil && companyPhoneField.text != nil && companyAdressField.text != nil) {
        return true;
    }
    return false;
}
-(void)doConfirm: (id) sender
{
    BOOL checkcontent ;
    NSString *checkfield  = nil;
    
    checkfield = companyNameField.text;
    checkcontent =   [CheckAndShowMessage checkNullAndShowMsg:checkfield msg:@"请输入名称"];
    if (checkcontent) {
        [companyNameField becomeFirstResponder];
        return;
    }
    
    checkfield = companyPhoneField.text;
    checkcontent =   [CheckAndShowMessage checkNullAndShowMsg:checkfield msg:@"请输入电话"];
    if (checkcontent) {
        [companyPhoneField becomeFirstResponder];
        return;
    }
    
    checkfield = companyAdressField.text;
    checkcontent =   [CheckAndShowMessage checkNullAndShowMsg:checkfield msg:@"请输入地址"];
    if (checkcontent) {
        [companyAdressField becomeFirstResponder];
        return;
    }
    
    checkfield = cityLable.text;
    checkcontent =   [CheckAndShowMessage checkNullAndShowMsg:checkfield msg:@"请选择城市"];
    if (checkcontent) {
        
        return;
    }
    
    checkfield = areaLable.text;
    checkcontent =   [CheckAndShowMessage checkNullAndShowMsg:checkfield msg:@"请选择行业"];
    if (checkcontent) {
        
        return;
    }
    itype = 3;
   
    [self startHUDWaiting:@"信息保存中，请等待。"];
//    NSMutableDictionary *infodic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                         [NSNumber numberWithInt:_companyID], @"companyid", 
//                         companyNameField.text,@"companyname",
//                         companyAdressField.text, @"address",
//                         @"tre", @"province",
//                         cityLable.text, @"city",
//                         @"ghj", @"area",
//                         companyPhoneField.text, @"telephone",
//                         areaLable.text,@"catename",
//                         contactNameField.text,@"contactpeople",
//                         contactCallField.text,@"contactphone",
//                         contactPhoneField.text,@"mobilephone",
//                         contactEmailField.text,@"email",
//                         contactWebField.text,@"website",
//                         nil];
    NSMutableDictionary *infodic = [[[NSMutableDictionary alloc] initWithDictionary:_loadEnterpriseInfoPE.rspData.arrCategory] autorelease];
    
    [infodic setValue:companyNameField.text forKey:@"companyname"];
    [infodic setValue:companyAdressField.text forKey:@"address"];
    [infodic setValue:cityLable.text forKey:@"city"];
    [infodic setValue:companyPhoneField.text forKey:@"telephone"];
    [infodic setValue:areaLable.text forKey:@"catename"];
    [infodic setValue:contactNameField.text forKey:@"contactpeople"];
    [infodic setValue:contactCallField.text forKey:@"contactphone"];
    [infodic setValue:contactPhoneField.text forKey:@"mobilephone"];
    [infodic setValue:contactEmailField.text forKey:@"email"];
    [infodic setValue:contactWebField.text forKey:@"website"];
    [infodic setValue:enterpriseData.logo forKey:@"logo"];
    
    _saveEnterpriseInfoPE.dic = infodic;
    [_saveEnterpriseInfoPE sendRequest];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"保存", @"保存") style:UIBarButtonItemStylePlain target:self action:@selector(doConfirm:)];
    
    [self.navigationItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 
    
    if (nil == _loadEnterpriseInfoPE) {
        _loadEnterpriseInfoPE = [[LSLoadEnterpriseInfoPE alloc]init];
        _loadEnterpriseInfoPE.delegate = self;
    }
    if (nil == _saveEnterpriseInfoPE) {
        _saveEnterpriseInfoPE = [[LSSaveEnterpriseInfoPE alloc]init];
        _saveEnterpriseInfoPE.delegate = self;
    }
   
}
-(void)viewWillAppear:(BOOL)animated
{
    if (nil == _loadEnterpriseInfoPE.rspData) {
        [self startWaiting];
        _loadEnterpriseInfoPE.companyID = _companyID;
        [_loadEnterpriseInfoPE sendRequest];
    }else {
        [self loadCompontView];
        if (fromMain){
             [self addDataToController];
        }
         else {
             [self LoadDataFromTemp];
         }
        [self stopWaiting];
    }
    
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_loadEnterpriseInfoPE cancelRequest];
    
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [_loadEnterpriseInfoPE release];
    _loadEnterpriseInfoPE = nil;
    [_saveEnterpriseInfoPE release];
    _saveEnterpriseInfoPE = nil;
    
    [super dealloc];
}
-(void)LoadDataFromTemp
{
    
    
    if([modifyDic count]  != 0)
    {
        cityLable.text = [modifyDic objectForKey:@"city"];
        areaLable.text = [modifyDic objectForKey:@"catename"];
        
        companyNameField.text = [modifyDic objectForKey:@"companyname"];
        companyPhoneField.text = [modifyDic objectForKey:@"telephone"];
        companyAdressField.text = [modifyDic objectForKey:@"address"];
        
        contactCallField.text = [modifyDic objectForKey:@"contactphone"];
        contactPhoneField.text = [modifyDic objectForKey:@"mobilephone"];
        contactEmailField.text = [modifyDic objectForKey:@"email"];
        contactWebField.text = [modifyDic objectForKey:@"website"];
        contactNameField.text = [modifyDic objectForKey:@"contactpeople"];
    }else
    {
        [self addDataToController];
    }
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)addDataToController
{
    companyNameField.text = enterpriseData.companyname;
    companyPhoneField.text = enterpriseData.telephone;
    companyAdressField.text = enterpriseData.address;
    contactCallField.text = enterpriseData.contactphone;
    contactPhoneField.text = enterpriseData.mobilephone;
    contactEmailField.text = enterpriseData.email;
    contactWebField.text = enterpriseData.website;
    contactNameField.text = enterpriseData.contactpeople;
    cityLable.text = enterpriseData.city;
    areaLable.text = enterpriseData.catename;
    
}

#pragma mark LSSelectDistrictProtocol LSSelectIndustryProtocol
- (void)didSelectDistrict:(LSDataCity *)aCity
{
    cityLable.text = aCity.shortname;
    [modifyDic setValue:aCity.shortname forKey:@"city"];
    [self.navigationController popToViewController:self animated:YES]; 
}

- (void)didSelectIndustry:(LSDataCategory *)aCategory
{
    areaLable.text = aCategory.name;
    [modifyDic setValue:aCategory.name forKey:@"catename"];
    [self.navigationController popToViewController:self animated:YES];
}

#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    if (_loadEnterpriseInfoPE == aEngine) {
        NSDictionary *temp = _loadEnterpriseInfoPE.rspData.arrCategory;
        LSDataEnterprise* category = [LSParseDataUtils parseEnterprise:temp];
        self.enterpriseData = category;
        
        [self loadCompontView];
        [self addDataToController];
        [self stopWaiting];
    }else  if (_saveEnterpriseInfoPE == aEngine)
    {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

//- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
//{
//    [self stopWaiting];
//    NSLog(@"%@ didProtocolEngineFailed",[[self class] description]);
//    UIAlertView *errorView;
//    errorView = [[UIAlertView alloc] 
//                 initWithTitle: @"" 
//                 message: [aError description] 
//                 delegate: self 
//                 cancelButtonTitle: @"确定" otherButtonTitles: nil]; 
//    [errorView show];
//    [errorView autorelease];
//}
-(void)setIsFromMain
{
    fromMain = true;
}
-(void)saveCurrentData
{
    
    [modifyDic setValue:cityLable.text forKey:@"city"];
    [modifyDic setValue:areaLable.text forKey:@"catename"];
    
    [modifyDic setValue:companyNameField.text forKey:@"companyname"];
    [modifyDic setValue:companyPhoneField.text forKey:@"telephone"];
    [modifyDic setValue:companyAdressField.text forKey:@"address"];
    
    [modifyDic setValue:contactCallField.text forKey:@"contactphone"];
    [modifyDic setValue:contactPhoneField.text forKey:@"mobilephone"];
    [modifyDic setValue:contactEmailField.text forKey:@"email"];
    [modifyDic setValue:contactWebField.text forKey:@"website"];
    [modifyDic setValue:contactNameField.text forKey:@"contactpeople"];
}

- (IBAction)selectIndustryClick:(id)sender
{
    [self saveCurrentData];
    fromMain = false;
    
    LSCategoryListViewController* vc = [[LSCategoryListViewController alloc] initWithNibName:@"LSCategoryListViewController" bundle:nil];
    vc.selectDelegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (IBAction)selectAreaClick:(id)sender
{
    [self saveCurrentData];
    fromMain = false;

    LSSwitchCityViewController* vc = [[LSSwitchCityViewController alloc] initWithNibName:@"LSSwitchCityViewController" bundle:nil];
    vc.selectDelegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (IBAction)backgroundClick:(id)sender
{
    [companyNameField resignFirstResponder];
    [companyPhoneField resignFirstResponder];
    [companyAdressField resignFirstResponder];
    
}  
- (IBAction)background2Click:(id)sender
{
    [contactCallField resignFirstResponder];
    [contactPhoneField resignFirstResponder];
    [contactEmailField resignFirstResponder];
    [contactWebField resignFirstResponder];
    [contactNameField resignFirstResponder];
    
} 
@end
