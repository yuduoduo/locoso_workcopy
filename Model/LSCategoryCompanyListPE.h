//
//  LSCategoryCompanyListPE.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyListPE.h"

@interface LSCategoryCompanyListPE : LSCompanyListPE
{
    long _categoryID;
    long _cityID;
}
@property (nonatomic) long categoryID;
@property (nonatomic) long cityID;
@end
