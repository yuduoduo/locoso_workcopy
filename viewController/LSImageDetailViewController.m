//
//  LSImageDetailViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-4-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSImageDetailViewController.h"
#import "LSZoomImageView.h"

@interface LSImageDetailViewController ()

@end

@implementation LSImageDetailViewController
@synthesize imageURL = _imageURL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = LSString_viewimage;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self startWaiting];
    [self addImage:_imageURL useCache:YES];
}

- (void)dealloc
{
    [_imageView release];
    _imageView = nil;
    self.imageURL = nil;
    [super dealloc];
}

#pragma mark LSHTTPImageKitDelegate
- (void)didImageFinished:(LSHTTPImageKit*)aKit imageURL:(NSString*)aImageURL image:(UIImage*)aImage
{
    [self stopWaiting];
    
    if (nil == _imageView)
    {
        _imageView = [[LSZoomImageView alloc] initWithImage:aImage];
        _imageView.center = CGPointMake(self.view.bounds.size.width/2,self.view.bounds.size.height/2);
        _imageView.allowRotate = NO;
        [_imageView setCornerAndBorderSmall];
        _imageView.userInteractionEnabled = YES;
        _imageView.backgroundColor = LSCOLOR_FEFDED;
        [self.view addSubview:_imageView];
    }
}

- (void)didImageFailed:(LSHTTPImageKit*)aKit imageURL:(NSString*)aImageURL
{
    [self stopWaiting];
    [super didImageFailed:aKit imageURL:aImageURL];
}
@end
