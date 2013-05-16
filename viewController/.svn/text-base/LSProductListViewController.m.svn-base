//
//  LSProductListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSProductListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "LSString.h"
#import "UIImageExt.h"
#import "LSMyProductDetailViewController.h"
#import "LSWebViewController.h"
#import "LSImageDetailViewController.h"

@implementation LSProductListViewController

- (UIImage*)handleImageHook:(UIImage*)aSrcImage
{
    return [aSrcImage imageByScalingAndCroppingForSize:CGSizeMake(70, 70)];
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* reuseID = @"cell";
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:reuseID];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = LSFontNormal;
        cell.textLabel.textColor = LSCOLOR_BLACK;
        cell.detailTextLabel.font = LSFontSmall;
        cell.detailTextLabel.textColor = LSCOLOR_6A6A6A;
        
        cell.imageView.image = LSImageByName(LSImage_icon_placeholder);
        cell.imageView.clipsToBounds = YES;
        CALayer* layer = cell.imageView.layer;
        layer.cornerRadius = 5.0f;
        layer.borderColor = LSCOLOR_999999.CGColor;
        layer.borderWidth = 1;
    }
    
    LSDataProduct* product = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
    cell.textLabel.text = product.productname;
    cell.detailTextLabel.text = product.content;
    if ([product.imageUrl length] > 0)
    {
        [self addImage:cell.imageView imageURL:[product.imageUrl stringByHandleImageURL:@"3"]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDataProduct* product = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
//    LSMyProductDetailViewController* vc = [[LSMyProductDetailViewController alloc] initWithNibName:@"LSMyProductDetailViewController" bundle:nil];
//    vc.data = product;
//    [self.navigationController pushViewController:vc animated:YES];
    
//    NSURL* url = [NSURL URLWithString:[product.imageUrl stringByHandleImageURLOriginal]];
//    LSWebViewController* targetViewController = [[LSWebViewController alloc] initWithNibName:@"LSWebViewController" bundle:nil];
//    targetViewController.url = url;
//    [self.navigationController pushViewController:targetViewController animated:YES];
    
    NSString* imageurl = [product.imageUrl stringByHandleImageURLOriginal];
    LSImageDetailViewController* vc = [[LSImageDetailViewController alloc] initWithNibName:@"LSImageDetailViewController" bundle:nil];
    vc.imageURL = imageurl;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}


@end
