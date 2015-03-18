//
//  SocialViewController.m
//  AISC
//
//  Created by Zach Whelchel on 11/19/14.
//  Copyright (c) 2014 AISC. All rights reserved.
//

#import "SocialViewController.h"
#import "Web.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface SocialViewController ()

@end

@implementation SocialViewController


-(void)viewWillAppear:(BOOL)animated
{
       self.title=@"";
    self.navigationController.navigationBar.topItem.title =@"";

    back_Label = [[UILabel alloc] initWithFrame:CGRectMake(14,6,70,30)];
    //navLabel.text = @"Social Media";
    back_Label.backgroundColor =[UIColor redColor];
    back_Label.text = @"Home";
    back_Label.textAlignment = NSTextAlignmentCenter;
    back_Label.font  =[UIFont fontWithName:@"HelveticaNeue" size:18];
  back_Label.backgroundColor =[ UIColor clearColor];
    back_Label.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:back_Label];
    
  
    nav_Label = [[UILabel alloc] initWithFrame:CGRectMake(80,6,self.view.frame.size.width-150,30)];
    nav_Label.text = @"Social Media";
    nav_Label.textAlignment = NSTextAlignmentCenter;
    nav_Label.font  =[UIFont fontWithName:@"HelveticaNeue-Bold" size:22];
    nav_Label.backgroundColor =[ UIColor clearColor];
    nav_Label.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:nav_Label];
     [super viewWillAppear:YES];
    
}
-(void)viewDidAppear:(BOOL)animated
{   self.title=@"";
    
    self.navigationController.navigationBar.topItem.title =@"";
    
    [super viewDidAppear:YES];
}
- (void)viewDidLoad {
  
    
   self.title=@"";
    
    self.navigationController.navigationBar.topItem.title =@"";
    
    
    self.view.backgroundColor = UIColorFromRGB(0X36559e);
 
        [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillDisappear:(BOOL)animated
{
    [back_Label  removeFromSuperview];
    [nav_Label  removeFromSuperview];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Facebook"]) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"https://www.facebook.com/pages/American-International-School-Chennai/550697601613642";
        webVC.title = @"Facebook";
    }
    
    else if ([segue.identifier isEqualToString:@"Google"]) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"https://plus.google.com/+AischOrgPage/posts";
        webVC.title = @"Google+";
    }

    else if ([segue.identifier isEqualToString:@"Instagram"]) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"http://instagram.com/aischennai";
        webVC.title = @"Instagram";
    }

    else if ([segue.identifier isEqualToString:@"Twitter"]) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"https://twitter.com/search?q=aischennai&src=typd";
        webVC.title = @"Twitter"; 
    }
    
    else if ([segue.identifier isEqualToString:@"Youtube"]) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"https://www.youtube.com/channel/UCYyOwWYsuhLJ2TqU3KPPJwQ";
        webVC.title = @"Youtube";
    }
    
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
