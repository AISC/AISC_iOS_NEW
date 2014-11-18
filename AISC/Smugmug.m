//
//  Smugmug.m
//  AISCH
//
//  Created by admin on 3/10/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "Smugmug.h"

@interface Smugmug () <UIWebViewDelegate>

@end

@implementation Smugmug
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
    NSURL *url = [NSURL URLWithString:@"http://aiscgallery.smugmug.com/"];
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
