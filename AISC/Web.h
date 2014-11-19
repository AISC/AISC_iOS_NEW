//
//  Smugmug.h
//  AISCH
//
//  Created by admin on 3/10/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Web : UIViewController
{
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *m_activity;
}

-(IBAction)BackButton:(id)sender;

@property (nonatomic, retain) UIActivityIndicatorView *m_activity;


@property (nonatomic, retain) NSString *urlString;

//


@end
