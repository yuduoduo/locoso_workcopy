//
//  LSDistrictFilterViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSDistrictFilterViewController.h"

@interface LSDistrictFilterViewController (LSPrivate)
- (void)accessoryButtonClicked:(id)aSender;
- (void)postNotification:(LSDataCity*)aCity;
- (void)loadSuperiorData;
@end
@implementation LSDistrictFilterViewController (LSPrivate)
- (void)accessoryButtonClicked:(id)aSender
{
    LSDataCity* city = [_listPE.rspData.arrContent objectAtIndex:((UIButton*)aSender).tag];
    LSDistrictFilterViewController* vc = [[LSDistrictFilterViewController alloc] initWithNibName:@"LSDistrictFilterViewController" bundle:nil];
    vc.city = city;
    vc.title = city.shortname;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)postNotification:(LSDataCity*)aCity
{
    NSDictionary* userInfo = [NSDictionary dictionaryWithObject:aCity forKey:LSNOTIFICATION_USERINFO_KEY_District];
    [[NSNotificationCenter defaultCenter] postNotificationName:LSNOTIFICATION_FILTER_CHANGED object:self userInfo:userInfo];
}

- (void)loadSuperiorData
{
}
@end


@implementation LSDistrictFilterViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = LSString_filter_district;
    self.canToSub = YES;
}

//- (void)loadComponentViews
//{
//    [super loadComponentViews];
//    if (self.city.ID > 0)
//    {
//        [self setNavigationBarButtonItemWithTitleStytlePlain:LSString_superior itemType:LSNavigationbarButtonItem_Right];
//    }
//    else 
//    {
//        self.navigationItem.rightBarButtonItem = nil;
//    }
//}

- (void)navigationRightButtonItemClicked:(id)aSender
{
    [self loadSuperiorData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDataCity* city = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    [self postNotification:city];
}
@end
