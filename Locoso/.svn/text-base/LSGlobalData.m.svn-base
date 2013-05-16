//
//  LSGlobalData.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSGlobalData.h"
#import "LSFileUtils.h"

#pragma mark - LSGlobalData
@interface LSGlobalData (LSPrivate)
@property (nonatomic, readwrite, retain) LSSystemConfig* systemConfig;
@property (nonatomic, readwrite, retain) LSUserConfig* userConfig;
@end

@implementation LSGlobalData (LSPrivate)
@dynamic systemConfig;
@dynamic userConfig;
@end

@implementation LSGlobalData
@synthesize systemConfig = _systemConfig;
@synthesize userConfig = _userConfig;

static LSGlobalData* sGlobalData = nil;
+(LSGlobalData*)sharedInstance
{
    if (!sGlobalData) 
    {
		@synchronized(self) 
        {
			if (!sGlobalData) 
            {
                sGlobalData = [[self alloc] init];
			}
		}
	}
	return sGlobalData;
}

- (void)dealloc
{
    self.systemConfig = nil;
    self.userConfig = nil;
    [super dealloc];
}

- (void)saveToLocal
{
    [_systemConfig saveToLocal];
    [_userConfig saveToLocal];
}

- (void)readFromLocal
{
    if (nil == _systemConfig)
    {
        _systemConfig = [[LSSystemConfig alloc] init];
    }
    if (nil == _userConfig)
    {
        _userConfig = [[LSUserConfig alloc] init];
    }
    [_systemConfig readFromLocal];
    [_userConfig readFromLocal];
}

@end

#pragma mark - LSSystemConfig
@interface LSSystemConfig (LSPrivate)
- (void)readSearchHistoryFromLocal;
- (void)saveSearchHistoryToLocal;
@end

@implementation LSSystemConfig (LSPrivate)
- (void)readSearchHistoryFromLocal
{
    NSString* path = [RJFileUtils searchHistoryFilePath];
    NSMutableArray* array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    self.arrSearchHistory = array;
    [array release];
}

- (void)saveSearchHistoryToLocal
{
    NSString* path = [RJFileUtils searchHistoryFilePath];
    [self.arrSearchHistory writeToFile:path atomically:YES];
}
@end

@implementation LSSystemConfig
@synthesize lastLoginUsername = _lastLoginUsername;
@synthesize lastLoginPassword = _lastLoginPassword;
@synthesize loginUsername = _loginUsername;
@synthesize loginPassword = _loginPassword;
@synthesize selectedCity = _selectedCity;
@synthesize arrSearchHistory = _arrSearchHistory;

- (void)dealloc
{
    self.lastLoginUsername = nil;
    self.lastLoginPassword = nil;
    self.loginUsername = nil;
    self.loginPassword = nil;
    self.selectedCity = nil;
    self.arrSearchHistory = nil;
    [super dealloc];
}

- (void)saveToLocal
{
    NSString* path = [RJFileUtils systemConfigFilePath];
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    if (_loginUsername)
    {
        [dict setObject:_loginUsername forKey:LSSerializeKey_LoginUserName];
    }
    if (_loginPassword)
    {
        [dict setObject:_loginPassword forKey:LSSerializeKey_LoginPassword];
    }
    
    [dict setObject:[NSNumber numberWithLong:_selectedCity.ID] forKey:LSSerializeKey_SelectedCityID];
    [dict setObject:_selectedCity.shortname forKey:LSSerializeKey_SelectedCityName];
    [dict setObject:[NSNumber numberWithLong:_selectedCity.parentid] forKey:LSSerializeKey_SelectedCityParentID];
    
    BOOL ret = [dict writeToFile:path atomically:YES];
    if (NO == ret)
    {
        NSLog(@"%s failed.",__FUNCTION__);
    }
    [dict release];
    
    [self saveSearchHistoryToLocal];
}

- (void)readFromLocal
{
    NSString* path = [RJFileUtils systemConfigFilePath];
    NSDictionary* dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //上次登录信息
    if (nil != dict)
    {
        self.lastLoginUsername = [dict valueForKey:LSSerializeKey_LoginUserName];
        self.lastLoginPassword = [dict valueForKey:LSSerializeKey_LoginPassword];
    }
    
    //所选城市
    LSDataCity* city = nil;
    if (nil == dict)
    {
        NSLog(@"%s nil == dict",__FUNCTION__);
        city = [LSDataCity countryWideCity];
    }
    else 
    {
        id cityID = [dict valueForKey:LSSerializeKey_SelectedCityID];
        if (nil == cityID)
        {
            city = [LSDataCity countryWideCity];
        }
        else 
        {
            city = [[[LSDataCity alloc] init] autorelease];
            city.ID = [cityID longValue];
            city.shortname = [dict valueForKey:LSSerializeKey_SelectedCityName];
            city.parentid = [[dict valueForKey:LSSerializeKey_SelectedCityParentID] longValue];
        }
    }
    self.selectedCity = city;
    
    //搜索历史
    [self readSearchHistoryFromLocal];
}

- (void)addToSearchHistory:(NSString*)aSearchContent
{
    if ([aSearchContent length ] == 0)
    {
        return;
    }
    
    if (nil == _arrSearchHistory)
    {
        _arrSearchHistory = [[NSMutableArray alloc] initWithCapacity:10];
    }
    
    for (NSString* content in _arrSearchHistory)
    {
        if ([aSearchContent isEqualToString:content]) 
        {
            [_arrSearchHistory removeObject:content];
            break;
        }
    }
    [_arrSearchHistory insertObject:aSearchContent atIndex:0];
    
    NSInteger count = [_arrSearchHistory count];
    if (count > 10)
    {
        NSRange range = NSMakeRange(0, count - 10);
        [_arrSearchHistory removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:range]];
    }
}
@end

#pragma mark - LSUserConfig
@implementation LSUserConfig
- (void)dealloc
{
    [super dealloc];
}

- (void)saveToLocal
{
    //todo
}

- (void)readFromLocal
{
    //todo
}
@end

