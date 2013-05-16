//
//  FirstHelpViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-2-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstHelpViewController : UIViewController<UIScrollViewDelegate>{
    UIPageControl *pageControl;
    UIScrollView *scrollView;
    NSMutableArray *viewControllers;
    
    // To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
}
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) NSMutableArray *viewControllers;

- (IBAction)changePage:(id)sender;
@end
