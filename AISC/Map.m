//
//  Map.m
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "Map.h"

@interface Map ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation Map

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)shouldAutorotate{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations{
    return (UIInterfaceOrientationMaskPortrait);
}
- (void)viewDidLoad
{
      self.navigationController.navigationBar.topItem.title =@"Home";
    self.title  =@"Locate us";
    
    UITapGestureRecognizer* phoneLblGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PhoneLblTapped:)];
    // if labelView is not set userInteractionEnabled, you must do so
    [PhoneLabel setUserInteractionEnabled:YES];
    [PhoneLabel addGestureRecognizer:phoneLblGesture];
    
//    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 170, 320, 420)];
    self.mapView.mapType = MKMapTypeHybrid;
    
    CLLocationCoordinate2D coord = {.latitude =  12.982186, .longitude =  80.246433};
    MKCoordinateSpan span = {.latitudeDelta =  0.01, .longitudeDelta =  0.01};
    MKCoordinateRegion region = {coord, span};
    
    [self.mapView setRegion:region];
    [self.view addSubview:self.mapView];
    
    double lon = 80.246433;
    double lat = 12.982186;
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D location;
    location.latitude = lat;
    location.longitude = lon;
    [point setCoordinate:(location)];
    [point setTitle:@"American International School"];
    [point setSubtitle:@"Taramani, Chennai, India"];
    [self.mapView addAnnotation:point];
    
    
    [self.mapView selectAnnotation:point animated:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)directionsClicked:(id)sender {
    
    
    double lon = 80.246433;
    double lat = 12.982186;
    
    NSString *appleLink2 = [NSString stringWithFormat: @"http://maps.apple.com/maps?daddr=%f,%f", lat   , lon];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appleLink2]];

    
//    NSString* addr = [NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%1.6f,%1.6f&saddr=Posizione attuale", 12.981727,80.246396];
//    NSURL* url = [[NSURL alloc] initWithString:[addr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    //[[UIApplication sharedApplication] openURL:url];
    
}

-(IBAction)PhoneLblTapped:(id)sender
{
    
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"dev %@",[device model]);
    
    if([[device model] isEqualToString:@"iPhone"])
    {
        [self phoneDialAuto:@"044-22549000"];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Calling feature is not supported by this device "  delegate:self cancelButtonTitle:@"OK"otherButtonTitles: nil];
        [alert show];
    }

}
-(void)phoneDialAuto:(NSString *)phonestr
{
    NSString *teleFormat = @"telprompt://";
    NSString *phoneNumber = [teleFormat stringByAppendingString:phonestr];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
