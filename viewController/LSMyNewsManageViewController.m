//
//  LSMyNewsManageVIewControllerViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyNewsManageViewController.h"
#import "LSMyNewsDetailViewController.h"
#import "MyDataSource.h"
#import "CheckNetwork.h"
@interface LSMyNewsManageViewController ()

@end

@implementation LSMyNewsManageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"新闻管理";
    }
    return self;
}

-(void)doBack: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES]; 
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
    LSMyNewsDetailViewController *targetViewController = [[[LSMyNewsDetailViewController alloc] initWithNibName:@"LSMyNewsDetailViewController" bundle:nil] autorelease];
    targetViewController.delegate = self;
    [self.navigationController pushViewController:targetViewController animated:YES];
}
-(void)doEdit: (id) sender
{
    // Don't show the Back button while editing.
    [self.navigationItem setHidesBackButton:TRUE animated:YES];
    

    UIBarButtonItem *someBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"添加", @"添加") style:UIBarButtonItemStylePlain target:self action:@selector(insertPhoto:)];
    [self.navigationItem setLeftBarButtonItem:someBarButtonItem]; 
    [someBarButtonItem release]; 

    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"完成", @"完成") style:UIBarButtonItemStylePlain target:self action:@selector(doConfirms:)];
    [self.navigationItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 

    
    [self setEditing:!self.editing animated:YES];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
    if (nil == _deleteNewsPE) {
        _deleteNewsPE = [[LSDeleteNewsPE alloc]init];
        _deleteNewsPE.delegate = self;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self makeEditState:self.isEditing];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    LSMyNewsDetailViewController *targetViewController = [[[LSMyNewsDetailViewController alloc] initWithNibName:@"LSMyNewsDetailViewController" bundle:nil] autorelease];
    targetViewController.delegate = self;
    
    LSDataNews *news = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];

    
    [targetViewController setDataToDetail:news];
    [targetViewController setaddOreditid:2];
    
    [self.navigationController pushViewController:targetViewController animated:YES];
}

#pragma mark Editing

// The editing style for a row is the kind of button displayed to the left of the cell when in editing mode.
- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    // No editing style if not editing or the index path is nil.
    if (self.editing == NO || !indexPath) return UITableViewCellEditingStyleNone;
    // Determine the editing style based on whether the cell is a placeholder for adding content or already 
    // existing content. Existing content can be deleted.
    NSLog(@"indexpath = %d",indexPath.row);
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
//- (UITableViewCellAccessoryType)tableView:(UITableView *)aTableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
//    return (self.editing) ? UITableViewCellAccessoryNone : UITableViewCellAccessoryNone;
//}
// Set the editing state of the view controller. We pass this down to the table view and also modify the content
// of the table to insert a placeholder row for adding content when in editing mode.
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    // Calculate the index paths for all of the placeholder rows based on the number of items in each section.
    NSLog(@"list count=%d",[_listPE.rspData.arrContent count]);
    
    
    //    NSArray *indexPaths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:[menuList count]-1 inSection:0]];
    
    [_tableView beginUpdates];
    [_tableView setEditing:editing animated:YES];
    if (editing) {
        // Show the placeholder rows
        //[myTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    } else {
        // Hide the placeholder rows.
        //[myTableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    }
    [_tableView endUpdates];
    
}

// Update the data model according to edit actions delete or insert.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSDictionary *dataDictionary = [_listPE.rspData.arrContent objectAtIndex:indexPath.row];
        _deleteNewsPE.articleid = [[dataDictionary valueForKey:@"articleid"] intValue];
        _deleteNewsPE.keepLastRequest = YES;
        [_deleteNewsPE sendRequest];
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
            [_deleteNewsPE.request clearCache];
            _deleteNewsPE.keepLastRequest = NO;
        }
        else 
        {
            [LSModalAlertView messageBox:nil message:LSString_delete_failed];
        }
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        UIViewController *targetViewController = [[[LSMyNewsDetailViewController alloc] initWithNibName:@"LSMyNewsDetailViewController" bundle:nil] autorelease];
        [self.navigationController pushViewController:targetViewController animated:YES];
    }
}
#pragma mark Row reordering

// Determine whether a given row is eligible for reordering or not. In this app, all rows except the placeholders for
// new content are eligible, so the test is just the index path row against the number of items in the content.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // get the size of the content array
    NSUInteger numberOfRowsInSection = [_listPE.rspData.arrContent count];
    // Don't allow the placeholder to be moved.
    return (indexPath.row < numberOfRowsInSection);
}

-(void)refreshList
{
    self.needRefreshEvenIfHaveData = YES;
    [_listPE reset];
    _listPE.forceRefresh = YES;
    [self.navigationController popToViewController:self animated:YES];
    
}

#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    if (_deleteNewsPE == aEngine)
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
    if (_deleteNewsPE == aEngine)
    {
        _deleteDoneFlag = YES;
        _deleteIsSuccess = NO;
    }
    else 
    {
        [super didProtocolEngineFailed:aEngine error:aError];
    }
}
@end
