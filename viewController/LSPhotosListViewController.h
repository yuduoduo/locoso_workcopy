//
//  LSPhotosListViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSListViewController.h"
#import "LSPhotosTableViewCell.h"
#import "LSPhotoDeletePE.h"

@interface LSPhotosListViewController : LSListViewController
<LSPhotosTableViewCellDelegate,LSBaseProtocolEngineDelegate>
{
    UIImage* _placeHolderImage;
    LSPhotoDeletePE* _photoDeletePE;
    
    BOOL _canEdit;
    BOOL _isEditing;
}
@property (nonatomic) BOOL canEdit;
@end
