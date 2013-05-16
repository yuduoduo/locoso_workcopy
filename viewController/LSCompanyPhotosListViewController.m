//
//  LSCompanyPhotosListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyPhotosListViewController.h"
#import "LSCompanyPhotosListPE.h"
#import "LSAddPhotoViewController.h"
@implementation LSCompanyPhotosListViewController
@synthesize companyID = _companyID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"企业相册";
        _canEdit = YES;
    }
    return self;
}

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSCompanyPhotosListPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    if ([aEngine isKindOfClass:[LSCompanyPhotosListPE class]]) 
    {
        LSCompanyPhotosListPE* ptl = (LSCompanyPhotosListPE*)aEngine;
        ptl.companyID = _companyID;
    }
}


-(void)insertPhoto
{
    LSAddPhotoViewController *targetViewController = [[[LSAddPhotoViewController alloc] initWithNibName:@"LSAddPhotoViewController" bundle:nil] autorelease];
    targetViewController.delegate = self;
    
    [self.navigationController pushViewController:targetViewController animated:YES];
}

- (void)navigationLeftButtonItemClicked:(id)aSender
{
    
    if (_isEditing) {
        [self insertPhoto];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)refreshPhotoList
{
    self.needRefreshEvenIfHaveData = YES;
    _listPE.forceRefresh = YES;
    [self.navigationController popToViewController:self animated:YES];
}
@end
