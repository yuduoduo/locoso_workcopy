//
//  LSAddPhotoViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSAddPhotoViewController.h"

@interface LSAddPhotoViewController ()

@end

@implementation LSAddPhotoViewController
@synthesize imageView,overlayViewController,capturedImages,delegate,nameField,contentField,myPhotoAddView,upDownScrollView,data;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"图片详情";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"保存", @"保存") style:UIBarButtonItemStylePlain target:self action:@selector(doConfirm)];
    [self.navigationItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 
    
    
    //scroll
    if (nil == upDownScrollView) {
        upDownScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
        upDownScrollView.backgroundColor = [UIColor whiteColor];
        //	upDownScrollView.alwaysBounceVertical = YES;
        //	upDownScrollView.bounces = YES;
        upDownScrollView.delegate = self;
        //    upDownScrollView.pagingEnabled = YES;
        upDownScrollView.scrollEnabled = YES;
        upDownScrollView.showsVerticalScrollIndicator = YES;
        upDownScrollView.contentSize = CGSizeMake(320, 550);
    }
    
    [self.view addSubview:upDownScrollView];
    
    if (myPhotoAddView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"MyPhotoAddView" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        
	}
    myPhotoAddView.frame = CGRectMake(0,0,320, 300);
    [upDownScrollView addSubview:myPhotoAddView];
    
    //image picker
    self.overlayViewController =
    [[[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:nil] autorelease];
    
    // as a delegate we will be notified when pictures are taken and when to dismiss the image picker
    self.overlayViewController.delegate = self;
    
    self.capturedImages = [NSMutableArray array];
    imageView.image = [UIImage imageNamed:@"yuanshi.png"];

    if (nil == _photoUploadPE) {
        _photoUploadPE = [[LSPhotoUploadPE alloc] init];
        _photoUploadPE.delegate = self;
    }

    if (nil == _addPhotoPE) {
        _addPhotoPE = [[LSAddPhotoPE alloc]init];
        _addPhotoPE.delegate = self;
    }
}
-(void)doConfirm
{
    [nameField resignFirstResponder];
    [contentField resignFirstResponder];
    [self startHUDWaiting:@"图片上传中，请等待。"];
    _photoUploadPE.delegate = self;
    _photoUploadPE.image = imageView.image;
    [_photoUploadPE sendRequest];
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.capturedImages = nil;
    upDownScrollView = nil;
    _photoUploadPE = nil;
}
- (void)dealloc
{	
	
	[capturedImages release];
    [upDownScrollView release];
    [_photoUploadPE release];
    _photoUploadPE = nil;
    [super dealloc];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_photoUploadPE cancelRequest];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)setDataToDetail:(NSDictionary*)dataFrome
{
    self.data = [NSDictionary dictionaryWithDictionary:dataFrome];
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
            // we took a single shot
            [self.imageView setImage:[self.capturedImages objectAtIndex:0]];
        }

    }
}
- (IBAction)backgroundClick:(id)sender
{	
	[nameField resignFirstResponder];
	[contentField resignFirstResponder];

}

#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    
    if (_photoUploadPE == aEngine) {
        
        //add
        LSDataPhoto *photo = _photoUploadPE.rspData.photoDic;
        
        NSString *imageName = nameField.text;
        if ([imageName isEqualToString:@""]) {
            
            NSDate *_date = [NSDate date];
            imageName = [NSString stringWithFormat:@"%@",_date];
            imageName = [imageName substringToIndex:18];
        }
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"test", @"catename", 
                             contentField.text, @"content",
                             imageName,@"medianame",
                             imageName, @"productname",
                             @"png",@"filetype",
                             [NSNumber numberWithFloat:0], @"view",
                             [NSNumber numberWithFloat:0], @"price",
                             [NSNumber numberWithFloat:0], @"siteid",
                             [NSNumber numberWithFloat:0], @"producid",
                             [NSNumber numberWithFloat:0], @"mediaid",
                             
                             [NSNumber numberWithFloat:0], @"discountprice",
                             [NSNumber numberWithFloat:0], @"toppro",
                             [NSNumber numberWithFloat:0], @"displayorder",
                             [NSNumber numberWithFloat:1], @"state",
                             photo.filepath,@"filepath",nil];
        
        _addPhotoPE.dic = dic;
        [_addPhotoPE sendRequest];
    }else if(_addPhotoPE == aEngine)
    {
        [self stopWaiting];
        [self.delegate refreshPhotoList];
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

@end
