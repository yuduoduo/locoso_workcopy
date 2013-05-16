//
//  LSSearchResultViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSearchResultViewController.h"
#import "LSSearchPE.h"
#import "LSModalView.h"
#import "LSDistrictFilterViewController.h"
#import "LSIndustryFilterViewController.h"
#import "LSFilterViewController.h"

#pragma mark - LSSearchResultViewController (LSPrivate)
@interface LSSearchResultViewController (LSPrivate)
- (void)loadFilterViewController;
@end

#pragma mark - LSSearchResultViewController
@implementation LSSearchResultViewController
@synthesize keyword = _keyword;
@synthesize district = _district;
@synthesize industry = _industry;

- (void)viewDidLoad
{
    self.title = [NSString stringWithFormat:LSString_searchresult,_keyword];
    [super viewDidLoad];
    [self setNavigationBarButtonItemWithTitleStytlePlain:LSString_filter itemType:LSNavigationbarButtonItem_Right];
    
    self.district = [LSGlobalData sharedInstance].systemConfig.selectedCity;
    self.industry = [LSDataCategory allWideCategory];
}

- (void)dealloc
{
    self.district = nil;
    self.industry = nil;
    [super dealloc];
}

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSSearchPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    LSSearchPE* searchPE = (LSSearchPE*)aEngine;
    searchPE.keyword = _keyword;
    
    if (_district.ID >= 0)
    {
        searchPE.cityID = _district.ID;
    }
    if (_industry.ID >= 0)
    {
        searchPE.cateID = _industry.ID;
    }
}

- (void)navigationRightButtonItemClicked:(id)aSender
{
    [self loadFilterViewController];
}

#pragma mark LSSelectDistrictProtocol LSSelectIndustryProtocol
- (void)didSelectDistrict:(LSDataCity*)aCity
{
    self.district = aCity;
    _listPE.forceRefresh = YES;
    self.needRefreshEvenIfHaveData = YES;
    [self.navigationController popToViewController:self animated:YES];
}

- (void)didSelectIndustry:(LSDataCategory*)aCategory
{
    self.industry = aCategory;
    _listPE.forceRefresh = YES;
    self.needRefreshEvenIfHaveData = YES;
    [self.navigationController popToViewController:self animated:YES];
}

#pragma mark private methods
- (void)loadFilterViewController
{
    LSFilterViewController* vc = [[LSFilterViewController alloc] initWithNibName:@"LSFilterViewController" bundle:nil];
    vc.district = _district;
    vc.industry = _industry;
    vc.selectDelegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}
@end
