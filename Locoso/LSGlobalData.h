//
//  LSGlobalData.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSData.h"
#import "LSDefine.h"

#define LSSerializeKey_LoginUserName        @"LoginUserName"
#define LSSerializeKey_LoginPassword        @"LoginPassword"
#define LSSerializeKey_SelectedCityID       @"SelectedCityID"
#define LSSerializeKey_SelectedCityName     @"SelectedCityName"
#define LSSerializeKey_SelectedCityParentID @"SelectedCityParentID"
#define LSSerializeKey_IndustryID           @"IndustryID"
#define LSSerializeKey_IndustryName         @"IndustryName"
#define LSSerializeKey_DistrictID           @"DistrictID"
#define LSSerializeKey_DistrictName         @"DistrictName"

//
//LSSerializeDataProtocol
//
@protocol LSSerializeDataProtocol
@required
- (void)saveToLocal;
- (void)readFromLocal;
@end

//
//LSGlobalData
//
@class LSSystemConfig;
@class LSUserConfig;
@interface LSGlobalData : NSObject<LSSerializeDataProtocol>
{
    LSSystemConfig* _systemConfig;
    LSUserConfig* _userConfig;//登录用户的配置信息
}
@property (nonatomic, readonly, retain) LSSystemConfig* systemConfig;
@property (nonatomic, readonly, retain) LSUserConfig* userConfig;

+(LSGlobalData*)sharedInstance;
@end

//
//LSSystemConfig
//
@interface LSSystemConfig : NSObject<LSSerializeDataProtocol>
{
    NSString* _lastLoginUsername;
    NSString* _lastLoginPassword;
    NSString* _loginUsername;
    NSString* _loginPassword;
    
    LSDataCity* _selectedCity;//所选城市
    
    NSMutableArray* _arrSearchHistory;//暂时只放最近的10次不重复的搜索历史
}
@property (nonatomic, copy) NSString* lastLoginUsername;
@property (nonatomic, copy) NSString* lastLoginPassword;
@property (nonatomic, copy) NSString* loginUsername;//当前登录用户名
@property (nonatomic, copy) NSString* loginPassword;

@property (nonatomic, retain) LSDataCity* selectedCity;

@property (nonatomic, retain) NSMutableArray* arrSearchHistory;

- (void)addToSearchHistory:(NSString*)aSearchContent;
@end

//
//LSUserConfig
//登录用户的配置信息
//
@interface LSUserConfig :NSObject<LSSerializeDataProtocol>
{
}
@end

