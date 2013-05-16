//
//  LSAddPhotoViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseViewController.h"
#import "OverlayViewController.h"
#import "LSPhotoUploadPE.h"
#import "LSAddPhotoPE.h"
@protocol LSMyPhotoAddDelegate <NSObject>
-(void)refreshPhotoList;
@end
@interface LSAddPhotoViewController : LSBaseViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,
OverlayViewControllerDelegate,UIScrollViewDelegate,LSBaseProtocolEngineDelegate>{
    
    UIImageView *imageView;

    
    OverlayViewController *overlayViewController; // the camera custom overlay view
    
    NSMutableArray *capturedImages; // the list of images captures from the camera (either 1 or multiple)

    NSInteger companyID;
    id <LSMyPhotoAddDelegate> delegate;
    
    IBOutlet UITextField *nameField;
    IBOutlet UITextView *contentField;
    NSInteger addOreditid;
    IBOutlet UIView *myPhotoAddView;
    
    UIScrollView *upDownScrollView;
    NSDictionary * data;
    LSPhotoUploadPE* _photoUploadPE;
    LSAddPhotoPE* _addPhotoPE;
}
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@property (nonatomic, retain) OverlayViewController *overlayViewController;

@property (nonatomic, retain) NSMutableArray *capturedImages;

@property(nonatomic, assign) id<LSMyPhotoAddDelegate> delegate;
@property (nonatomic, retain) UITextField *nameField;
@property (nonatomic, retain) UITextView *contentField;
@property (nonatomic, retain) UIView *myPhotoAddView;

@property (nonatomic, retain) UIScrollView *upDownScrollView;
@property (nonatomic, retain) NSDictionary * data;

@end
