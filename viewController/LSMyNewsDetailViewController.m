//
//  LSMyNewsDetailViewControllerViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSMyNewsDetailViewController.h"
#import "CheckAndShowMessage.h"
#import "NSStringTool.h"
@interface LSMyNewsDetailViewController ()

@end

@implementation LSMyNewsDetailViewController
@synthesize data,nameField,contentField,productDetailHeaderView,upDownScrollView,delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"新闻详情";
    }
    return self;
}
-(void)doConfirm: (id) sender
{
    BOOL checkname =   [CheckAndShowMessage checkNullAndShowMsg:nameField.text msg:@"请输入新闻标题"];
    if (checkname) {
        [LSModalAlertView messageBox:@"" message:@"请输入新闻标题"];
        [nameField becomeFirstResponder];
        return;
    }
    [nameField  resignFirstResponder];
    [contentField resignFirstResponder];
    
    [self startHUDWaiting:@"上传中，请等待。"];
    if (addOreditid == 2) {
        _editNewsPE.productid = data.articleid;
        [_editNewsPE sendRequest];
    }else{
        _addNewsPE.title = nameField.text;
        _addNewsPE.content = contentField.text;
        [_addNewsPE sendRequest];
    }

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateDetaiData ];
}
-(void)updateDetaiData
{
    
    {
        nameField.text = [data valueForKey:@"title"];
        contentField.text = [NSStringTool flattenHTML:[data valueForKey:@"content"]];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"保存", @"保存") style:UIBarButtonItemStylePlain target:self action:@selector(doConfirm:)];
    
    [self.navigationItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 
 
    //scroll
    upDownScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	upDownScrollView.backgroundColor = [UIColor whiteColor];
    //	upDownScrollView.alwaysBounceVertical = YES;
    //	upDownScrollView.bounces = YES;
	upDownScrollView.delegate = self;
    //    upDownScrollView.pagingEnabled = YES;
    upDownScrollView.scrollEnabled = YES;
    upDownScrollView.showsVerticalScrollIndicator = YES;
    upDownScrollView.contentSize = CGSizeMake(320, 550);
    [self.view addSubview:upDownScrollView];
    
    if (productDetailHeaderView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"LSMyNewsDetailView" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        
	}
    productDetailHeaderView.frame = CGRectMake(0,0,320, 460);
    [upDownScrollView addSubview:productDetailHeaderView];
    
    if (nil == _addNewsPE)
    {
        _addNewsPE = [[LSAddNewsPE alloc] init];
        _addNewsPE.delegate = self;
    }
    if (nil == _editNewsPE)
    {
        _editNewsPE = [[LSEditNewsPE alloc] init];
        _editNewsPE.delegate = self;
    }
    if (nil == _saveNewsPE)
    {
        _saveNewsPE = [[LSSaveNewsPE alloc] init];
        _saveNewsPE.delegate = self;
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    
    
    if (_addNewsPE == aEngine) {
        
        [self.delegate refreshList];
            
        
        
    }else  if (_editNewsPE == aEngine)
    {
        if (nil != _editNewsPE.rspData)
        {
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary: _editNewsPE.rspData.newsDic];
            [dic setValue:nameField.text forKey:@"title"];
            [dic setValue:contentField.text forKey:@"content"];
            _saveNewsPE.dic = dic;
            [_saveNewsPE sendRequest];
        }
                
    }else  if (_saveNewsPE == aEngine)
    {
                [self.delegate refreshList];
            
    }
}

//- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
//{
//    [self stopWaiting];
//    NSLog(@"%@ didProtocolEngineFailed",[[self class] description]);
//    UIAlertView *errorView;
//    errorView = [[UIAlertView alloc] 
//                 initWithTitle: @"" 
//                 message: [aError description] 
//                 delegate: self 
//                 cancelButtonTitle: @"确定" otherButtonTitles: nil]; 
//    [errorView show];
//    [errorView autorelease];
//}

-(void)setDataToDetail:(LSDataNews*)dataFrome
{

    self.data = dataFrome;
}

-(void)setaddOreditid:(NSInteger)idd
{
    addOreditid = idd;
}

- (IBAction)backgroundClick:(id)sender
{	
	[nameField resignFirstResponder];
	[contentField resignFirstResponder];
	
}
@end
