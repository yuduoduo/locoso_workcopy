//
//  LSMyProductDetailViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyProductDetailViewController.h"


#import "NSStringTool.h"
#import "URLTranslateTool.h"
#import "CheckAndShowMessage.h"
#import "LSString.h"
#import "LSWebViewController.h"
#import "LSImageDetailViewController.h"

@interface LSMyProductDetailViewController ()

@end

@implementation LSMyProductDetailViewController
@synthesize imageView , overlayViewController, capturedImages;

@synthesize delegate;
@synthesize nameField,contentField;
@synthesize productDetailHeaderView;
@synthesize upDownScrollView;

@synthesize hintLable,data;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"产品详情";
    }
    return self;
}
-(void)addEditProductToServer
{
    
    if (addOreditid == 2) {
        if ([self.capturedImages count]) 
        {
//            [self.delegate editAProductToServer:nameField.text scontent:contentField.text productid: [[data valueForKey:@"producid"] intValue] image:[self.capturedImages objectAtIndex:0]];
            _photoUploadPE.image = [self.capturedImages objectAtIndex:0];
            
            [_photoUploadPE sendRequest];
        }
        else
        {

            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithFloat:data.producid],@"producid",
                                 data.content, @"content",
                                 data.productname, @"productname",
                                 nil];
            _editProductPE.dic = dic;
            [_editProductPE sendRequest];
        }
        
        
    }else{ 
        if ([self.capturedImages count]) 
        {
//            [self.delegate addAProductToServer:nameField.text scontent:contentField.text image:[self.capturedImages objectAtIndex:0]];
            _photoUploadPE.image = [self.capturedImages objectAtIndex:0];
            
            [_photoUploadPE sendRequest];
        }else
        {
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"test", @"catename", 
                                 data.content, @"content",
                                 data.productname, @"productname",
                                 [NSNumber numberWithFloat:0], @"view",
                                 [NSNumber numberWithFloat:0], @"price",
                                 [NSNumber numberWithFloat:0], @"siteid",
                                 [NSNumber numberWithFloat:0], @"producid",
                                 [NSNumber numberWithFloat:0], @"mediaid",
                                 [NSNumber numberWithFloat:0], @"discountprice",
                                 [NSNumber numberWithFloat:0], @"toppro",
                                 [NSNumber numberWithFloat:0], @"displayorder",
                                 [NSNumber numberWithFloat:1], @"state",nil];
            _addProductPE.dic = dic;
            [_addProductPE sendRequest];
        }
        
    }
}
-(void)doConfirm
{
    
    
    
    BOOL checkname =   [CheckAndShowMessage checkNullAndShowMsg:nameField.text msg:@"请输入产品名称"];
    if (checkname) {
        [LSModalAlertView messageBox:@"" message:@"请输入产品名称"];
        [nameField becomeFirstResponder];
        
        return;
    }
    [nameField resignFirstResponder];
    [contentField resignFirstResponder];
    [self startHUDWaiting:@"正在保存产品"];
    [self addEditProductToServer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setNavigationBarButtonItemWithTitleStytlePlain:LSString_save itemType:LSNavigationbarButtonItem_Right];

    //scroll
    upDownScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	upDownScrollView.backgroundColor = [UIColor whiteColor];
	upDownScrollView.delegate = self;
    upDownScrollView.showsVerticalScrollIndicator = YES;
    upDownScrollView.contentSize = CGSizeMake(320, 650);
    [self.view addSubview:upDownScrollView];
    
    if (productDetailHeaderView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"MyProductDetailView" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        
	}
    productDetailHeaderView.frame = CGRectMake(0,0,320, 300);
    [upDownScrollView addSubview:productDetailHeaderView];
    
    
    //image picker
    self.overlayViewController =
    [[[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:nil] autorelease];
    
    // as a delegate we will be notified when pictures are taken and when to dismiss the image picker
    self.overlayViewController.delegate = self;
    
    self.capturedImages = [NSMutableArray array];
    

    imageView.image = [UIImage imageNamed:@"yuanshi.png"];
    


    if (nil == _addProductPE)
    {
        _addProductPE = [[LSAddProductPE alloc] init];
        _addProductPE.delegate = self;
    }
    if (nil == _editProductPE)
    {
        _editProductPE = [[LSEditProductPE alloc] init];
        _editProductPE.delegate = self;
    }
    if (nil == _saveProductPE)
    {
        _saveProductPE = [[LSSaveProductPE alloc] init];
        _saveProductPE.delegate = self;
    }
    
    if (nil == _photoUploadPE)
    {
        _photoUploadPE = [[LSPhotoUploadPE alloc] init];
        _photoUploadPE.delegate = self;
    }
    isPopup = FALSE;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    upDownScrollView = nil;
    self.capturedImages = nil;
}
- (void)dealloc
{	
    [upDownScrollView release];
	[capturedImages release];

    [super dealloc];
}

- (void)navigationRightButtonItemClicked:(id)aSender
{
    [self doConfirm];
}

-(void)updateDetaiData
{

    {
        nameField.text = data.productname;
        contentField.text = [NSStringTool flattenHTML:data.content];
        if ([data.imageUrl length] > 0)
        {
            if (isPopup) {
                isPopup = FALSE;
            }else {
                [self addImage:imageView imageURL:[data.imageUrl stringByHandleImageURL:@"2"]];
            }
            
            hintLable.text = @"点击修改图片";
        }else {
            
            hintLable.text = @"点击上传图片";
            
        }
    }
}
- (void)viewDidAppear:(BOOL)animated
{

    [self updateDetaiData ];
    [imageView  setNeedsDisplay];
    [super viewDidAppear:animated];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(IBAction)addImageClick:(id)sender
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
    [self.capturedImages removeAllObjects];
    [self.capturedImages addObject:picture];
    
    [self.imageView setImage:picture];
    //    self.imageView = picture;
        [self.imageView setNeedsDisplay];
    isPopup =TRUE;
}

// as a delegate we are told to finished with the camera
- (void)didFinishWithCamera
{
    [self dismissModalViewControllerAnimated:YES];
    
    if ([self.capturedImages count] > 0)
    {
        if ([self.capturedImages count] == 1)
        {
            isPopup = TRUE;
            // we took a single shot
            [self.imageView setImage:[self.capturedImages objectAtIndex:0]];
        }

    }
}


-(void)setaddOreditid:(NSInteger)idd
{
    addOreditid = idd;
}

- (IBAction)backgroundClick:(id)sender
{	
	[nameField resignFirstResponder];
	[contentField resignFirstResponder];
	
}


- (IBAction)logoClick:(id)sender
{
    NSString *imagePath = data.imageUrl;
    if (![imagePath isEqualToString:@""] && imagePath != nil) {
       
        NSString* imageurl = [imagePath stringByHandleImageURLOriginal];
        LSImageDetailViewController* vc = [[LSImageDetailViewController alloc] initWithNibName:@"LSImageDetailViewController" bundle:nil];
        vc.imageURL = imageurl;
        [self.navigationController pushViewController:vc animated:YES];
        [vc release];
    }
}
-(void)setDataToDetail:(LSDataProduct*)dataFrome
{
    
   self.data = dataFrome;

}
#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    if (_photoUploadPE == aEngine) {
        if (nil != _photoUploadPE.rspData) {
            if (addOreditid == 2) {
                //edit
                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [NSNumber numberWithFloat:data.producid],@"producid",
                                     contentField.text, @"content",
                                     nameField.text, @"productname",
                                     _photoUploadPE.rspData.photoDic.filepath,@"image",
                                     nil];
                _editProductPE.dic = dic;
                [_editProductPE sendRequest];
            }else {
                //add
                LSDataPhoto *photo = _photoUploadPE.rspData.photoDic;
                
                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"test", @"catename", 
                                     contentField.text, @"content",
                                     nameField.text, @"productname",
                                     [NSNumber numberWithFloat:0], @"view",
                                     [NSNumber numberWithFloat:0], @"price",
                                     [NSNumber numberWithFloat:0], @"siteid",
                                     [NSNumber numberWithFloat:0], @"producid",
                                     [NSNumber numberWithFloat:0], @"mediaid",
                                     
                                     [NSNumber numberWithFloat:0], @"discountprice",
                                     [NSNumber numberWithFloat:0], @"toppro",
                                     [NSNumber numberWithFloat:0], @"displayorder",
                                     [NSNumber numberWithFloat:1], @"state",
                                     photo.filepath,@"image",nil];
                
                _addProductPE.dic = dic;
                [_addProductPE sendRequest];
            }
        }
        
        
    }
    else if (_addProductPE == aEngine) {
        
        [self.delegate refreshList];
        
        
        
    }else  if (_editProductPE == aEngine)
    {
        if (nil != _editProductPE.rspData)
        {
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary: _editProductPE.rspData.newsDic];
            [dic setValue:nameField.text forKey:@"productname"];
            [dic setValue:contentField.text forKey:@"content"];
            [dic setValue:_photoUploadPE.rspData.photoDic.filepath forKey:@"image"];
            _saveProductPE.dic = (NSDictionary*)dic;
            [_saveProductPE sendRequest];
        }
        
    }else  if (_saveProductPE == aEngine)
    {
        [self.delegate refreshList];
        
    }
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
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
    [self defaultDidProtocolEngineFailed:aError];
}
@end
