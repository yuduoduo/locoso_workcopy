//
//  LSPhotoOperationPE.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseProtocolEngine.h"
#import "commonManager.h"
#import "SBJson.h"
#import "LSData.h"
#import "LSParseDataUtils.h"

@interface LSPhotoOperationPE : LSBaseProtocolEngine
{
    long _mediaid;
}
//---------输入参数----------
@property (nonatomic) long mediaid;
@end
