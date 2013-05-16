//
//  LSSelectIndustryProtocol.h
//  Locoso
//
//  Created by zhiwei ma on 12-4-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSData.h"

@protocol LSSelectIndustryProtocol <NSObject>
- (void)didSelectIndustry:(LSDataCategory*)aCategory;
@end
