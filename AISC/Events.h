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
    
    NSMutableArray *arr;
    
    IBOutlet UITableView *MyTable;
    
    NSArray *events;
    NSMutableArray *titlesArray1;
    
    NSMutableArray *datesArray1;
    
    NSMutableArray *arSelectedRows;
    
    NSString     *alertTitle;
}

-(IBAction)BackButton:(id)sender;
-(IBAction)AddEventCalendar:(id)sender;

@property (nonatomic,retain) UIActivityIndicatorView *activityIndicatorObject;

@end
