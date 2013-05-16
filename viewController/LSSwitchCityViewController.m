//
//  LSSwitchCityViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSwitchCityViewController.h"
#import "LSCityListPE.h"
#import "LSSubSwitchCityViewController.h"
#import "UITableView+LSAddiational.h"

#pragma mark - LSSwitchCityViewController (LSPrivate)
@interface LSSwitchCityViewController (LSPrivate)
- (LSLocationTableViewCell*)locationCellInTableView;
- (void)accessoryButtonClicked:(id)aSender;
@end

@implementation LSSwitchCityViewController (LSPrivate)
- (LSLocationTableViewCell*)locationCellInTableView
{
    if (_tableView)
    {
        UITableViewCell* cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        if ([cell isKindOfClass:[LSLocationTableViewCell class]])
        {
            return (LSLocationTableViewCell*)cell;
        }
    }
    return nil;
}

- (void)accessoryButtonClicked:(id)aSender
{
        LSDataCity* city = [_listPE.rspData.arrContent objectAtIndex:((UIButton*)aSender).tag];
        LSSubSwitchCityViewController* vc = [[LSSubSwitchCityViewController alloc] initWithNibName:@"LSSubSwitchCityViewController" bundle:nil];
        vc.city = city;
        vc.title = city.shortname;
        [self.navigationController pushViewController:vc animated:YES];
}
@end

#pragma mark - LSSwitchCityViewController
@implementation LSSwitchCityViewController
@synthesize selectDelegate = _selectDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"选择城市";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    LSLocationKit* locationKit = [LSLocationKit sharedInstance];
    locationKit.kitDelegate = self;
//    if ([locationKit.lastPlacemark.locality length] == 0)
    if (NO == _cityIDSuccess)
    {
        [locationKit startUpdatingLocation];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[LSLocationKit sharedInstance] stopUpdatingLocation];
}

- (LSListProtocolEngine*)protocolEngine
{
    LSCityListPE* listPE = [[[LSCityListPE alloc] init] autorelease];
    listPE.pageSize = 50;
    return listPE;
}

- (UITableView*)tableView
{
    UITableView* tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0,0,320,460-44-49) style:UITableViewStyleGrouped] autorelease];
    tableView.backgroundColor = [UIColor whiteColor];
    return tableView;
}

#pragma mark UITableViewDelegate,UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 3; 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section)
    {
        return 1;
    }
    else if (1 == section)
    {
        return 1;
    }
    else 
    {
        return [_listPE.rspData.arrContent count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (0 == section)
    {
        return LSString_locationcity;
    }
    else if (1 == section)
    {
        return LSString_alldistrict;
    }
    else 
    {
        return LSString_hotcity;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (0 == indexPath.section)
    {
        NSString* reuseID = @"locationCell";   
        LSLocationTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (nil == cell)
        {
            cell = [[LSLocationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
            cell.delegate = self;
        }
        
        LSLocationKit* kit = [LSLocationKit sharedInstance];
        if (kit.state == LSLocationKitStateUpdateSuccess && _cityIDSuccess)
        {
            NSLog(@"111111111111111111%@",@"");
//            [cell setStateUpdateSuccess:kit.lastPlacemark.locality];
            [cell setStateUpdateSuccess:_cityIDPE.rspData.city.shortname];
        }
        else if (LSLocationKitStateUpdateing == kit.state)
        {
            [cell setStateUpdating];
        }
        else// if (LSLocationKitStateUpdateFailed == kit.state) 
        {
            [cell setStateUpdateFailed];
        }
        return cell;
    }
    else if (1 == indexPath.section)
    {
        static NSString *cityCellID = @"allDistrictCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cityCellID];
        if (nil == cell)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cityCellID] autorelease];
            cell.textLabel.font = LSFontNormal;
            cell.textLabel.textColor = LSCOLOR_333333;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;   
        }
        cell.textLabel.text = LSString_alldistrict;
        return cell;
    }
    else 
    {
        static NSString *cityCellID = @"cityCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cityCellID];
        if (nil == cell)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cityCellID] autorelease];
            cell.textLabel.font = LSFontNormal;
            cell.textLabel.textColor = LSCOLOR_333333;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;   
        }
        
        LSDataCity* city = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
        cell.textLabel.text = city.shortname;
        if (city.childnum > 0)
        {
            [cell setAccessoryView:self selector:@selector(accessoryButtonClicked:) viewTag:indexPath.row];
        }
        else 
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.accessoryView = nil;
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.section)
    {
        LSLocationTableViewCell* cell = [self locationCellInTableView];
        if (LSLocationTableViewCellStateUpdateSuccess == cell.state)
        {
            LSDataCity* city = [[[LSDataCity alloc] init] autorelease];
            city.ID = -1;
            city.shortname = [LSLocationKit sharedInstance].lastPlacemark.locality;
            [LSGlobalData sharedInstance].systemConfig.selectedCity = city;
//            [self.navigationController popToRootViewControllerAnimated:YES]; 
            [_selectDelegate didSelectDistrict:city];
        }
    }
    else if (1 == indexPath.section)
    {
        LSDataCity* city = [[[LSDataCity alloc] init] autorelease];
        city.ID = LSCountryWideCityID;
        city.shortname = LSString_alldistrict;
        [LSGlobalData sharedInstance].systemConfig.selectedCity = city;
//        [self.navigationController popToRootViewControllerAnimated:YES];
        [_selectDelegate didSelectDistrict:city];
    }
    else if (2 == indexPath.section)
    {
        LSDataCity* city = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
        [LSGlobalData sharedInstance].systemConfig.selectedCity = city;
//        [self.navigationController popToRootViewControllerAnimated:YES]; 
        [_selectDelegate didSelectDistrict:city];
    }
}

//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
//{
//    if (1 == indexPath.section)
//    {
//        LSDataCity* city = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
//        LSSubSwitchCityViewController* vc = [[LSSubSwitchCityViewController alloc] initWithNibName:@"LSSubSwitchCityViewController" bundle:nil];
//        vc.cityID = city.ID;
//        vc.title = city.shortname;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//}
#pragma mark LSLocationTableViewCellDelegate
- (void)didRefreshButtonClicked:(LSLocationTableViewCell*)aCell
{
    _cityIDSuccess = NO;
    LSLocationKit* kit = [LSLocationKit sharedInstance];
    [kit stopUpdatingLocation];
    [kit startUpdatingLocation];
    [aCell setStateUpdating];
}

#pragma mark LSSwitchCityViewController
- (void)didReverseGeocoderSuccess:(LSLocationKit*)aLocationKit
{
    if (nil == _cityIDPE)
    {
        _cityIDPE = [[LSCityIDPE alloc] init];
        _cityIDPE.delegate = self;
    }
    [_cityIDPE cancelRequest];
    _cityIDPE.cityName = aLocationKit.lastPlacemark.locality;
    [_cityIDPE sendRequest];
}

- (void)didReverseGeocoderFailed:(LSLocationKit*)aLocationKit
{
    [[self locationCellInTableView] setStateUpdateFailed];
}

#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [super didProtocolEngineFinished:aEngine newData:aData];
    if (_cityIDPE == aEngine) 
    {
        LSDataCity* city = _cityIDPE.rspData.city;
        NSLog(@"_cityIDPE city= %@", city);
        [[self locationCellInTableView] setStateUpdateSuccess:city.shortname];
        [LSGlobalData sharedInstance].systemConfig.selectedCity = city;
        _cityIDSuccess = YES;
    }
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
    [self stopWaiting];
    if (_cityIDPE == aEngine)
    {
        [[self locationCellInTableView] setStateUpdateFailed];
        [LSLocationKit sharedInstance].lastPlacemark = nil;
    }
    else 
    {
        [super didProtocolEngineFailed:aEngine error:aError];
    }
}
@end
