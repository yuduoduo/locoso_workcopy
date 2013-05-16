//
//  LSCompanyProductListViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyProductListViewController.h"
#import "LSCompanyProductListPE.h"
#import "LSProductDetailViewController.h"
#import "LSString.h"
@implementation LSCompanyProductListViewController
@synthesize companyID = _companyID;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        self.title = LSString_title_productlist;
        self.morePage = YES;
    }
    return self;
}

- (LSListProtocolEngine*)protocolEngine
{
    return [[[LSCompanyProductListPE alloc] init] autorelease];
}

- (void)setProtocolEngineParams:(LSListProtocolEngine*)aEngine
{
    if ([aEngine isKindOfClass:[LSCompanyProductListPE class]]) 
    {
        LSCompanyProductListPE* ptl = (LSCompanyProductListPE*)aEngine;
        ptl.companyID = _companyID;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDataProduct* product = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];

    NSString* imageurl = [product.imageUrl stringByHandleImageURLOriginal];
    LSProductDetailViewController* targetController = [[[LSProductDetailViewController alloc] initWithNibName:@"LSProductDetailViewController" bundle:nil] autorelease];
    targetController.photoUrl = imageurl;
    targetController.productName = product.productname;
    targetController.productInfo = product.content;
    [self.navigationController pushViewController:targetController animated:YES];
    
}
@end
