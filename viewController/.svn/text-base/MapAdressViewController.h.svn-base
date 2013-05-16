//
//  MapAdressViewController.h
//  Locoso
//
//  Created by yongchang hu on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapAdressViewController : UIViewController<CLLocationManagerDelegate>{
    //location
	CLLocationManager *locationManager;
    MKMapView *map;
    NSString *mapx;
    NSString *mapy;
    NSString *mapAdress;
}
@property (nonatomic, retain) MKMapView *map;
@property (nonatomic, retain)  NSString *mapx;
@property (nonatomic, retain) NSString *mapy;
@property (nonatomic, retain) NSString *mapAdress;

-(void)setMapLocation:(NSString*)mapxx y:(NSString*)mapyy;
-(void)setAdress:(NSString*)adress;
@end
