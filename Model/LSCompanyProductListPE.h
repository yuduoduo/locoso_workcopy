//
//  LSCompanyProductListPE.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSProductListPE.h"

@interface LSCompanyProductListPE : LSProductListPE
{
    long companyID;
}
@property (nonatomic) long companyID;
@end
