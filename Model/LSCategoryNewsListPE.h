//
//  LSCategoryNewsListPE.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSNewsListPE.h"

@interface LSCategoryNewsListPE : LSNewsListPE
{
    long _categoryID;
}
@property (nonatomic) long categoryID;
@end
