//
//  LSMyProductManageViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSListViewController.h"
#import "LSCompanyProductListViewController.h"
#import "LSDeleteProductPE.h"
#import "LSMyProductDetailViewController.h"
@interface LSMyProductManageViewController : LSCompanyProductListViewController<LSBaseProtocolEngineDelegate,LSMyProductDetailDelegate>{
    LSDeleteProductPE* _deleteProductPE;
    BOOL _deleteDoneFlag;
    BOOL _deleteIsSuccess;
}


@end
