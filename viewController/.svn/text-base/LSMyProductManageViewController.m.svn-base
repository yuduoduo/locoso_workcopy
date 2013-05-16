//
//  LSMyProductManageViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyProductManageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "LSMyProductDetailViewController.h"

@interface LSMyProductManageViewController ()
- (void)insertPhoto;
- (void)makeEditState:(BOOL)aEdit;
@end

@implementation LSMyProductManageViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"产品管理";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.morePage = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_deleteProductPE cancelRequest];
    [self setEditing:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self makeEditState:self.isEditing];
}

- (void)navigationLeftButtonItemClicked:(id)aSender
{
    if (self.isEditing)
    {
        [self insertPhoto];
    }
}

- (void)navigationRightButtonItemClicked:(id)aSender
{
    [self makeEditState:!self.isEditing];
}

#pragma mark Editing

// The editing style for a row is the kind of button displayed to the left of the cell when in editing mode.
- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    // No editing style if not editing or the index path is nil.
    if (self.editing == NO || !indexPath) return UITableViewCellEditingStyleNone;
    // Determine the editing style based on whether the cell is a placeholder for adding content or already 
    // existing content. Existing content can be deleted.
    
    NSLog(@"list count = %d",[_listPE.rspData.arrContent count]);
    {
        
        {
            if (indexPath.row >= [_listPE.rspData.arrContent count]) {
                return UITableViewCellEditingStyleInsert;
            } else {
                return UITableViewCellEditingStyleDelete;
            }
        }
    }
    return UITableViewCellEditingStyleNone;
}

// Set the editing state of the view controller. We pass this down to the table view and also modify the content
// of the table to insert a placeholder row for adding content when in editing mode.
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [_tableView beginUpdates];
    [_tableView setEditing:editing animated:YES];
    [_tableView endUpdates];
    
}

// Update the data model according to edit actions delete or insert.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (nil == _deleteProductPE) {
            _deleteProductPE = [[LSDeleteProductPE alloc]init];
            _deleteProductPE.delegate = self;
        }
        NSDictionary *dataDictionary = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
        _deleteProductPE.productid = [[dataDictionary valueForKey:@"producid"] intValue];
        _deleteProductPE.keepLastRequest = YES;
        [_deleteProductPE sendRequest];
        _deleteDoneFlag = NO;
        [self startHUDWaiting:LSString_deleting];
        while (NO == _deleteDoneFlag)
        {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        
        if (_deleteIsSuccess)//删除成功
        {
            [_listPE.rspData.arrContent removeObjectAtIndex: indexPath.row];
            [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [_deleteProductPE.request clearCache];
            _deleteProductPE.keepLastRequest = NO;
        }
        else 
        {
            [LSModalAlertView messageBox:nil message:LSString_delete_failed];
        }
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        UIViewController *targetViewController = [[[LSMyProductDetailViewController alloc] initWithNibName:@"LSMyProductDetailViewController" bundle:nil] autorelease];
        [self.navigationController pushViewController:targetViewController animated:YES];
    }
}

#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSMyProductDetailViewController *targetViewController = [[[LSMyProductDetailViewController alloc] initWithNibName:@"LSMyProductDetailViewController" bundle:nil] autorelease];
    targetViewController.delegate = self;
    LSDataProduct *product = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];

    [targetViewController setDataToDetail:product];
    [targetViewController setaddOreditid:2];
    
    [self.navigationController pushViewController:targetViewController animated:YES];
}

-(void)refreshList{
    self.needRefreshEvenIfHaveData = YES;
    [_listPE reset];
    _listPE.forceRefresh = YES;
    [self.navigationController popToViewController:self animated:YES];
}

#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    if (_deleteProductPE == aEngine)
    {
        _deleteDoneFlag = YES;
        _deleteIsSuccess = YES;
    }
    else 
    {
        [super didProtocolEngineFinished:aEngine newData:aData];
    }
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
    [self stopWaiting];
    if (_deleteProductPE == aEngine)
    {
        _deleteDoneFlag = YES;
        _deleteIsSuccess = NO;
    }
    else 
    {
        [super didProtocolEngineFailed:aEngine error:aError];
    }
}

#pragma mark private methods
- (void)makeEditState:(BOOL)aEdit
{
    if (aEdit)
    {
        [self setNavigationBarButtonItemWithTitleStytlePlain:LSString_add itemType:LSNavigationbarButtonItem_Left];
        [self setNavigationBarButtonItemWithTitleStytlePlain:LSString_done itemType:LSNavigationbarButtonItem_Right];
    }
    else 
    {
        self.navigationItem.leftBarButtonItem = nil;
        [self setNavigationBarButtonItemWithTitleStytlePlain:LSString_edit itemType:LSNavigationbarButtonItem_Right];
    }
    [self setEditing:aEdit animated:YES];
}

-(void)insertPhoto
{    
    LSMyProductDetailViewController *targetViewController = [[[LSMyProductDetailViewController alloc] initWithNibName:@"LSMyProductDetailViewController" bundle:nil] autorelease];
    targetViewController.delegate = self;
    
    [self.navigationController pushViewController:targetViewController animated:YES];
}
@end
