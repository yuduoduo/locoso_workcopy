//
//  LSProductListPE.m
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSProductListPE.h"

@implementation LSProductListPE
- (id)parseContent:(id)aContent
{
    return [LSParseDataUtils parseProduct:aContent];
}

@end
