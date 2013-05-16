//
//  LSMyLogoViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyLogoViewController.h"
#import "LSString.h"
#import "LSWebViewController.h"
#import "LSImageDetailViewController.h"

@interface LSMyLogoViewController ()

@end

@implementation LSMyLogoViewController

@synthesize overlayViewController,capturedImages,url,logoImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"企业形象";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *someBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"修改", @"修改") style:UIBarButtonItemStylePlain target:self action:@selector(doUploadNewImage)];
    
    [self.navigationItem setRightBarButtonItem:someBarButtonItem]; 
    [someBarButtonItem release]; 
    
    //image picker
    self.overlayViewController =
    [[[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:nil] autorelease];
    
    // as a delegate we will be notified when pictures are taken and when to dismiss the image picker
    self.overlayViewController.delegate = self;
    
    capturedImages = [[NSMutableArray alloc]init];
    isUploadLogo = false;
    if (_photoUploadPE == nil) {
        _photoUploadPE = [[LSPhotoUploadPE alloc]init];
        _photoUploadPE.delegate = self;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    capturedImages = nil;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self addImage:logoImage imageURL:[url stringByHandleImageURL:LSImageURLFilter_image] ];
}
- (void)dealloc {
    
    
    [capturedImages release];
    capturedImages = nil;
	[super dealloc];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)doUploadNewImage
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
    
    
}
-(void)startUploadImage
{
    
    [self.view setNeedsDisplay];
    _photoUploadPE.isUploadLogo = true;
    _photoUploadPE.image =  [self.capturedImages objectAtIndex:0];
    [_photoUploadPE sendRequest];
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
            [self startHUDWaiting:@"图片上传中，请等待。"];
            [NSThread detachNewThreadSelector:@selector(startUploadImage) toTarget:self withObject:nil];
            
            
        }
        
    }
}
#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    if (aEngine == _photoUploadPE) {
        if (nil != _photoUploadPE.rspData) {
            LSDataPhoto *photo = _photoUploadPE.rspData.photoDic;
            
            if (photo.filepath.length > 0) {
                [self addImage:logoImage imageURL:[photo.filepath stringByHandleImageURL:LSImageURLFilter_Cell] useCache:NO];
                [LSModalAlertView messageBox:@"" message:@"图片上传成功"];
            }
        }
    }
    
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
    [self stopWaiting];
    NSLog(@"%@ didProtocolEngineFailed",[[self class] description]);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([touch view] != logoImage) {
        
//        NSURL* nsurl = [NSURL URLWithString:[self.url stringByHandleImageURL:LSImageURLFilter_Original]];
//        LSWebViewController* any = [[LSWebViewController alloc] initWithNibName:@"LSWebViewController" bundle:nil];
//        any.url = nsurl;
//        [self.navigationController pushViewController:any animated:YES];
        
        NSString* imageurl = [self.url stringByHandleImageURLOriginal];
        LSImageDetailViewController* vc = [[LSImageDetailViewController alloc] initWithNibName:@"LSImageDetailViewController" bundle:nil];
        vc.imageURL = imageurl;
        [self.navigationController pushViewController:vc animated:YES];
        [vc release];
    }
}
@end
