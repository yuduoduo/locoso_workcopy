//
//  LSPhotosListPE.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSPhotosListPE.h"

//#define LSLOCALTEST_PHOTOLIST

@implementation LSPhotosListPE

- (id)parseContent:(id)aContent
{
    return [LSParseDataUtils parsePhoto:aContent];
}

#ifdef LSLOCALTEST_PHOTOLIST
- (LSBaseResponseData*)parseResponseData:(NSString*)aResponseString
{
    
    LSListRspData* rspData = [[[LSListRspData alloc] init] autorelease];
    
    NSMutableArray* array = [[[NSMutableArray alloc] initWithCapacity:10] autorelease];
    
    LSDataPhoto* photo1 = [[[LSDataPhoto alloc] init] autorelease];
    photo1.mediaid = 0;
    photo1.medianame = @"photo 0";
    photo1.filepath = @"http://www.locoso.org/uploads/s/0000/0000/0014/304c/logo_{0}.jpg";
    [array addObject:photo1];
    
    LSDataPhoto* photo2 = [[[LSDataPhoto alloc] init] autorelease];
    photo2.mediaid = 1;
    photo2.medianame = @"photo 1";
    photo2.filepath = @"http://www.locoso.org/uploads/s/0000/0000/0014/304b/logo_{0}.jpg";
    [array addObject:photo2];
    
    for (NSInteger i =0 ; i < 10; i++)
    {
        LSDataPhoto* photo = [[[LSDataPhoto alloc] init] autorelease];
        photo.mediaid = i+2;
        photo.medianame = [NSString stringWithFormat:@"photo %d",photo.mediaid];
        photo.filepath = @"http://www.locoso.org/uploads/s/0000/0000/0014/304c/logo_{0}.jpg";
        [array addObject:photo];
    }
    
    rspData.arrContent = array;
    
    return rspData;
}
#endif
@end
