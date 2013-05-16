//
//  LSSubIndustryFilterViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSubIndustryFilterViewController.h"
#import "LSSubCategoryTableViewCell.h"

@implementation LSSubIndustryFilterViewController
#pragma mark UITableViewDataSource,UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSSubCategoryTableViewCell* cell = [LSSubCategoryTableViewCell subcategoryTableViewCell:tableView];
    LSDataCategory* categoryData = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    
    //这个函数有问题，诡异！
//    [cell setCellWithData:categoryData indexPath:indexPath accessoryTarget:self accessorySelector:@selector(accessoryButtonClicked:)];
    
    cell.textLabel.text = categoryData.name;
    if (categoryData.childnum > 0)
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

@end
