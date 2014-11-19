//
//  SocialViewController.m
//  AISC
//
//  Created by Zach Whelchel on 11/19/14.
//  Copyright (c) 2014 AISC. All rights reserved.
//

#import "SocialViewController.h"
#import "Web.h"

@interface SocialViewController ()

@end

@implementation SocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        webVC.title = @"Google";
    }

    else if ([segue.identifier isEqualToString:@"Instagram"]) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"http://instagram.com";
        webVC.title = @"Instagram";
    }

    else if ([segue.identifier isEqualToString:@"Twitter"]) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"https://twitter.com/search?q=aischennai&src=typd";
        webVC.title = @"Twitter";
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
