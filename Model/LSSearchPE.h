//
//  LSSearchPE.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSListProtocolEngine.h"

@interface LSSearchPE : LSListProtocolEngine
{
    NSString* _keyword;
    long _cityID;
    long _cateID;
}
@property (nonatomic, retain) NSString* keyword;
@property (nonatomic) long cityID;
@property (nonatomic) long cateID;
@end
