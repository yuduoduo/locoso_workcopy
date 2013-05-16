//
//  LSSubSwitchCityViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSubSwitchCityViewController.h"
#import "UITableView+LSAddiational.h"

@interface LSSubSwitchCityViewController (LSPrivate) 
- (void)accessoryButtonClicked:(id)aSender;
@end

@implementation LSSubSwitchCityViewController (LSPrivate)
- (void)accessoryButtonClicked:(id)aSender
{
    LSDataCity* city = [_listPE.rspData.arrContent objectAtIndex:((UIButton*)aSender).tag];
    LSSubSwitchCityViewController* vc = [[LSSubSwitchCityViewController alloc] initWithNibName:@"LSSubSwitchCityViewController" bundle:nil];
    vc.city = city;
    vc.title = city.shortname;
    [self.navigationController pushViewController:vc animated:YES];
}
@end

@implementation LSSubSwitchCityViewController
@synthesize city = _city;
@synthesize canToSub = _canToSub;
@synthesize  selectDelegate = _selectDelegate;

- (void)dealloc
{
    self.city = nil;
    [super dealloc];
}

- (LSListProtocolEngine*)protocolEngine
{
    LSCityListPE* listPE = [[[LSCityListPE alloc] init] autorelease];
    listPE.pageSize = 50;
    return listPE;
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    LSCityListPE* listPE = (LSCityListPE*)aEngine;
    listPE.cityID = _city.ID;
}

#pragma mark UITableViewDelegate,UITableViewDatasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listPE.rspData.arrContent count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
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
    if (_canToSub && city.childnum > 0)
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDataCity* city = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    [LSGlobalData sharedInstance].systemConfig.selectedCity = city;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    LSDataCity* city = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    if (_canToSub)
    {
        LSSubSwitchCityViewController* vc = [[LSSubSwitchCityViewController alloc] initWithNibName:@"LSSubSwitchCityViewController" bundle:nil];
        vc.city = city;
        vc.selectDelegate = self.selectDelegate;
        vc.title = city.shortname;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else 
    {
        [_selectDelegate didSelectDistrict:city];
    }
}
@end
