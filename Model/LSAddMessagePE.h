//
//  LSAddMessagePE.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseProtocolEngine.h"

@interface LSAddMessagePE : LSBaseProtocolEngine
{
    NSString* _content;
    NSString* _senderName;
    long _companyID;
}
@property (nonatomic, retain) NSString* content;
@property (nonatomic, retain) NSString* senderName;
@property (nonatomic) long companyID;
@end
