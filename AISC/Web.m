//
//  Smugmug.m
//  AISCH
//
//  Created by admin on 3/10/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "Web.h"
#import "Reachability.h"

@interface Web () <UIWebViewDelegate>

@end

@implementation Web
@synthesize m_activity;

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

    
    Reachability* reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert!" message:@"Your phone does not currently have an Internet connection. Please connect and try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = 153;
        [alert show];
        return;
    }

        
    if([self.urlString isEqualToString:@"http://aiscgallery.smugmug.com/"])
    {
        self.navigationController.navigationBar.topItem.title = @"Home";
    }
    else
    {
        self.navigationController.navigationBar.topItem.title = @"Back";
    }
    
    NSLog(@"==>%@",self.urlString );
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    m_activity.hidden= TRUE;
    [m_activity stopAnimating];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    m_activity.hidden= FALSE;
    [m_activity startAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    m_activity.hidden= TRUE;
    [m_activity stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
