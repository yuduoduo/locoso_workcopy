//
//  LSSearchViewController.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSSearchViewController.h"
#import "UITableView+LSAddiational.h"
#import "LSSearchResultViewController.h"

@interface LSSearchViewController (LSPrivate)
- (void)loadSearchBar;
- (void)loadSegmentControl;
- (void)loadSegmentControlRelatedTableView;
- (void)loadSearchBarRelatedTableView;
- (BOOL)checkNeedShowMoreButton:(id)aNewData;
- (void)setDisplayState;
- (void)loadSearchResultViewController:(NSString*)aKeyword;
- (void)addKeywordToSearchHistory:(NSString*)aKeyword;
@end

@implementation LSSearchViewController (LSPrivate)
- (void)loadSearchBar
{
    if (nil == _searchBar)
    {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,0,320,44)];
        _searchBar.tintColor = LSCOLOS_SearchBar;
        _searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
        _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _searchBar.delegate = self;
        [self.view addSubview:_searchBar];
    }
}

- (void)loadSegmentControl
{
    if (nil == _segmentControl)
    {
        _segmentControl = [[KKFilterControl alloc] initWithItems:LSString_searchhistory andRight:LSString_hotsearch];
        [_segmentControl setViewOrigin:CGPointMake(0, 44)];
        _segmentControl.delegate = self;
        [self.view addSubview:_segmentControl];
    }
}

- (void)loadSegmentControlRelatedTableView
{
    if (nil == _tableViewSegmentRelated)
    {
        _tableViewSegmentRelated = [[UITableView alloc] initWithFrame:CGRectMake(0,44+44,320,460-44-44-44-49) style:UITableViewStylePlain];
        _tableViewSegmentRelated.delegate = self;
        _tableViewSegmentRelated.dataSource = self;
        [self.view addSubview:_tableViewSegmentRelated];
    }
    else 
    {
        [self.view bringSubviewToFront:_tableViewSegmentRelated];
        [_tableViewSegmentRelated reloadData];
    }
}

- (void)loadSearchBarRelatedTableView
{
    if (nil == _tableViewSearchRelated)
    {
        _tableViewSearchRelated = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 460-44-260) style:UITableViewStylePlain];
        _tableViewSearchRelated.delegate = self;
        _tableViewSearchRelated.dataSource = self;
        [self.view addSubview:_tableViewSearchRelated];
    }
    else 
    {
        _tableViewSearchRelated.hidden = NO;
        [self.view bringSubviewToFront:_tableViewSearchRelated];
        [_tableViewSearchRelated reloadData];
    }
}

- (BOOL)checkNeedShowMoreButton:(id)aNewData
{
    LSListRspData* rspData = (LSListRspData*)aNewData;
    BOOL hidden = [rspData.arrContent count] < _hotsearchPE.pageSize;
    return hidden;
}

- (void)setDisplayState
{
    if (_searchBar.isFirstResponder)
    {
        _displayState = LSSearchViewControllerDisplayStateEditing;
    }
    else if (0 == _segmentControl.selectedIndex)
    {
        _displayState = LSSearchViewControllerDisplayStateHistory;
    }
    else if (1 == _segmentControl.selectedIndex)
    {
        _displayState = LSSearchViewControllerDisplayStateHot;
    }
    else 
    {
        NSAssert(0,@"");
    }
}

- (void)loadSearchResultViewController:(NSString*)aKeyword
{
    LSSearchResultViewController* vc = [[LSSearchResultViewController alloc] initWithNibName:@"LSSearchResultViewController" bundle:nil];
    vc.keyword = aKeyword;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
    
    [self addKeywordToSearchHistory:aKeyword];
}

- (void)addKeywordToSearchHistory:(NSString*)aKeyword
{
    if ([aKeyword length] > 0)
    {
        [[LSGlobalData sharedInstance].systemConfig addToSearchHistory:aKeyword];
    }
}
@end

@implementation LSSearchViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"搜索", @"搜索");
        self.tabBarItem.image = [UIImage imageNamed:@"NewSearchTab"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = LSString_search;

    [self loadSearchBar];
    [self loadSegmentControl];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self addKeywordToSearchHistory];
    [self setDisplayState];
    [self loadSegmentControlRelatedTableView];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_searchBar resignFirstResponder];
//    [self.view sendSubviewToBack:_tableViewSearchRelated];
    [self setDisplayState];
    [_hotsearchPE cancelRequest];
    [_keywordTeamPE cancelRequest];
}

#pragma mark UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    _searchBar.showsCancelButton = YES;
    [self setDisplayState];
    [self loadSearchBarRelatedTableView];
    
    if (nil == _keywordTeamPE)
    {
        _keywordTeamPE = [[LSKeywordTeamPE alloc] init];
        _keywordTeamPE.delegate = self;
    }
    
    NSString* keyword = _searchBar.text;
    if ([keyword length] > 0)
    {
        _keywordTeamPE.keyword = keyword;
        [_keywordTeamPE sendRequest];
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
//    [self.view sendSubviewToBack:_tableViewSearchRelated];
    _tableViewSearchRelated.hidden = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSString* keyword = _searchBar.text;
    
    if (NO == _searchBar.isFirstResponder)
    {
        [_searchBar becomeFirstResponder];
    }

    if (nil == _keywordTeamPE)
    {
        _keywordTeamPE = [[LSKeywordTeamPE alloc] init];
        _keywordTeamPE.delegate = self;
    }
    
    if ([keyword length] > 0)
    {
        _keywordTeamPE.keyword = keyword;
        [_keywordTeamPE sendRequest];
    }
    else 
    {
        _keywordTeamPE.rspData = nil;
        [self loadSearchBarRelatedTableView];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    _searchBar.showsCancelButton = NO;
    _searchBar.text = nil;
    [_searchBar resignFirstResponder];
//    [self.view sendSubviewToBack:_tableViewSearchRelated];
    [self setDisplayState];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSAssert(_searchBar == searchBar,@"");
    NSString* keyword = _searchBar.text;
    NSAssert([keyword length] > 0,@"");
    [self loadSearchResultViewController:keyword];
}

#pragma mark KKFilterControlDelegate
- (void)filterControlSelectedItemChanged:(KKFilterControl*)aFilter selectedIndex:(NSInteger)aSelectedIndex
{
    NSAssert(_segmentControl == aFilter,@"");
    [self setDisplayState];
    [self loadSegmentControlRelatedTableView];
    
    if (1 == _segmentControl.selectedIndex)
    {
        if (nil == _hotsearchPE)
        {
            _hotsearchPE = [[LSHotSearchPE alloc] init];
            _hotsearchPE.delegate = self;
        }
        if (0 == [_hotsearchPE.rspData.arrContent count])
        {
            [self startWaiting];
            _hotsearchPE.forceRefresh = YES;
            [_hotsearchPE sendRequest];
        }
    }
}

#pragma mark UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    if (LSSearchViewControllerDisplayStateHistory == _displayState)
    {
        NSAssert(_tableViewSegmentRelated == tableView,@"");
        count = [[LSGlobalData sharedInstance].systemConfig.arrSearchHistory count];
    }
    else if (LSSearchViewControllerDisplayStateHot == _displayState)
    {
        NSAssert(_tableViewSegmentRelated == tableView,@"");
        count = [_hotsearchPE.rspData.arrContent count];
    }
    else //LSSearchViewControllerDisplayStateEditing
    {
        NSAssert(_tableViewSearchRelated == tableView,@"");
        count = [_keywordTeamPE.rspData.arrContent count];
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (LSSearchViewControllerDisplayStateHistory == _displayState)
    {
        NSAssert(_tableViewSegmentRelated == tableView,@"");
        NSString* reuseID = @"historycell";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (nil == cell)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID] autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.font = LSFontNormal;
            cell.textLabel.textColor = LSCOLOR_333333;
        }
        NSArray* arrSearchHistory = [LSGlobalData sharedInstance].systemConfig.arrSearchHistory;
        cell.textLabel.text = [arrSearchHistory objectAtIndex:indexPath.row];
        return cell;
    }
    else if (LSSearchViewControllerDisplayStateHot == _displayState)
    {
        NSAssert(_tableViewSegmentRelated == tableView,@"");
        NSString* reuseID = @"hotcell";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (nil == cell)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID] autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.font = LSFontNormal;
            cell.textLabel.textColor = LSCOLOR_333333;
        }
        cell.textLabel.text = [_hotsearchPE.rspData.arrContent objectAtIndex:indexPath.row];
        return cell;
    }
    else //LSSearchViewControllerDisplayStateEditing
    {
        NSAssert(_tableViewSearchRelated == tableView,@"");
        NSString* reuseID = @"keywordcell";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (nil == cell)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseID] autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.font = LSFontNormal;
            cell.textLabel.textColor = LSCOLOR_333333;
            cell.detailTextLabel.font = LSFontNormal;
            cell.detailTextLabel.textColor = LSCOLOR_6A6A6A;
        }
        LSDataKeyword* keyword = [_keywordTeamPE.rspData.arrContent objectAtIndex:indexPath.row];
        cell.textLabel.text = keyword.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d%@",keyword.count,LSString_searchCountAdditional];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* keyword = nil;
    if (LSSearchViewControllerDisplayStateHistory == _displayState)
    {
        NSAssert(_tableViewSegmentRelated == tableView,@"");
        NSArray* arrSearchHistory = [LSGlobalData sharedInstance].systemConfig.arrSearchHistory;
        NSString* text = [arrSearchHistory objectAtIndex:indexPath.row];
        keyword = text;
    }
    else if (LSSearchViewControllerDisplayStateHot == _displayState)
    {
        NSAssert(_tableViewSegmentRelated == tableView,@"");
        keyword = [_hotsearchPE.rspData.arrContent objectAtIndex:indexPath.row];
    }
    else //LSSearchViewControllerDisplayStateEditing
    {
        NSAssert(_tableViewSearchRelated == tableView,@"");
        LSDataKeyword* keywordData = [_keywordTeamPE.rspData.arrContent objectAtIndex:indexPath.row];
        keyword = keywordData.name;
    }
    _searchBar.text = keyword;
    [self loadSearchResultViewController:keyword];
}

#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    if (_hotsearchPE == aEngine)
    {
        [self loadSegmentControlRelatedTableView];
        [_tableViewSegmentRelated makeMoreButtonHidden:[self checkNeedShowMoreButton:aData]];
    }
    else if (_keywordTeamPE == aEngine)
    {
        [self loadSearchBarRelatedTableView];
    }
}

- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
{
    [self stopWaiting];
    if (_hotsearchPE == aEngine)
    {
        [self defaultDidProtocolEngineFailed:aError];
    }
    else if (_keywordTeamPE == aEngine)
    {
        //noop
    }
    
    NSLog(@"%s %@",__FUNCTION__, aError);
}
@end
