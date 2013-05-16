//
//  LSCategoryListPE.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSListProtocolEngine.h"

@class LSListRspData;
@interface LSCategoryListPE : LSListProtocolEngine
{
    NSInteger _categoryID;
}

//-------输入参数----------------
@property (nonatomic) NSInteger categoryID;
@end