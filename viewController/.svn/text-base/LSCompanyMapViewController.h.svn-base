//
//  LSCompanyMapViewController.h
//  Locoso
//
//  Created by yongchang hu on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSBaseViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LSLocationPE.h"
@protocol LSCompanyMapDelegate <NSObject>

-(void)refreshInfo;

@end

@class DDAnnotation;
@interface LSCompanyMapViewController : LSBaseViewController<LSBaseProtocolEngineDelegate,CLLocationManagerDelegate,MKMapViewDelegate>{

    MKMapView *mapView;
    CLLocationManager *locationManager;

    NSInteger CompanyID;
    float coodiatex;
    float coodiatey;


    DDAnnotation *anno;
    UIButton *currentLocationButton;
    NSMutableDictionary* companyDic;
    bool isFirstRun;
    LSLocationPE* _locationPE;
    id <LSCompanyMapDelegate> delegate;
}
@property(nonatomic, assign) id<LSCompanyMapDelegate> delegate;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;


@property (nonatomic, retain) DDAnnotation *anno;
@property (nonatomic, copy) NSMutableDictionary* companyDic;
-(void)setDicToCompanyMap:(NSDictionary*)dic;
@end
