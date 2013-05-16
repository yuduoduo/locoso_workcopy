//
//  LSMyLogoViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSImagesViewController.h"
#import "OverlayViewController.h"
#import "LSPhotoUploadPE.h"
@interface LSMyLogoViewController : LSImagesViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,
OverlayViewControllerDelegate,LSBaseProtocolEngineDelegate>{
    OverlayViewController *overlayViewController;
    NSMutableArray *capturedImages;
    bool isUploadLogo;
    LSPhotoUploadPE* _photoUploadPE;
    NSString *url;
    IBOutlet    UIImageView *logoImage;
}
@property (nonatomic, retain) UIImageView *logoImage;
@property (nonatomic, retain) OverlayViewController *overlayViewController;
@property (nonatomic, retain) NSMutableArray *capturedImages;
@property (nonatomic, retain) NSString *url;
@end
