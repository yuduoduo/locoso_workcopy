//
//  LSCompanyPhotosListViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSPhotosListViewController.h"
#import "LSAddPhotoViewController.h"
@interface LSCompanyPhotosListViewController : LSPhotosListViewController<LSMyPhotoAddDelegate>
{
    long _companyID;
}
@property (nonatomic) long companyID;
@end
