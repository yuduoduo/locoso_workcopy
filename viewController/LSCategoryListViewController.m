//
//  LSCategoryListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCategoryListViewController.h"
#import "UIImageExt.h"
#import "LSSubCategoryListViewController.h"
#import "LSCategoryCompanyListViewController.h"

#pragma mark - LSCategoryViewController (LSPrivate)
@interface LSCategoryListViewController (LSPrivate)
- (UIImage*)cellIconByIndexPath:(NSIndexPath*)aIndexPath;
- (void)loadSubCategoryListViewController:(NSInteger)aRow;
@end

@implementation LSCategoryListViewController (LSPrivate)
- (void)accessoryButtonClicked:(id)aSender
{
    [self loadSubCategoryListViewController:((UIButton*)aSender).tag];
}

- (UIImage*)cellIconByIndexPath:(NSIndexPath*)aIndexPath
{
    NSString* imageName = nil;
    switch (aIndexPath.row)
    {
        case 0:
        {
            imageName = @"tb01.png";
            break;
        }
            
        case 1:
        {
            imageName = @"tb02.png";
            break;
        }
            
        case 2:
        {
            imageName = @"tb03.png";
            break;
        }
            
        case 3:
        {
            imageName = @"tb04.png";
            break;
        }
            
        case 4:
        {
            imageName = @"tb05.png";
            break;
        }
            
        case 5:
        {
            imageName = @"tb06.png";
            break;
        }
            
        case 6:
        {
            imageName = @"tb07.png";
            break;
        }
            
        case 7:
        {
            imageName = @"tb08.png";
            break;
        }
            
        case 8:
        {
            imageName = @"tb09.png";
            break;
        }
            
        case 9:
        {
            imageName = @"tb010.png";
            break;
        }
            
        case 10:
        {
            imageName = @"tb011.png";
            break;
        }
            
        case 11:
        {
            imageName = @"tb012.png";
            break;
        }
            
        case 12:
        {
            imageName = @"tb013.png";
            break;
        }
            
        case 13:
        {
            imageName = @"tb014.png";
            break;
        }
            
        default:
            break;
    }
    return [LSImageByName(imageName)imageByScalingAndCroppingForSize:CGSizeMake(30,30)];
}

- (void)loadSubCategoryListViewController:(NSInteger)aRow
{
    LSDataCategory* categoryData = [_listPE.rspData.arrContent objectAtIndex:aRow];
    LSSubCategoryListViewController* vc = [[LSSubCategoryListViewController alloc] initWithNibName:@"LSSubCategoryListViewController" bundle:nil];
    vc.categoryID = categoryData.ID;
    vc.selectDelegate = self.selectDelegate;
    vc.title = categoryData.name;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}
@end


#pragma mark - LSCategoryViewController
@implementation LSCategoryListViewController
@synthesize categoryID =_categoryID;
@synthesize selectDelegate = _selectDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        self.title = @"分类";
        self.tabBarItem.image = LSImageByName(@"CameraSearchBookIntro");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.morePage = NO;
}

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSCategoryListPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    LSCategoryListPE* listPE = (LSCategoryListPE*)aEngine;
    listPE.categoryID = _categoryID;
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
        cell.textLabel.font = LSFontNormal;
        cell.textLabel.textColor = LSCOLOR_BLACK;
    }
    
    LSDataCategory* categoryData = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    cell.imageView.image = [self cellIconByIndexPath:indexPath];
    [cell.imageView setViewSize:CGSizeMake(30,30)];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDataCategory* category = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    if (_selectDelegate)
    {
        [_selectDelegate didSelectIndustry:category];
    }
    else 
    {
        LSCategoryCompanyListViewController* vc = [[LSCategoryCompanyListViewController alloc] initWithNibName:@"LSCategoryCompanyListViewController" bundle:nil];
        vc.categoryID = category.ID;
        vc.title = category.name;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end

