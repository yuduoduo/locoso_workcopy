//
//  CompanyIntroduceViewController.h
//  Locoso
//
//  Created by yongchang hu on 11-12-31.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyIntroduceViewController : UIViewController
<UITextViewDelegate>
{
    IBOutlet UITextView *info;
    NSString *infoStr;
}
@property (nonatomic, retain) UITextView *info;
@property (nonatomic, retain) NSString *infoStr;
@end
