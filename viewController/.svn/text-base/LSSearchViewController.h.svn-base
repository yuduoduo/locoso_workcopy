//
//  LSSearchViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseViewController.h"
#import "LSHotSearchPE.h"
#import "LSKeywordTeamPE.h"
#import "KKFilterControl.h"

typedef enum
{
    LSSearchViewControllerDisplayStateHistory,//搜索历史
    LSSearchViewControllerDisplayStateHot,//热门搜索
    LSSearchViewControllerDisplayStateEditing//搜索编辑中
}LSSearchViewControllerDisplayState;

@class KKFilterControl;
@interface LSSearchViewController : LSBaseViewController
<UISearchBarDelegate,KKFilterControlDelegate,UITableViewDelegate,UITableViewDataSource,LSBaseProtocolEngineDelegate>
{
    LSSearchViewControllerDisplayState _displayState;
    UISearchBar* _searchBar;
    KKFilterControl* _segmentControl;
    UITableView* _tableViewSegmentRelated;
    UITableView* _tableViewSearchRelated;//搜索框输入时显示
    
    LSKeywordTeamPE* _keywordTeamPE;
    LSHotSearchPE* _hotsearchPE;
}
@end
