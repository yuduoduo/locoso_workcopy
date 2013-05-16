//
//  LSCompanyMapViewController.m
//  Locoso
//
//  Created by yongchang hu on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSCompanyMapViewController.h"
#import "DDAnnotation.h"
#import "DDAnnotationView.h"
#import "commonManager.h"
#import "JsonResturnCheck.h"
#import "LSParseDataUtils.h"
@interface LSCompanyMapViewController ()

@end
#define MK_DELTA_FLOAT 0.1f
@implementation LSCompanyMapViewController
@synthesize mapView,anno,companyDic,delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"企业地图";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    isFirstRun = TRUE;
    if (nil == companyDic) {
        companyDic = [[NSMutableDictionary alloc]init ];
    }
    [self loadCompontView];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    mapView.delegate = self;
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if ([companyDic isKindOfClass:[NSDictionary class]]) {
        CompanyID = [[companyDic objectForKey:LSJSONKEY_companyid] longValue];
    }
    
    if (CompanyID != 0) {
        float mapx = [[companyDic objectForKey:@"mapx"] floatValue];
        float mapy = [[companyDic objectForKey:@"mapy"] floatValue];
        if ( mapx != 0 || mapy != 0) {
            
            
            CLLocationCoordinate2D theCoordinate;
            theCoordinate.latitude = mapx;
            theCoordinate.longitude = mapy;
            if (!CLLocationCoordinate2DIsValid(theCoordinate))
            {
                [self goToCurrentLocation];
                return;
            }

            coodiatex = mapx;
            coodiatey = mapy;
            [self goToCoordinateLocation:theCoordinate];
            [self addAnnotationToView:theCoordinate];
        }else {
            [self goToCurrentLocation];
        }
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(coordinateChanged_:) name:@"DDAnnotationCoordinateDidChangeNotification" object:nil];
    }
    
    
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views;
{
    [self.mapView selectAnnotation:[[self.mapView annotations] lastObject] animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
	
	[super viewWillDisappear:animated];
	
	// NOTE: This is optional, DDAnnotationCoordinateDidChangeNotification only fired in iPhone OS 3, not in iOS 4.
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"DDAnnotationCoordinateDidChangeNotification" object:nil];	
}
-(void)goToCoordinateLocation:(CLLocationCoordinate2D)theCoordinate{
    MKCoordinateRegion theRegion;
	theRegion.center = theCoordinate;
	
    MKCoordinateRegion currentregion = mapView.region;
	MKCoordinateSpan theSpan;
    if (isFirstRun) {
        theSpan.latitudeDelta = MK_DELTA_FLOAT;
        theSpan.longitudeDelta = MK_DELTA_FLOAT;
        isFirstRun = false;
    }
    else
    {
        theSpan.latitudeDelta = currentregion.span.latitudeDelta;
        theSpan.longitudeDelta = currentregion.span.longitudeDelta;
    }
	theRegion.span = theSpan;
	
	mapView.scrollEnabled = YES;
	mapView.zoomEnabled = YES;
    //	mapView.showsUserLocation = YES;
	
	[mapView setRegion:theRegion animated:TRUE];
}
-(void)loadCompontView
{

    
    UIBarButtonItem *someBarButtonItem2 = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"保存", @"保存") style:UIBarButtonItemStylePlain target:self action:@selector(doSaveLocation)];
    
    [self.navigationItem setRightBarButtonItem:someBarButtonItem2]; 
    [someBarButtonItem2 release]; 
    
    currentLocationButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 300, 60, 60)];
    [currentLocationButton  setBackgroundImage:[UIImage imageNamed:@"currentLocation.png"] forState:UIControlStateNormal];
    [currentLocationButton addTarget:self action:@selector(goToCurrentLocation) forControlEvents:UIControlEventTouchUpInside]; 
    
    [self.view addSubview:currentLocationButton];
    
    
}
-(void)goToCurrentLocation{
    if (nil == locationManager) {
        locationManager = [[CLLocationManager alloc] init]; 
    }
    
	[locationManager setDelegate:self]; 
	[locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];	
	[locationManager startUpdatingLocation];
    

    
	// Configure the new event with information from the location.
	CLLocationCoordinate2D theCoordinate = [[locationManager location] coordinate];
    
    MKCoordinateRegion theRegion;
	theRegion.center = theCoordinate;
	
    MKCoordinateRegion currentregion = mapView.region;
//	MKCoordinateSpan theSpan;
//    if (isFirstRun) {
//        theSpan.latitudeDelta = 0.15f;
//        theSpan.longitudeDelta = 0.15f;
//        isFirstRun = false;
//    }
//    else
//    {
//        theSpan.latitudeDelta = currentregion.span.latitudeDelta;
//        theSpan.longitudeDelta = currentregion.span.longitudeDelta;
//    }
	theRegion.span = currentregion.span;
	
	mapView.scrollEnabled = YES;
	mapView.zoomEnabled = YES;
    //	mapView.showsUserLocation = YES;
	
	[mapView setRegion:theRegion animated:TRUE];
    
    [self addAnnotationToView:theCoordinate];
}
-(void)addAnnotationToView:(CLLocationCoordinate2D)theCoordinate
{
    if (nil == anno) {
        anno = [[[DDAnnotation alloc] initWithCoordinate:theCoordinate addressDictionary:nil] autorelease];
    }
    
	anno.title = @"按住大头针来拖动";
	anno.subtitle = [NSString	stringWithFormat:@"%f %f", theCoordinate.latitude, theCoordinate.longitude];
	anno.coordinate = theCoordinate;
	[self.mapView addAnnotation:anno];	
    
    

}


-(void)doSaveLocation
{
    [self startHUDWaiting:@"位置保存中，请等待。"];
    if (nil == _locationPE) {
        _locationPE = [[LSLocationPE alloc]init];
        _locationPE.delegate = self;
    }

    if ([companyDic isKindOfClass:[NSDictionary class]]) {
        CompanyID = [[companyDic objectForKey:LSJSONKEY_companyid] longValue];
    }
    
    if (CompanyID != 0) {
       [companyDic setValue:[NSNumber numberWithFloat:coodiatex] forKey:@"mapx"];
        [companyDic setValue:[NSNumber numberWithFloat:coodiatey] forKey:@"mapy"];

        _locationPE.dic = companyDic;
        [_locationPE sendRequest];
    }else {
        [self stopWaiting];
    }
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.mapView.delegate = nil;
	self.mapView = nil;
    locationManager = nil;

}
- (void)dealloc {
	mapView.delegate = nil;
	[mapView release];
    [locationManager release];
    locationManager = nil;
    [super dealloc];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark -
#pragma mark DDAnnotationCoordinateDidChangeNotification

// NOTE: DDAnnotationCoordinateDidChangeNotification won't fire in iOS 4, use -mapView:annotationView:didChangeDragState:fromOldState: instead.
- (void)coordinateChanged_:(NSNotification *)notification {
	
	DDAnnotation *annotation = notification.object;
	annotation.subtitle = [NSString	stringWithFormat:@"%f %f", annotation.coordinate.latitude, annotation.coordinate.longitude];
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotationView didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
	
	if (oldState == MKAnnotationViewDragStateDragging) 
    {
		DDAnnotation *annotation = (DDAnnotation *)annotationView.annotation;
		annotation.subtitle = [NSString	stringWithFormat:@"%f %f", annotation.coordinate.latitude, annotation.coordinate.longitude];		coodiatex = annotation.coordinate.latitude;
        coodiatey = annotation.coordinate.longitude;
        NSLog(@"x = %f",coodiatex);
        NSLog(@"y = %f",coodiatey);
	}
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;		
	}
	
	static NSString * const kPinAnnotationIdentifier = @"PinIdentifier";
	MKAnnotationView *draggablePinView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:kPinAnnotationIdentifier];
	
	if (draggablePinView) {
		draggablePinView.annotation = annotation;
	} else {
		// Use class method to create DDAnnotationView (on iOS 3) or built-in draggble MKPinAnnotationView (on iOS 4).
		draggablePinView = [DDAnnotationView annotationViewWithAnnotation:annotation reuseIdentifier:kPinAnnotationIdentifier mapView:self.mapView];
        
		if ([draggablePinView isKindOfClass:[DDAnnotationView class]]) {
			// draggablePinView is DDAnnotationView on iOS 3.
		} else {
			// draggablePinView instance will be built-in draggable MKPinAnnotationView when running on iOS 4.
		}
	}		
	
	return draggablePinView;
}
-(void)updateMapLocation:(CLLocationCoordinate2D)corrdinate
{
	MKCoordinateRegion theRegion;
	theRegion.center = corrdinate;
	
//    MKCoordinateRegion currentregion = mapView.region;
	MKCoordinateSpan theSpan;
//    if (isFirstRun) {
//        theSpan.latitudeDelta = 0.15f;
//        theSpan.longitudeDelta = 0.15f;
//        isFirstRun = false;
//    }else
//    {
//        theSpan.latitudeDelta = currentregion.span.latitudeDelta;
//        theSpan.longitudeDelta = currentregion.span.longitudeDelta;
//    }
    
	theRegion.span = theSpan;
	
	mapView.scrollEnabled = YES;
	mapView.zoomEnabled = YES;
    	mapView.showsUserLocation = YES;
	
	[mapView setRegion:theRegion animated:TRUE];

	
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{ 
	
    
    NSDate* time = newLocation.timestamp;
    NSTimeInterval timePeriod = [time timeIntervalSinceNow];
    if(timePeriod < 2.0 ) { //usually it take less than 0.5 sec to get a new location but you can use any value greater than 0.5 but i recommend 1.0 or 2.0
        
        CLLocationCoordinate2D loc = [newLocation coordinate];
        coodiatex = loc.latitude;
        coodiatey = loc.longitude;
//        [self updateMapLocation:loc];
        
        
        // process the location
    } else {
        // skip the location
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{ 
	
}
- (void)setCurrentLocation:(CLLocation *)location {
    
    MKCoordinateRegion region ;
    
    region.center = location.coordinate;
    
    region.span.longitudeDelta = 0.15f;
    
    region.span.latitudeDelta = 0.15f;
    
    [mapView setRegion:region animated:YES];
    
}
#pragma mark LSBaseProtocolEngineDelegate
- (void)didProtocolEngineFinished:(LSBaseProtocolEngine*)aEngine newData:(id)aData
{
    [self stopWaiting];
    if (_locationPE == aEngine) {
        
        
        [self.delegate refreshInfo];
    }
}

//- (void)didProtocolEngineFailed:(LSBaseProtocolEngine *)aEngine error:(NSError*)aError
//{
//    [self stopWaiting];
//    NSLog(@"%@ didProtocolEngineFailed",[[self class] description]);
//    UIAlertView *errorView;
//    errorView = [[UIAlertView alloc] 
//                 initWithTitle: @"" 
//                 message: [aError description] 
//                 delegate: self 
//                 cancelButtonTitle: @"确定" otherButtonTitles: nil]; 
//    [errorView show];
//    [errorView autorelease];
//}

-(void)setDicToCompanyMap:(NSDictionary*)dic
{
    if (nil == companyDic) {
        companyDic = [[NSMutableDictionary alloc]init ];
    }
    companyDic = [dic mutableCopy];
}
@end
