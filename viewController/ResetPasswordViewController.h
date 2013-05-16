//
//  ResetPasswordViewController.h
//  Locoso
//
//  Created by yongchang hu on 11-12-21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordViewController : UIViewController<UITableViewDelegate,
UITableViewDataSource>{
     UITextField *_oldPasswordField;
	 UITextField *_PasswordField;
     UITextField *_PasswordField2;
    IBOutlet UITableView	*myTableView;
    NSDictionary * data;
    NSArray *arrayData;
}
@property (nonatomic, retain) IBOutlet UITextField *oldPasswordField;
@property (nonatomic, retain) IBOutlet UITextField *PasswordField;
@property (nonatomic, retain) IBOutlet UITextField *PasswordField2;
@property (nonatomic, retain) UITableView	*myTableView;
@property (nonatomic, retain) NSDictionary * data;
@property (nonatomic, retain) NSArray *arrayData;
@end
