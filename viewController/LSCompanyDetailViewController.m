//
//  LSCompanyDetailViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyDetailViewController.h"
#import "LSWebViewController.h"

#import "MapAdressViewController.h"

#import "SizeOfControllerFont.h"
#import "UIImageTool.h"
#import "JsonResturnCheck.h"
#import "URLTranslateTool.h"
#import "UIImageExt.h"
#import <QuartzCore/QuartzCore.h>
#import "LSString.h"
#import "LSCompanyProductListViewController.h"
#import "LSCompanyPhotosListViewController.h"
#import "LSCompanyNewsListViewController.h"
#import "LSCompanyMessageListViewController.h"
#import "FileStoreManager.h"
#import "LSModalView.h"
#import "LSCompanyIntroduceViewController.h"
#import "LSImageDetailViewController.h"
#import "LSProductDetailViewController.h"
@interface LSCompanyDetailViewController ()

@end

@implementation LSCompanyDetailViewController
@synthesize myTableView,companyDetailHeaderView,companyDetailManageHeaderView,photoButton,certifyLabel,adressLabel,phoneLabel,msnNumber,companyName,popularNumber,mapButton,companyDetailButton,messageListButton,companyLogoImage,markImage,companyID;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"企业详情";
    }
    return self;
}

-(void)doCollection
{
    [self addCompanyIDToArray:_companyInfoPE.rspData.arrCategory.companyID name:@"collection"];
    [LSModalAlertView messageBox:@"" message:@"收藏成功"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (nil == _companyInfoPE)
    {
        _companyInfoPE = [[LSCompanyInfoPE alloc] init];
        _companyInfoPE.delegate = self;
    }
    if (nil == _productListPE)
    {
        _productListPE = [[LSCompanyProductListPE alloc] init];
        _productListPE.delegate = self;
    }
    
    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"收藏", @"收藏") style:UIBarButtonItemStylePlain target:self action:@selector(doCollection)];
    
    [self.navigationItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 
    
    // Do any additional setup after loading the view from its nib.

    //companyDetailManageHeaderView.center = CGPointMake(160, 400);
    
    [companyDetailButton setBackgroundImage:[UIImage imageNamed:@"dizhi_bg.png"]  forState:UIControlStateNormal];
    [companyDetailButton setBackgroundImage:[UIImage imageNamed:@"dizhi_bg2.png"]  forState:UIControlStateSelected];
    
    [messageListButton setBackgroundImage:[UIImage imageNamed:@"dizhi_bg.png"]  forState:UIControlStateNormal];
    [messageListButton setBackgroundImage:[UIImage imageNamed:@"dizhi_bg2.png"]  forState:UIControlStateSelected];
    
//    companyLogoImage.image = [UIImage imageNamed:@"yuanshi.png"];
//   markImage.image = [UIImage imageNamed:@"tu_bg01.png"];
    

}
-(void)loadCompontView{
    //scroll
    if (nil == upDownScrollView) {
        upDownScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
        upDownScrollView.backgroundColor = [UIColor whiteColor];
        //upDownScrollView.alwaysBounceVertical = YES;
        //upDownScrollView.bounces = YES;
        upDownScrollView.delegate = self;
        //upDownScrollView.pagingEnabled = YES;
        upDownScrollView.scrollEnabled = YES;
        upDownScrollView.showsVerticalScrollIndicator = YES;
        upDownScrollView.contentSize = CGSizeMake(320, 750);
    }
    
    [self.view addSubview:upDownScrollView];
    
    if (companyDetailHeaderView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"LSCompanyDetailHeaderView" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        companyLogoImage.image = LSImageByName(LSImage_icon_placeholder);
        [self.companyLogoImage setCornerAndBorderNormal];
        markImage.hidden = YES;
        
	}
    //    companyDetailHeaderView.backgroundColor = [UIColor redColor];
    [upDownScrollView addSubview:companyDetailHeaderView];
    //    upDownScrollView.backgroundColor = [UIColor grayColor];
    
    if (myTableView == nil) {
        myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, COMPANY_DETAIL_HEAD_VIEW_HEIGHT, 320, 330) style:UITableViewStylePlain];
        myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(0,320,1,1)];
        lineView.backgroundColor = LSCOLOR_GRAY_BOARD;
        myTableView.tableHeaderView = lineView;
        
        [lineView  release];
        [myTableView setDelegate:self];
        [myTableView setDataSource:self];
        myTableView.scrollEnabled = NO; 
    }
    
    [upDownScrollView addSubview:myTableView];
    
    
    if (companyDetailManageHeaderView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"LSCompanyDetailManageView" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        companyDetailManageHeaderView.frame = CGRectMake(0,610,320, 100);
        
	}
    [upDownScrollView addSubview:companyDetailManageHeaderView];
}
-(void)setDataToController
{
    LSDataCompanyDetail *detail = _companyInfoPE.rspData.arrCategory;
    
    companyName.text = detail.companyName;
    phoneLabel.text = detail.contactphone;
    adressLabel.text = detail.address;
    //    msnNumber.text = detail.companyName;
    //    popularNumber.text = detail.companyName;
    msnNumber.text = @"0";
    popularNumber.text = @"0";
    [self addImage:companyLogoImage imageURL:[URLTranslateTool OldUrlTranslateTo:detail.logo  idd:@"3"]];
}
- (void)dealloc {
	[companyDetailHeaderView release];
    [companyDetailManageHeaderView release];
	[photoButton release];
	[certifyLabel release];
	[adressLabel release];
	[phoneLabel release];
    [mapButton release];
    [upDownScrollView release];

    companyDetailHeaderView = nil;
    companyDetailManageHeaderView = nil;
    photoButton = nil;
	certifyLabel = nil;
    adressLabel = nil;
    phoneLabel = nil;
    mapButton = nil;
    upDownScrollView = nil;

    [ _companyInfoPE cancelRequest];
    [_companyInfoPE release];
    [ _productListPE cancelRequest];
    [_productListPE release];
	[super dealloc];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    companyDetailHeaderView = nil;
    companyDetailManageHeaderView = nil;
    photoButton = nil;
	certifyLabel = nil;
    adressLabel = nil;
    phoneLabel = nil;
    mapButton = nil;
    upDownScrollView = nil;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (nil == _companyInfoPE.rspData)
    {
        [self startWaiting];
        _companyInfoPE.dataid = companyID;
        [_companyInfoPE sendRequest];
    }
    else 
    {
        [self loadCompontView];
        [self setDataToController];
    }
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self addCompanyIDToArray:_companyInfoPE.rspData.arrCategory.companyID name:@"history"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_companyInfoPE cancelRequest];
    [_productListPE cancelRequest];
}

- (UIImage*)handleImageHook:(UIImage*)aSrcImage
{
    return [aSrcImage imageByScalingAndCroppingForSize:CGSizeMake(70, 70)];
}
#pragma mark -
#pragma mark click photo
- (IBAction)showPhoto {
    // Navigate to the recipe photo view controller to show a large photo for the recipe.

    
    LSDataCompanyDetail *detail = _companyInfoPE.rspData.arrCategory;
    NSString *imagePath = detail.logo;
    if (![imagePath isEqualToString:@""]) {

//        NSURL* url = [NSURL URLWithString:[imagePath stringByHandleImageURLOriginal]];
//        LSWebViewController* any = [[LSWebViewController alloc] initWithNibName:@"LSWebViewController" bundle:nil];
//        any.url = url;
//        [self.navigationController pushViewController:any animated:YES];
        
        NSString* imageurl = [imagePath stringByHandleImageURLOriginal];
        LSImageDetailViewController* vc = [[LSImageDetailViewController alloc] initWithNibName:@"LSImageDetailViewController" bundle:nil];
        vc.imageURL = imageurl;
        [self.navigationController pushViewController:vc animated:YES];
        [vc release];
    }
}
#pragma mark -
#pragma mark view map
- (IBAction)showMap {
    // Navigate to the recipe photo view controller to show a large photo for the recipe.
    LSDataCompanyDetail *detail = _companyInfoPE.rspData.arrCategory;

	MapAdressViewController *recipePhotoViewController = [[MapAdressViewController alloc] init];
    [recipePhotoViewController setMapLocation:detail.mapx y:detail.mapy];
    [recipePhotoViewController setAdress:detail.address];
	[self.navigationController pushViewController:recipePhotoViewController animated:YES];
	[recipePhotoViewController release];
}
#pragma mark -
#pragma mark product list
- (IBAction)productListAction {
    // Navigate to the recipe photo view controller to show a large photo for the recipe.
	LSCompanyProductListViewController *recipePhotoViewController = [[LSCompanyProductListViewController alloc] init];
    
    recipePhotoViewController.companyID = companyID;
	[self.navigationController pushViewController:recipePhotoViewController animated:YES];
	[recipePhotoViewController release];
}
#pragma mark -
#pragma mark news list
- (IBAction)newsListAction {
    // Navigate to the recipe photo view controller to show a large photo for the recipe.
	LSCompanyNewsListViewController *recipePhotoViewController = [[LSCompanyNewsListViewController alloc] init];
    recipePhotoViewController.companyID = companyID;

	[self.navigationController pushViewController:recipePhotoViewController animated:YES];
	[recipePhotoViewController release];
}
#pragma mark -
#pragma mark photo list
- (IBAction)photoListAction {
    // Navigate to the recipe photo view controller to show a large photo for the recipe.
	LSCompanyPhotosListViewController *recipePhotoViewController = [[LSCompanyPhotosListViewController alloc] init];
    recipePhotoViewController.companyID = companyID;
    recipePhotoViewController.canEdit = NO;
	[self.navigationController pushViewController:recipePhotoViewController animated:YES];
	[recipePhotoViewController release];
}
#pragma mark -
#pragma mark company detail
- (IBAction)companyDetailAction {
//	CompanyIntroduceViewController *recipePhotoViewController = [[CompanyIntroduceViewController alloc] init];
//    recipePhotoViewController.infoStr = _companyInfoPE.rspData.arrCategory.info;
//	[self.navigationController pushViewController:recipePhotoViewController animated:YES];
//	[recipePhotoViewController release];
    
    LSCompanyIntroduceViewController* vc = [[LSCompanyIntroduceViewController alloc] initWithNibName:@"LSCompanyIntroduceViewController" bundle:nil];
    vc.company = _companyInfoPE.rspData.arrCategory;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}
#pragma mark -
#pragma mark message list
- (IBAction)messageListAction {
    // Navigate to the recipe photo view controller to show a large photo for the recipe.
	LSCompanyMessageListViewController *recipePhotoViewController = [[LSCompanyMessageListViewController alloc] init];
    recipePhotoViewController.companyID = companyID;

	[self.navigationController pushViewController:recipePhotoViewController animated:YES];
	[recipePhotoViewController release];
}


- (IBAction)phoneCallAction {
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@""
                                  delegate:nil
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:[NSString stringWithFormat:@"拨打%@", phoneLabel.text]
                                  otherButtonTitles:nil
                                  ,nil
                                  ];
    //[actionSheet addButtonWithTitle:@"从相机获取图片"];
    actionSheet.delegate = self;
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    [actionSheet release];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            NSString *phoneNumber = [[[NSString alloc] initWithFormat:@"tel://%@", phoneLabel.text] autorelease];
            phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
        }
            break;
            
        default:
            break;
    }
}
-(void)offsetCompanyDetailManageView
{
    int count = [_productListPE.rspData.arrContent count];
    
    
    switch (count) {
        case 0:
            companyDetailManageHeaderView.frame = CGRectMake(0,COMPANY_DETAIL_HEAD_VIEW_HEIGHT,320, 100);
            upDownScrollView.contentSize = CGSizeMake(320, 420);
            break;
        case 1:
            companyDetailManageHeaderView.frame = CGRectMake(0,COMPANY_DETAIL_HEAD_VIEW_HEIGHT+COMPANYDETAILVIEWCONTROLLER_LIST_HEIGHT+5,320, 100);
            upDownScrollView.contentSize = CGSizeMake(320, 420+COMPANYDETAILVIEWCONTROLLER_LIST_HEIGHT);
            break;
        case 2:
            companyDetailManageHeaderView.frame = CGRectMake(0,COMPANY_DETAIL_HEAD_VIEW_HEIGHT+COMPANYDETAILVIEWCONTROLLER_LIST_HEIGHT*2+5,320, 100);
            upDownScrollView.contentSize = CGSizeMake(320, 420+COMPANYDETAILVIEWCONTROLLER_LIST_HEIGHT*2);
            break;
        case 3:
            companyDetailManageHeaderView.frame = CGRectMake(0,COMPANY_DETAIL_HEAD_VIEW_HEIGHT+COMPANYDETAILVIEWCONTROLLER_LIST_HEIGHT*3+5,320, 100);
            upDownScrollView.contentSize = CGSizeMake(320, 420+COMPANYDETAILVIEWCONTROLLER_LIST_HEIGHT*3);
            break;
        default:
            companyDetailManageHeaderView.frame = CGRectMake(0,COMPANY_DETAIL_HEAD_VIEW_HEIGHT+COMPANYDETAILVIEWCONTROLLER_LIST_HEIGHT*3+5,320, 100);
            upDownScrollView.contentSize = CGSizeMake(320, 420+COMPANYDETAILVIEWCONTROLLER_LIST_HEIGHT*3);
            break;
    }
    
}
#pragma mark -
#pragma mark UITableView Delegate/Datasource

// Determines the number of sections within this table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // This displays a single list of recipes, so one section will do.
	return 1; 
}

// Determines the number of rows for the argument section number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Since this sample has only one section, assume we were passed section = 1, and return the number of recipes
    [self offsetCompanyDetailManageView];
    int count = [_productListPE.rspData.arrContent count];
    if (count >= 3) {
        return 3;
    }else {
        return count;
    }
	return 0;
    //return 3;
}

// Create or Access and return appropriate cell identified by the argument indexPath (i.e. Section number and Row number combination)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *kCellIdentifier = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (!cell)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier] autorelease];
        
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.backgroundColor = [UIColor clearColor];
		cell.textLabel.opaque = NO;
		cell.textLabel.textColor = [UIColor blackColor];
		cell.textLabel.highlightedTextColor = [UIColor whiteColor];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:COMPANYDETAILVIEWCONTROLLER_LIST_HEAD_SIZE];
		
		cell.detailTextLabel.backgroundColor = [UIColor clearColor];
		cell.detailTextLabel.opaque = NO;
		cell.detailTextLabel.textColor = [UIColor grayColor];
		cell.detailTextLabel.highlightedTextColor = [UIColor whiteColor];
		cell.detailTextLabel.font = [UIFont systemFontOfSize:COMPANYDETAILVIEWCONTROLLER_LIST_DETAIL_SIZE];
        
        cell.imageView.image = LSImageByName(LSImage_icon_placeholder);
        CALayer* layer = cell.imageView.layer;
        layer.cornerRadius = 5.0f;
        layer.borderColor = LSCOLOR_999999.CGColor;
        layer.borderWidth = 1;
    }

    
    
    LSDataProduct* product = [_productListPE.rspData.arrContent objectAtIndex:indexPath.row];
    cell.textLabel.text = product.productname;
    
    if ([product.imageUrl length] > 0)
    {
        [self addImage:cell.imageView imageURL:[product.imageUrl stringByHandleImageURL]];
    }
	return cell;
}
#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    LSDataProduct* product = [_productListPE.rspData.arrContent objectAtIndex:indexPath.row];
    NSString* imageurl = [product.imageUrl stringByHandleImageURLOriginal];
    LSProductDetailViewController* targetController = [[[LSProductDetailViewController alloc] initWithNibName:@"LSProductDetailViewController" bundle:nil] autorelease];
    targetController.photoUrl = imageurl;
    targetController.productName = product.productname;
    targetController.productInfo = product.content;
    [self.navigationController pushViewController:targetController animated:YES];}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return COMPANYDETAILVIEWCONTROLLER_LIST_HEIGHT;
}

-(void)setProductDataToList
{
    [myTableView reloadData];

}
#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    
    
    if (_companyInfoPE == aEngine) {
        [self loadCompontView];
        [self setDataToController];
        
        
        if (nil == _productListPE.rspData)
        {
            _productListPE.companyID = companyID;
            
            [_productListPE sendRequest];
        }
        else 
        {
            [self setProductDataToList];
        }
    }else  if (_productListPE == aEngine)
    {
        [self setProductDataToList];
    }
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
    [self stopWaiting];
    NSLog(@"%@ didProtocolEngineFailed",[[self class] description]);
}

-(void)addCompanyIDToArray:(NSUInteger)dataID name:(NSString*)sname
{
    LSDataCompanyDetail *detail = _companyInfoPE.rspData.arrCategory;
    
    if (detail.companyID == 0) {
        return;
    }
    
    NSString* controllerClassName = NSStringFromClass([self class]);
    controllerClassName = [controllerClassName stringByAppendingFormat:@"%@",sname];
    controllerClassName = [controllerClassName stringByAppendingString:@".rtf"];
    
    NSArray *tempdata = [FileStoreManager ReadDataFromFile:controllerClassName];
    for (NSMutableDictionary * member in tempdata) {
        NSLog(@"id1 = %d id2 = %d",dataID,[[member objectForKey:@"companyid"] unsignedIntValue]);
        if([[member objectForKey:@"companyid"] unsignedIntValue] == dataID)
            return;
    }
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:tempdata];
    
    
    [newArray addObject:
     [NSMutableDictionary dictionaryWithObjectsAndKeys:
      [NSNumber numberWithInt:detail.companyID], @"companyid",
      detail.companyName!=nil?detail.companyName:[NSNull null], @"companyname",
      detail.address!=nil?detail.address:[NSNull null], @"address",
      detail.logo != nil ? detail.logo:[NSNull null] ,@"logo",
      nil]
     ];
    
    [self saveCompanyIDArrayDataToFile:newArray name:sname];

    
}
-(void)saveCompanyIDArrayDataToFile:(NSArray*)savedata name:(NSString*)sname
{
    NSString* controllerClassName = NSStringFromClass([self class]);
    controllerClassName = [controllerClassName stringByAppendingFormat:@"%@",sname];
    controllerClassName = [controllerClassName stringByAppendingString:@".rtf"];
    
    [FileStoreManager SaveDataToFile:savedata fileName:controllerClassName];
}
@end
