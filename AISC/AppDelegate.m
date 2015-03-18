//
//  AppDelegate.m
//  AISC
//
//  Created by Zach Whelchel on 11/17/14.
//  Copyright (c) 2014 AISC. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "dbconnection.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Avenir" size:24], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
  

    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent];
    

    [Parse setApplicationId:@"swB5Fu5IOlTM0MgheImLwSlnjfnzTHX5nDM7BOrz"
                  clientKey:@"USccGbNybTiis12WcDXMcqo37K7gHug8ZVpjUtRz"];
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
//    swB5Fu5IOlTM0MgheImLwSlnjfnzTHX5nDM7BOrz
//    
//    USccGbNybTiis12WcDXMcqo37K7gHug8ZVpjUtRz
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    
   
    NSUserDefaults   *defaluts;
    defaluts =[NSUserDefaults standardUserDefaults];
    
    if([[defaluts valueForKey:@"Remember_Me"]isEqualToString:@"one"])
    {
   
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setValue:@"zero"  forKey:@"Remember_Me"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"push---------%@",userInfo);
    
    
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    
    [dateformate setDateFormat:@"dd/MM/YYYY hh:mm a"];
    
    NSString *date_String=[dateformate stringFromDate:[NSDate date]];
    
    NSLog(@"%@",date_String);
     [PFPush handlePush:userInfo];
    
    NSLog(@"userInfo==>%@",userInfo);
    
    NSDictionary *dic;
    NSString *strtemp;
    for (id key in userInfo)
    {
        dic=[userInfo objectForKey:key];
        strtemp=[NSString stringWithFormat:@"%@",[dic valueForKey:@"alert"]];
        NSLog(@"notification string :%@",strtemp);
        dbconnection    *dbobject =[[dbconnection alloc]init];

        
        
        [dbobject insertbookMark:strtemp date:date_String];
        
        
       // -(BOOL)insertbookMark:(NSString *)notificationTitle date:(NSString *)notificationDate
        
        //        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        //        [defaults setValue:strtemp forKey:@"Message"];
        //        [defaults synchronize];
//        [self createDatabase];
//        NSString *sql = [NSString stringWithFormat:@"INSERT INTO tableMsg ('Message') VALUES ('%@')",strtemp];
//        NSLog(@"%@",sql);
//        [self Insertdata:sql];
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notification" message:strtemp delegate:self cancelButtonTitle:@"Exit" otherButtonTitles:@"Read", nil];
       // [alert show];
    }
    
    
    UIApplicationState appState=[application applicationState];
    if (appState==UIApplicationStateInactive)
    {
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"pushTOnoti" object:Nil];
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        
    }
    if (appState==UIApplicationStateBackground)
    {
        dbconnection *dbobject  =[[dbconnection alloc]init];
        [UIApplication sharedApplication].applicationIconBadgeNumber= [[dbobject getallRecords] count];
    }
    
    
    
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    currentInstallation.channels = @[ @"global" ];
    [currentInstallation saveInBackground];
}
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
//    [PFPush handlePush:userInfo];
//}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    if (currentInstallation.badge != 0) {
        currentInstallation.badge = 0;
        [currentInstallation saveEventually];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
