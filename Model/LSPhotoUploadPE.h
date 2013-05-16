//
//  LSPhotoUploadPE.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSPhotoOperationPE.h"
#import "LSData.h"
@class LSUploadPhotoRspData;
@interface LSPhotoUploadPE : LSPhotoOperationPE
{
    UIImage* _image;
    LSUploadPhotoRspData* _rspData;
    BOOL _isUploadLogo;
    BOOL _handleImageFinished;
    NSData* _imageData;
}
@property (nonatomic, retain) UIImage* image;
@property (nonatomic, retain) LSUploadPhotoRspData* rspData;
@property (nonatomic) BOOL isUploadLogo;
@property (getter = isHandleImageFinished)BOOL handleImageFinished;
@property (retain) NSData* imageData;
@end
@interface LSUploadPhotoRspData : LSBaseResponseData
{
    LSDataPhoto* _photoDic;
}
@property (nonatomic, retain) LSDataPhoto* photoDic;
@end