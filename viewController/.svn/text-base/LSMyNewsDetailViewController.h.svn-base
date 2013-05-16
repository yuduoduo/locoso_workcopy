//
//  LSMyNewsDetailViewControllerViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSAddNewsPE.h"
#import "LSEditNewsPE.h"
#import "LSSaveNewsPE.h"
#import "LSBaseViewController.h"

@class LSMyNewsDetailViewController;
@protocol LSMyNewsDetailViewControllerDelegate 

-(void)refreshList;

@end

@interface LSMyNewsDetailViewController : LSBaseViewController<LSBaseProtocolEngineDelegate,UIScrollViewDelegate>{
    IBOutlet UITextField *nameField;
    IBOutlet UITextView *contentField;
    NSInteger addOreditid;
    //scroll
    UIScrollView *upDownScrollView;
    UIView *productDetailHeaderView;
    
    LSAddNewsPE* _addNewsPE;
    LSEditNewsPE* _editNewsPE;
    LSSaveNewsPE* _saveNewsPE;
    
    LSDataNews * data;
    id <LSMyNewsDetailViewControllerDelegate> delegate;
}
@property (nonatomic, retain) LSDataNews * data;

@property (nonatomic, retain) UITextField *nameField;
@property (nonatomic, retain) UITextView *contentField;
@property (nonatomic, retain) IBOutlet UIView *productDetailHeaderView;
@property (nonatomic, retain) UIScrollView *upDownScrollView;
@property(nonatomic, assign) id<LSMyNewsDetailViewControllerDelegate> delegate;

-(void)setDataToDetail:(LSDataNews*)dataFrome;
-(void)setaddOreditid:(NSInteger)idd;
@end

