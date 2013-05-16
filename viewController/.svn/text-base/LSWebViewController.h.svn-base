//
//  LSWebViewController.h
//  Locoso
//
//  Created by zhiwei ma on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseViewController.h"

@interface LSWebViewController : LSBaseViewController
<UIWebViewDelegate>
{
    UIWebView* _webView;
    NSURL* _url;
    NSURL* _loadedURL;
}
@property (nonatomic, retain) NSURL* url;

- (void)startLoad;
- (BOOL)isLoading;
- (void)cancelLoad;
@end
