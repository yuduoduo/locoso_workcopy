//
//  LSStaticsReportPE.h
//  Locoso
//
//  Created by yongchang hu on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseProtocolEngine.h"

@interface LSStaticsReportPE : LSBaseProtocolEngine{
    NSInteger _companyID;
    NSString* _startDay;
    NSString* _endDay;
}
@property (nonatomic )NSInteger companyID;
@property (nonatomic, retain) NSString* startDay;
@property (nonatomic, retain) NSString* endDay;
@end
