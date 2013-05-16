//
//  EnterpriseCertificateViewController.h
//  Locoso
//
//  Created by yongchang hu on 11-12-21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class ContactViewController;

@interface EnterpriseCertificateViewController : UIViewController<UIScrollViewDelegate>{
//    ContactViewController *contactViewController;
    IBOutlet UIView *recommendView;
    UIScrollView *upDownScrollView;
    IBOutlet UITextField *companyName;
    IBOutlet UITextView *addtionMessage;
    NSString *scompanyName;
    NSInteger companyID;
}
//@property (nonatomic, retain) ContactViewController *contactViewController;
@property (nonatomic, retain) UIView *recommendView;
@property (nonatomic, retain) UIScrollView *upDownScrollView;
@property (nonatomic, retain) UITextField *companyName;
@property (nonatomic, retain) UITextView *addtionMessage;
@property (nonatomic, retain) NSString *scompanyName;
@property (nonatomic) NSInteger companyID;
@end
