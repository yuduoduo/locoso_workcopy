//
//  LSFilterViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSFilterViewController.h"
//#import "LSIndustryFilterViewController.h"
//#import "LSDistrictFilterViewController.h"
#import "LSSwitchCityViewController.h"
#import "LSCategoryListViewController.h"

@interface LSFilterViewController ()
- (void)loadComponentViews;
- (void)loadIndustrySelectionViewController;
- (void)loadDistrictSelectionViewController;
@end

@implementation LSFilterViewController
@synthesize district = _district;
@synthesize industry = _industry;
@synthesize selectDelegate = _selectDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = LSString_filter;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadComponentViews];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_tableView release];
    _tableView = nil;
}

- (void)dealloc
{
    self.district = nil;
    self.industry = nil;
    [_tableView release];
    [super dealloc];
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{ 
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return LSString_filtercondition;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* reuseID = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseID] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = LSFontNormal;
        cell.textLabel.textColor = LSCOLOR_BLACK;
        cell.detailTextLabel.font = LSFontNormal;
        cell.detailTextLabel.textColor = LSCOLOR_6A6A6A;
    }
    if (0 == indexPath.row)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@:",LSString_filter_district];
        cell.detailTextLabel.text =  _district.shortname;
    }
    else if (1 == indexPath.row)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@:",LSString_filter_industry];
        cell.detailTextLabel.text = _industry.name;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row)
    {
        [self loadDistrictSelectionViewController];
    }
    else if (1 == indexPath.row)
    {
        [self loadIndustrySelectionViewController];
    }
}

#pragma mark private methods
- (void)loadComponentViews
{
    if (nil == _tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,320,460-44-49) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = LSCOLOR_CLEAR;
        [self.view addSubview:_tableView];
    }
    else 
    {
        [_tableView reloadData];
    }
}

- (void)loadIndustrySelectionViewController
{
//    LSIndustryFilterViewController* vc = [[LSIndustryFilterViewController alloc] initWithNibName:@"LSIndustryFilterViewController" bundle:nil];
    
    LSCategoryListViewController* vc = [[LSCategoryListViewController alloc] initWithNibName:@"LSCategoryListViewController" bundle:nil];
    vc.selectDelegate = _selectDelegate;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (void)loadDistrictSelectionViewController
{
//    LSDistrictFilterViewController* vc = [[LSDistrictFilterViewController alloc] initWithNibName:@"LSDistrictFilterViewController" bundle:nil];

    LSSwitchCityViewController* vc = [[LSSwitchCityViewController alloc] initWithNibName:@"LSSwitchCityViewController" bundle:nil];
    vc.selectDelegate = _selectDelegate;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}
@end
