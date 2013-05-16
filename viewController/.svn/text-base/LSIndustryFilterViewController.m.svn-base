//
//  LSIndustryFilterViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSIndustryFilterViewController.h"
#import "LSSubIndustryFilterViewController.h"

@interface LSIndustryFilterViewController (LSPrivate)
- (void)postNotification:(LSDataCategory*)aCategory;
@end
@implementation LSIndustryFilterViewController (LSPrivate)
- (void)accessoryButtonClicked:(id)aSender
{
    LSDataCategory* category = [_listPE.rspData.arrContent objectAtIndex:((UIButton*)aSender).tag];
    LSSubIndustryFilterViewController* vc = [[LSSubIndustryFilterViewController alloc] initWithNibName:@"LSSubIndustryFilterViewController" bundle:nil];
    vc.categoryID = category.ID;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (void)postNotification:(LSDataCategory*)aCategory
{
    NSDictionary* userInfo = [NSDictionary dictionaryWithObject:aCategory forKey:LSNOTIFICATION_USERINFO_KEY_Industry];
    [[NSNotificationCenter defaultCenter] postNotificationName:LSNOTIFICATION_FILTER_CHANGED object:self userInfo:userInfo];
}
@end

@implementation LSIndustryFilterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = LSString_filter_industry;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDataCategory* category = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    [self postNotification:category];
}
@end
