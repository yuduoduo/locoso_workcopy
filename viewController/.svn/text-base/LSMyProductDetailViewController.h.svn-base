//
//  LSMyProductDetailViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSImagesViewController.h"
#import "OverlayViewController.h"
#import "LSEditProductPE.h"
#import "LSAddProductPE.h"
#import "LSSaveProductPE.h"
#import "LSPhotoUploadPE.h"

@protocol LSMyProductDetailDelegate <NSObject>

-(void)refreshList;

@end

@interface LSMyProductDetailViewController : LSImagesViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,
OverlayViewControllerDelegate,UIScrollViewDelegate,LSBaseProtocolEngineDelegate>{
    UIImageView *imageView;
    //UIToolbar *myToolbar;
    
    OverlayViewController *overlayViewController; // the camera custom overlay view
    
    NSMutableArray *capturedImages; // the list of images captures from the camera (either 1 or multiple)

    id <LSMyProductDetailDelegate> delegate;
    
    IBOutlet UITextField *nameField;
    IBOutlet UITextView *contentField;

    NSInteger addOreditid;
    //scroll
    UIScrollView *upDownScrollView;
    UIView *productDetailHeaderView;

    IBOutlet   UILabel *hintLable;

    LSDataProduct *data;
    LSEditProductPE*  _editProductPE;
    LSAddProductPE* _addProductPE;
    LSSaveProductPE* _saveProductPE;
    LSPhotoUploadPE* _photoUploadPE;
    BOOL isPopup;
}
@property (nonatomic, retain) LSDataProduct *data;
@property (nonatomic, retain) UILabel *hintLable;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@property (nonatomic, retain) OverlayViewController *overlayViewController;

@property (nonatomic, retain) NSMutableArray *capturedImages;

@property(nonatomic, assign) id<LSMyProductDetailDelegate> delegate;
@property (nonatomic, retain) UITextField *nameField;
@property (nonatomic, retain) UITextView *contentField;

@property (nonatomic, retain) IBOutlet UIView *productDetailHeaderView;
@property (nonatomic, retain) UIScrollView *upDownScrollView;

-(void)setDataToDetail:(LSDataProduct*)dataFrome;
-(void)setaddOreditid:(NSInteger)idd;
@end
