//
//  LSSubCategoryListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSubCategoryListViewController.h"

#import "LSCategoryCompanyListViewController.h"
#import "LSSubCategoryTableViewCell.h"
#import "UITableView+LSAddiational.h"

@implementation LSSubCategoryListViewController


#pragma mark UITableViewDataSource,UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSSubCategoryTableViewCell* cell = [LSSubCategoryTableViewCell subcategoryTableViewCell:tableView];
    LSDataCategory* categoryData = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
//    [cell setCellWithData:categoryData 
//                indexPath:indexPath 
//          accessoryTarget:self 
//        accessorySelector:@selector(accessoryButtonClicked:)];
    
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

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    LSDataCategory* categoryData = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
//    
//    LSCategoryCompanyListViewController* vc = [[LSCategoryCompanyListViewController alloc] initWithNibName:@"LSCategoryCompanyListViewController" bundle:nil];
//    vc.categoryID = categoryData.ID;
//    
//    vc.title = categoryData.name;
//    [self.navigationController pushViewController:vc animated:YES];
//}
@end
