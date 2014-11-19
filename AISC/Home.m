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

    self.images = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"banner1.jpg"], [UIImage imageNamed:@"banner2.jpg"], [UIImage imageNamed:@"banner3.jpg"], [UIImage imageNamed:@"banner4.jpg"], nil];
    
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
