//
//  Events.h
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <EventKit/EventKit.h>
#import "Home.h"

@class Home;
@interface Events : UIViewController<UITableViewDataSource, UITableViewDelegate,UIAlertViewDelegate>
{
    Home *homeObj;
    NSMutableArray *EventNameArray;
    NSMutableArray *EventDateArray;
    
    NSMutableArray *SelectEventNameArray;
    NSMutableArray *SelectEventDateArray;
    
    NSMutableArray *arrrrrr;
    
    IBOutlet UITableView *MyTable;
    
    NSArray *events;
}

-(IBAction)BackButton:(id)sender;
-(IBAction)AddEventCalendar:(id)sender;

@property (nonatomic,retain) UIActivityIndicatorView *activityIndicatorObject;

@end
