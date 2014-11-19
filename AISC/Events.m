//
//  Events.m
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "Events.h"
#import "Reachability.h"
#import "EventCell.h"

@interface Events ()

@end

@implementation Events

@synthesize activityIndicatorObject;

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
    activityIndicatorObject = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    // Set Center Position for ActivityIndicator
    activityIndicatorObject.center = CGPointMake(150, 275);
    [self.view addSubview:activityIndicatorObject];
    [activityIndicatorObject startAnimating];
    
    
    MyTable.hidden = YES;
    EventNameArray = [[NSMutableArray alloc] init];
    EventDateArray = [[NSMutableArray alloc] init];
    
    SelectEventNameArray = [[NSMutableArray alloc] init];
    SelectEventDateArray = [[NSMutableArray alloc] init];
    arrrrrr = [[NSMutableArray alloc] init];
    
    [self updateDataFromParse];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 153) {
        
        if ([[UIScreen mainScreen]bounds].size.height==568) {
            homeObj = [[Home alloc] initWithNibName:@"Home" bundle:nil];
            [self presentViewController:homeObj animated:NO completion:nil];
        }else{
            
            homeObj = [[Home alloc] initWithNibName:@"Home_iPhone4" bundle:nil];
            [self presentViewController:homeObj animated:NO completion:nil];
            
        }

        
        
    }
    
    
}
//- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
//{
//    NSLog(@"Logging in, so clearing cache.");
//    [PFQuery clearAllCachedResults];
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}

- (void)updateDataFromParse
{
    NSMutableArray *allObjects = [NSMutableArray array];
    NSUInteger limit = 20;
    NSUInteger skip = 0;
    PFQuery *query1 = [PFQuery queryWithClassName:@"AISCHEvent"];
    [query1 setLimit: limit];
    [query1 setSkip: skip];
    
    query1.cachePolicy = kPFCachePolicyNetworkElseCache;
    
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [allObjects addObjectsFromArray:objects];
            
            NSDictionary *eventNameDict;
            NSDictionary *eventDateDict;
            
            for(int i=0; i<[allObjects count];i++)
            {
                eventNameDict= [allObjects objectAtIndex:i];
                eventDateDict= [allObjects objectAtIndex:i];
                
                [EventNameArray addObject:[eventNameDict objectForKey:@"EventName"]];
                [EventDateArray addObject:[eventDateDict objectForKey:@"EventDate"]];
                
            }
            [activityIndicatorObject stopAnimating];
            
            MyTable.hidden = NO;            
            [MyTable reloadData];
            
            if ([[UIScreen mainScreen]bounds].size.height==568) {
            }
            else{
                MyTable.frame = CGRectMake(MyTable.frame.origin.x, MyTable.frame.origin.y, MyTable.frame.size.width, 380);
            }

        }
        else {
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
             NSLog(@"the Error is: %@", error);
            
             NSLog(@"the user info is: %@", [error userInfo]);
            
            NSLog(@"th error localized string is :%@",[error localizedDescription]);
            
            Reachability* reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
            NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
            
                if(remoteHostStatus == NotReachable)
                    {
                       UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert!" message:@"Your phone does not currently have an Internet connection. Please connect and try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        alert.tag = 153;
                       [alert show];
                    }

        }
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [EventNameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EventCell";
    EventCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[EventCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    cell.eventNameLabel.text = [EventNameArray objectAtIndex:indexPath.row];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd-MM-yyyy hh:mm a"];
    NSDate *now = [EventDateArray objectAtIndex:indexPath.row];
    NSString *nsstr = [format stringFromDate:now];
    cell.eventDateLabel.text = nsstr;

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    BOOL eventIsSaved = NO;
    
    if (eventIsSaved) {
        cell.backgroundColor = [UIColor lightGrayColor];
    }
    else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)path {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:path];
    
    
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [SelectEventNameArray removeObject:[EventNameArray objectAtIndex:path.row]];
        [SelectEventDateArray removeObject:[EventDateArray objectAtIndex:path.row]];
        
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [SelectEventNameArray addObject:[EventNameArray objectAtIndex:path.row]];
        [SelectEventDateArray addObject:[EventDateArray objectAtIndex:path.row]];
        
    }
    
//    NSLog(@"SelectEventNameArray %@", SelectEventNameArray);
//    NSLog(@"SelectEventDateArray %@", SelectEventDateArray);
    
}

-(IBAction)BackButton:(id)sender
{
    if ([[UIScreen mainScreen]bounds].size.height==568) {
        homeObj = [[Home alloc] initWithNibName:@"Home" bundle:nil];
        [self presentViewController:homeObj animated:NO completion:nil];
    }else{
        
        homeObj = [[Home alloc] initWithNibName:@"Home_iPhone4" bundle:nil];
        [self presentViewController:homeObj animated:NO completion:nil];
        
    }
}

-(IBAction)AddEventCalendar:(id)sender
{
    //Create the Event Store
    EKEventStore *eventStore = [[EKEventStore alloc]init];
    
    //Check if iOS6 or later is installed on user's device *******************
    if([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
        
        //Request the access to the Calendar
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted,NSError* error){
            
            //Access not granted-------------
            if(!granted){
                NSString *message = @"Hey! I Can't access your Calendar... check your privacy settings to let me in!";
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:message
                                                                  delegate:self
                                                         cancelButtonTitle:@"Ok"
                                                         otherButtonTitles:nil,nil];
                //Show an alert message!
                //UIKit needs every change to be done in the main queue
                dispatch_async(dispatch_get_main_queue(), ^{
                    [alertView show];
                }
                               );
                
                //Access granted------------------
            }else{
                
                //Create the event and set the Label message
                NSString *labelText;
                
                //Event created
                if([self createEvent:eventStore]){
                    if ([SelectEventNameArray count] == 0) {
                        
                        labelText = [NSString stringWithFormat:@"Please select event(s) to add into your iPhone Calendar."];
                    }
                     else if ([arrrrrr count] == [SelectEventNameArray count] && [SelectEventNameArray count]>0)
                    {
                        labelText = [NSString stringWithFormat:@"%lu Event(s) added into your iPhone Calendar.",(unsigned long)[arrrrrr count]];
                        
                    }else if ([arrrrrr count] < [SelectEventNameArray count] && [arrrrrr count] > 0){
                        
                        
                        unsigned long oldevents =(unsigned long)([SelectEventNameArray count] - [arrrrrr count]);
                        
                        labelText = [NSString stringWithFormat:@"%lu New event(s) added into your iPhone Calendar. %lu event(s) already exits in your iPhone Calendar.",(unsigned long)[arrrrrr count],oldevents];
                    }
                    else if([arrrrrr count]==0)
                    {
                         labelText = @"The selected event(s) already exits in your iPhone Calendar.";
                    }
                        
                    
                }
                else{
                    labelText = @"Events Unable to add, Check your internet Connection";
                }
                
                //Add the Label to the controller view
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert !"
                                                                    message:labelText
                                                                   delegate:self
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];
                    
                    
                    [arrrrrr removeAllObjects];
                    
                });
            }
        }];
        
    }
    
    //************************** Device prior to iOS 6.0 *********************************************
    else{
        [self createEvent:eventStore];
    }
    
}

-(BOOL)createEvent:(EKEventStore*)eventStore{
    
    NSDate* endDate =  [NSDate dateWithTimeIntervalSinceNow:[[NSDate distantFuture] timeIntervalSinceReferenceDate]];
    NSPredicate *fetchCalendarEvents = [eventStore predicateForEventsWithStartDate:[NSDate date] endDate:endDate calendars:nil];
    NSArray *eventList = [eventStore eventsMatchingPredicate:fetchCalendarEvents];
    
    NSMutableArray *titlesArray = [[NSMutableArray alloc] init];
    
    NSMutableArray *datesArray = [[NSMutableArray alloc] init];
    
    for (int j = 0;j<[eventList count];j++)
    {
        
        [titlesArray addObject:[[eventList objectAtIndex:j]valueForKey:@"title"]];
        [datesArray addObject:[[eventList objectAtIndex:j]valueForKey:@"startDate"]];
        
    }
    
    for (int i=0; i<[SelectEventNameArray count]; i++) {
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"dd-MM-yyyy hh:mm a"];
        NSDate *now = [SelectEventDateArray objectAtIndex:i];
        
        EKEvent *event = [EKEvent eventWithEventStore:eventStore];
        event.title = [SelectEventNameArray objectAtIndex:i];
        event.startDate = now;
        event.endDate = [event.startDate dateByAddingTimeInterval:3600];
        event.calendar = [eventStore defaultCalendarForNewEvents];
        
        NSError *error;
        
        if ([eventList count] == 0) {
            [eventStore saveEvent:event span:EKSpanThisEvent error:&error];
            [arrrrrr addObject:eventStore];
        }
        
        else{
        
            if (![titlesArray containsObject:[SelectEventNameArray objectAtIndex:i]] || ![datesArray containsObject:[SelectEventDateArray objectAtIndex:i]] )
            {
                [eventStore saveEvent:event span:EKSpanThisEvent error:&error];
                [arrrrrr addObject:eventStore];
            }
        }
        
    }
    
    return YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
