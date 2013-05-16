//
//  MapAdressViewController.m
//  Locoso
//
//  Created by yongchang hu on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapAdressViewController.h"
#import "AddressAnnotation.h"
#import "MapHelper.h"
@implementation MapAdressViewController
@synthesize map,mapx,mapy,mapAdress;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)doBack: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES]; 
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    /////////////////////
//    UIImage* image= [UIImage imageNamed:@"back_icon.png"]; 
//    CGRect frame_1= CGRectMake(0, 0, image.size.width, image.size.height); 
//    UIButton* backButton= [[UIButton alloc] initWithFrame:frame_1]; 
//    [backButton setBackgroundImage:image forState:UIControlStateNormal]; 
//    
//    [backButton addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside]; 
//    
//    //定制自己的风格的 UIBarButtonItem
//    UIBarButtonItem* someBarButtonItem= [[UIBarButtonItem alloc] initWithCustomView:backButton]; 
//    [self.navigationItem setLeftBarButtonItem:someBarButtonItem]; 
//    [someBarButtonItem release]; 
//    [backButton release]; 
    ////////////////////////
    // Do any additional setup after loading the view from its nib.
    // Start the location manager.
	
//	locationManager = [[CLLocationManager alloc] init]; 
//	[locationManager setDelegate:self]; 
//	[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];	
//	[locationManager startUpdatingLocation];
    
    
    CGRect rect = CGRectMake(0, 0, 320, 460);
	map = [[MKMapView alloc]initWithFrame:rect];
	[map setDelegate:self];
	[map setMapType:MKMapTypeStandard];
	
	
	
	
	// If it's not possible to get a location, then return.
//	CLLocation *location = [locationManager location];
	
	// Configure the new event with information from the location.
	CLLocationCoordinate2D theCenter;/* = [location coordinate];*/
    theCenter.latitude = [mapx floatValue];
    theCenter.longitude = [mapy floatValue];
    
//	if (!location) {
//		theCenter.latitude = 35.6725;
//		theCenter.longitude = 139.6624;

//	}
	if ([mapx isEqualToString:@""] || ![mapy isEqualToString:@""]) 
    {
        
        theCenter = [MapHelper getPostion:mapAdress];
//                theCenter.latitude = 31.34370298029150;
//                theCenter.longitude = 120.6149979802915;

    }else
    {
//        theCenter.latitude = 35.6725;
//        theCenter.longitude = 139.6624;
        //        theCenter.latitude = [mapx floatValue];
        //        theCenter.longitude = [mapy floatValue];
    }
    
	[self updateMapLocation:theCenter];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title =@"地图";
    
    
}

-(void)updateMapLocation:(CLLocationCoordinate2D)corrdinate
{
	MKCoordinateRegion theRegion;
	theRegion.center = corrdinate;
	
	MKCoordinateSpan theSpan;
	theSpan.latitudeDelta = 0.08;
	theSpan.longitudeDelta = 0.08;
	theRegion.span = theSpan;
	
	map.scrollEnabled = YES;
	map.zoomEnabled = YES;
	map.showsUserLocation = YES;
	
	[map setRegion:theRegion];
	[map regionThatFits:theRegion];
	

	[self.view addSubview:map];
	
	
	//add animation
	AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:corrdinate];
	[map addAnnotation:addAnnotation];
	[addAnnotation release];
	
}
- (void)dealloc {
	[map release];
	[locationManager release];
    [super dealloc];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    map = nil;
    locationManager = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark MAP
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
	if( [[annotation title] isEqualToString:@"Current Location"] )
	{
		return nil;
	}
	
	MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"currentloc"];
	
	if( pin == nil )
	{
		pin = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"] autorelease];
	}
	
    pin.animatesDrop = YES;
    pin.canShowCallout = YES;
	
	pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
    return pin;
}



- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{ 
	CLLocationCoordinate2D loc = [newLocation coordinate];
	[self updateMapLocation:loc];
	
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{ 
	
}

-(void)setMapLocation:(NSString*)mapxx y:(NSString*)mapyy
{
    if (mapxx == nil || mapyy ==  nil) {
        return;
    }
//    [mapx release];
//    [mapy release];
//    mapx = [[NSString alloc]initWithString:mapxx];
//    mapy = [[NSString alloc]initWithString:mapyy];
    self.mapx = mapxx;
    self.mapy = mapyy;
    NSLog(mapx,mapy);
}
-(void)setAdress:(NSString*)adress
{
    self.mapAdress = adress;
    NSLog(@"adress = %@",adress);
}
@end
