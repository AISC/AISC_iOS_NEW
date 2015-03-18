//
//  Home.m
//  AISCH
//
//  Created by on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "Home.h"
#import <Parse/Parse.h>
#import "Web.h"

@interface Home ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSMutableArray *images;
@property (strong, nonatomic) NSMutableArray *titles;
@property (nonatomic) int currentImage;

@end

@implementation Home

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait);
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Home";
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:56/255.0 green:84/255.0 blue:155/255.0 alpha:1.0];
    if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )
    {
        
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        if( screenHeight < screenWidth ){
            screenHeight = screenWidth;
        }
        
        if( screenHeight > 480 && screenHeight < 667 )
        {
            PFQuery *query = [PFQuery queryWithClassName:@"Iphone5"];
            [query setCachePolicy:kPFCachePolicyNetworkOnly];
            
            [query findObjectsInBackgroundWithBlock:^(NSArray *objectsfive, NSError *error) {
                if (!error)
                {
                    self.images = [[NSMutableArray alloc] initWithCapacity:objectsfive.count];
                    
                    // Do something with the found objects
                    for (PFObject *objectfive in objectsfive)
                    {
                        PFFile *thumbnails = [objectfive objectForKey:@"Images"];
                        [thumbnails getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                            if (!error)
                            {
                                [self.images addObject:[UIImage imageWithData:data]];
                                
                            }
                            else
                            {
                                NSLog(@"Error: %@ %@", error, [error userInfo]);
                            }
                        }];
                    }
                }
                else
                {
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
            NSLog(@"iPhone 5/5s");
        }
        else if ( screenHeight > 480 && screenHeight < 736 )
        {
            PFQuery *query = [PFQuery queryWithClassName:@"Home_Images"];
            //PFUser *user = [PFUser currentUser];
            //[query whereKey:@"user" equalTo:user];
            //[query orderByAscending:@"createdAt"];
            [query setCachePolicy:kPFCachePolicyNetworkOnly];
            
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (!error) {
                    // The find succeeded.
                    //NSLog(@"Successfully retrieved %d photos for iphone 6.", objects.count);
                    
                    //[self.collectionView reloadData];
                    
                    self.images = [[NSMutableArray alloc] initWithCapacity:objects.count];
                    
                    // Do something with the found objects
                    for (PFObject *object in objects) {
                        
                        PFFile *thumbnail = [object objectForKey:@"Images"];
                        [thumbnail getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                            if (!error) {
                                // Now that the data is fetched, update the cell's image property with thumbnail
                                //
                                NSLog(@"Fetching image..");
                                
                                [self.images addObject:[UIImage imageWithData:data]];
                                
                                // NSLog(@"Size of the gridImages array: %d", [self.images count]);
                                
                            } else {
                                // Log details of the failure
                                NSLog(@"Error: %@ %@", error, [error userInfo]);
                            }
                        }];
                    }
                } else {
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];            NSLog(@"iPhone 6");
        }
        else if ( screenHeight > 480 )
        {
            PFQuery *query = [PFQuery queryWithClassName:@"Home_Images"];
            //PFUser *user = [PFUser currentUser];
            //[query whereKey:@"user" equalTo:user];
            //[query orderByAscending:@"createdAt"];
            [query setCachePolicy:kPFCachePolicyNetworkOnly];
            
            [query findObjectsInBackgroundWithBlock:^(NSArray *objectsplus, NSError *error) {
                if (!error) {
                    // The find succeeded.
                    //NSLog(@"Successfully retrieved %d photos for iphone 6.", objectsplus.count);
                    
                    //[self.collectionView reloadData];
                    
                    self.images = [[NSMutableArray alloc] initWithCapacity:objectsplus.count];
                    
                    // Do something with the found objects
                    for (PFObject *objectplus in objectsplus) {
                        
                        PFFile *thumbnail = [objectplus objectForKey:@"Images"];
                        [thumbnail getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                            if (!error) {
                                // Now that the data is fetched, update the cell's image property with thumbnail
                                //
                                NSLog(@"Fetching image..");
                                
                                [self.images addObject:[UIImage imageWithData:data]];
                                
                                // NSLog(@"Size of the gridImages array: %d", [self.images count]);
                                
                            } else {
                                // Log details of the failure
                                NSLog(@"Error: %@ %@", error, [error userInfo]);
                            }
                        }];
                    }
                } else {
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
            NSLog(@"iPhone 6 Plus");
        }
        else
        {
            PFQuery *query = [PFQuery queryWithClassName:@"Iphone4"];
            //PFUser *user = [PFUser currentUser];
            //[query whereKey:@"user" equalTo:user];
            //[query orderByAscending:@"createdAt"];
            [query setCachePolicy:kPFCachePolicyNetworkOnly];
            
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects4, NSError *error) {
                if (!error)
                {
                    // The find succeeded.
                    //NSLog(@"Successfully retrieved %d photos for iphone 4.", objects4.count);
                    
                    //[self.collectionView reloadData];
                    
                    self.images = [[NSMutableArray alloc] initWithCapacity:objects4.count];
                    //NSLog(self.images);
                    // Do something with the found objects
                    
                    for (PFObject *object4 in objects4)
                    {
                        
                        PFFile *thumbnail = [object4 objectForKey:@"Images"];
                        [thumbnail getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                            if (!error)
                            {
                                // Now that the data is fetched, update the cell's image property with thumbnail
                                //
                                NSLog(@"Fetching image..");
                                
                                [self.images addObject:[UIImage imageWithData:data]];
                                
                                // NSLog(@"Size of the gridImages array: %d", [self.images count]);
                                
                            }
                            else
                            {
                                // Log details of the failure
                                NSLog(@"Error: %@ %@", error, [error userInfo]);
                            }
                        }];
                    }
                }
                else
                {
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
            NSLog(@"iPhone 4/4s");
        }
    }
    
    

   // self.images = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"banner1.jpg"], [UIImage imageNamed:@"banner2.jpg"], [UIImage imageNamed:@"banner3.jpg"], [UIImage imageNamed:@"banner4.jpg"], nil];
    
    self.titles = [NSMutableArray arrayWithObjects:@"Courage", @"Compassion", @"Creativity", @"Confidence", nil];
    
    self.imageView.image = [self.images objectAtIndex:self.currentImage];
    self.label.text = [self.titles objectAtIndex:self.currentImage];

    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
}

-(void)changeImage
{
    if (self.currentImage == self.images.count - 1) {
        self.currentImage = 0;
    }
    else {
        self.currentImage++;
    }

    [UIView transitionWithView:self.imageView duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.imageView.image = [self.images objectAtIndex:self.currentImage];
    } completion:^(BOOL done) {}];
    
    
    [UIView transitionWithView:self.label duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.label.text = [self.titles objectAtIndex:self.currentImage];
    } completion:^(BOOL done) {}];

}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Photos"]) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"http://aiscgallery.smugmug.com/";
        webVC.title = @"Photos";
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
