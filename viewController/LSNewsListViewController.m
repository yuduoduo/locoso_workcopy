//
//  LSNewsListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSNewsListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "LSString.h"
#import "UIImageExt.h"
#import "LSMyNewsDetailViewController.h"

@implementation LSNewsListViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.morePage = YES;
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* reuseID = @"cell";
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:reuseID];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = LSFontNormal;
        cell.textLabel.textColor = LSCOLOR_BLACK;
    }
    
    LSDataNews* news = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    cell.textLabel.text = news.title;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDataNews* news = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    LSMyNewsDetailViewController* vc = [[LSMyNewsDetailViewController alloc] initWithNibName:@"LSMyNewsDetailViewController" bundle:nil];
    vc.data = news;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}


@end
