//
//  LiveEventViewController.h
//  AISC
//
//  Created by Griffin Laptop 1 on 8-1-15.
//  Copyright (c) 2015 AISC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface LiveEventViewController : UIViewController<UIWebViewDelegate>
{

    IBOutlet UIButton *btn;
    IBOutlet UILabel *lbl1;
    IBOutlet UILabel *lbl2;
    IBOutlet UIWebView *webView;
    NSMutableArray *LinkArray;
    IBOutlet UIActivityIndicatorView *m_activity;
    IBOutlet UIImageView *imgView;
    IBOutlet UILabel *liveStream;
    
}


-(IBAction)ClickAction:(id)sender;

@property (nonatomic,retain) UIActivityIndicatorView *m_activity;
@property (nonatomic,retain) UIActivityIndicatorView *activityIndicatorObject;


@end
