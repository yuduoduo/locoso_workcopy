//
//  LSPhotoUploadPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSPhotoUploadPE.h"

#pragma mark - LSPhotoUploadPE (LSPrivate)
@interface LSPhotoUploadPE (LSPrivate)
- (void)handleImage;
@end

#pragma mark - LSPhotoUploadPE
@implementation LSPhotoUploadPE
@synthesize image = _image;
@synthesize rspData = _rspData;
@synthesize isUploadLogo = _isUploadLogo;
@synthesize handleImageFinished = _handleImageFinished;
@synthesize imageData = _imageData;
- (void)dealloc
{
    self.imageData = nil;
    self.image = nil;
    self.rspData = nil;
    [super dealloc];
}

- (ASIHTTPRequest*)request
{
    NSString* strURL = [commonManager getHostStr];
    if (_isUploadLogo) {
        strURL = [strURL stringByAppendingString:@"/upload?module=uploadlogo"];
    }else {
        strURL = [strURL stringByAppendingString:@"/upload?module=uploadphoto"];
    }
    
    self.handleImageFinished = NO;
    
    [NSThread detachNewThreadSelector:@selector(handleImage) toTarget:self withObject:nil];
    
    while (NO == [self isHandleImageFinished])
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }

    if (nil == _imageData)
    {
        NSLog(@"upload image faild. image data is nil.");
    }
    
    ASIFormDataRequest* request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:strURL]];
    request.requestMethod = @"POST";
    [request setPostValue:[commonManager ManageUploadPictureNew] forKey:@"subgson"];
    [request setData:_imageData withFileName:@"1111.jpg" andContentType:@"application/octet-stream; charset=utf-8" forKey:@"image"];
    self.imageData = nil;
    self.handleImageFinished = NO;
    return [request autorelease];
}

- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    id jsonValue = [aResponseString JSONValue];
    if (nil == jsonValue)
    {
        return nil;
    }
    
    NSMutableDictionary* jsonDic = (NSMutableDictionary*)jsonValue;
    if ([jsonDic isKindOfClass:[NSDictionary class]])
    {
                LSDataPhoto* category = [LSParseDataUtils parseUploadPhoto:jsonDic];
        
        
        
                LSUploadPhotoRspData* rspData = [[[LSUploadPhotoRspData alloc] init] autorelease];
                rspData.photoDic = category;
        return rspData;
    }
    return nil;
}
- (BOOL)handleResponseData:(LSBaseResponseData*)aNewData
{
    self.rspData = (LSUploadPhotoRspData*)aNewData;
    return [super handleResponseData:aNewData];
}
#pragma mark private methods
- (void)handleImage
{
    NSUInteger maxSize = 1024*1024;
    NSUInteger currentSize = 0;
    NSData *imagedata = UIImageJPEGRepresentation(_image, 1.0);
    currentSize = [imagedata length];
    if (currentSize > maxSize) {
        CGFloat compression = currentSize/maxSize;
        imagedata = UIImageJPEGRepresentation(_image, compression);
    }
    self.handleImageFinished = YES;
    self.imageData = imagedata;
}

@end
#pragma mark - LSUploadPhotoRspData
@implementation LSUploadPhotoRspData
@synthesize photoDic = _photoDic;
- (void)dealloc
{
    self.photoDic = nil;
    [super dealloc];
}

@end