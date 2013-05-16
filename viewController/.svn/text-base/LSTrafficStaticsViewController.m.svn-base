//
//  LSTrafficStaticsViewControllerViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSTrafficStaticsViewController.h"

@interface LSTrafficStaticsViewController ()

@end

@implementation LSTrafficStaticsViewController
@synthesize upDownScrollView,myTableView,trafficDetailHeaderView,trafficFootView,buttonImage,visitNumber,todayLable;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"流量统计";
    }
    return self;
}
-(void)loadCompontView
{
    //scroll
    if (nil == upDownScrollView) {
        upDownScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
        upDownScrollView.backgroundColor = [UIColor whiteColor];
        upDownScrollView.alwaysBounceVertical = YES;
        upDownScrollView.bounces = YES;
        upDownScrollView.delegate = self;
        upDownScrollView.contentSize = CGSizeMake(320, 560);
    }
    
    [self.view addSubview:upDownScrollView];

    
    if (trafficDetailHeaderView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"TrafficStatistcsHeadView" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        
	}
    [upDownScrollView addSubview:trafficDetailHeaderView];
    
    if (nil == myTableView) {
        myTableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, 60, 320, 400) style:UITableViewStyleGrouped] autorelease];
        
        myTableView.backgroundColor = [UIColor whiteColor];
        [myTableView setDelegate:self];
        [myTableView setDataSource:self];
        myTableView.scrollEnabled = NO; 
    }
    
    [upDownScrollView addSubview:myTableView];
    
    
    if (trafficFootView == nil) {
        
        // Load the header view that shows the recipe name and thumbnail
		[[NSBundle mainBundle] loadNibNamed:@"TrafficFootView" owner:self options:nil];
		//companyDetailHeaderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        trafficFootView.frame = CGRectMake(0,420,320, 140); 
        
	}
    [upDownScrollView addSubview:trafficFootView];
    
    buttonImage.image = [UIImage imageNamed:@"anri.png"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    whoIsSelected = 1;

    
    if (_staticsReportPE == nil) {
        _staticsReportPE = [[LSStaticsReportPE alloc]init];
        _staticsReportPE.delegate = self;
    }
    if (_staticsKeyworldPE == nil) {
        _staticsKeyworldPE = [[LSStaticsKeywordPE alloc]init];
        _staticsKeyworldPE.delegate = self;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    if (nil == _staticsReportPE) {
        _staticsReportPE.startDay = [self getTodayDataStr];
        _staticsReportPE.endDay = [self getMonthDataStr];
        [_staticsReportPE sendRequest];
    }else if (nil == _staticsKeyworldPE){
        _staticsKeyworldPE.startDay = [self getTodayDataStr];
        _staticsKeyworldPE.endDay = [self getMonthDataStr];
        [_staticsKeyworldPE sendRequest];
    }
    [self loadCompontView];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_staticsReportPE cancelRequest];
    [_staticsKeyworldPE cancelRequest];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)dealloc
{
    [super dealloc];
    [_staticsReportPE release];
    [_staticsKeyworldPE release];
    _staticsKeyworldPE = nil;
    _staticsReportPE = nil;
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark button
-(IBAction)yearButton:(id)sender
{
    buttonImage.image = [UIImage imageNamed:@"annian.png"];
    whoIsSelected = 1;
    
}

-(IBAction)monthButton:(id)sender
{
    buttonImage.image = [UIImage imageNamed:@"anyue.png"];
    whoIsSelected = 2;
    
}

-(IBAction)dayButton:(id)sender
{
    buttonImage.image = [UIImage imageNamed:@"anri.png"];
    whoIsSelected = 3;
    visitNumber.text = todayLable.text;
}
-(void)offsetTrafficStatisticsView
{
    int icount = 188;
    myTableView.frame = CGRectMake(0, 60, 320, icount);
    upDownScrollView.contentSize = CGSizeMake(320, icount+150);
    trafficFootView.frame = CGRectMake(0,icount-20,320, 140); 
}
#pragma mark -
#pragma mark UITableView Delegate/Datasource

// Determines the number of sections within this table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // This displays a single list of recipes, so one section will do.
	return 2; 
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
            
        case 0:
            return @"搜索到的关键词";
            break;
        case 1:
            return @"搜索引擎";
            break;
            
        default:
            return @"";
            break;
    }
    return @"";
}
// Determines the number of rows for the argument section number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Since this sample has only one section, assume we were passed section = 1, and return the number of recipes
    [self offsetTrafficStatisticsView];
    switch (section) {
            
        case 0:
            return 0;
            break;
        case 1:
            return 0;
            break;
            
        default:
            break;
    }
	return 0;
}

// Create or Access and return appropriate cell identified by the argument indexPath (i.e. Section number and Row number combination)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *kCellIdentifier = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (!cell)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kCellIdentifier] autorelease];
        
		cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.backgroundColor = [UIColor clearColor];
		cell.textLabel.opaque = NO;
		cell.textLabel.textColor = [UIColor blackColor];
		cell.textLabel.highlightedTextColor = [UIColor whiteColor];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
		
		cell.detailTextLabel.backgroundColor = [UIColor clearColor];
		cell.detailTextLabel.opaque = NO;
		cell.detailTextLabel.textColor = [UIColor grayColor];
		cell.detailTextLabel.highlightedTextColor = [UIColor whiteColor];
		cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.textAlignment = UITextAlignmentRight;
    }
    
	// get the view controller's info dictionary based on the indexPath's row
    //cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    cell.textLabel.font = [UIFont fontWithName:@"KaiTi_GB2312" size:16];

    
    
    
	return cell;
}
-(NSString*)getTodayDataStr
{
    NSDate *_date = [NSDate date];
    NSString *fileName = [NSString stringWithFormat:@"%@",_date];

    return [fileName substringToIndex:10];
}

-(NSString*)getMonthDataStr
{
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]  autorelease];
    
    NSDate *now;
    
    NSDateComponents *comps = nil;
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    now=[NSDate date];
    
    comps = [calendar components:unitFlags fromDate:now];
    
    int year=[comps year];
    
    
    int month = [comps month];
    
    int day = [comps day]; 
    
    month = month + 1;

    return [NSString stringWithFormat:@"%d-%d-%d",year,month,day];
}

-(NSString*)getYearDataStr
{
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDate *now;
    
    NSDateComponents *comps = nil;
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    now=[NSDate date];
    
    comps = [calendar components:unitFlags fromDate:now];
    
    int year=[comps year];
    
    
    int month = [comps month];
    
    int day = [comps day]; 
    
    year = year + 1;

    return [NSString stringWithFormat:@"%d-%d-%d",year,month,day];
}

#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    
    if (_staticsKeyworldPE == aEngine) 
    {
        [myTableView reloadData];
        
    }
    if (_staticsReportPE == aEngine) 
    {
        [myTableView reloadData];
        
    }
    [self stopWaiting];
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
    [self stopWaiting];
    NSLog(@"%s %@",__FUNCTION__, aError);
}
@end
