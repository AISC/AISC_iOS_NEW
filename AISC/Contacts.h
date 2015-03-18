//
//  Contacts.h
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface Contacts : UIViewController <MFMailComposeViewControllerDelegate, UIScrollViewDelegate>
{
   IBOutlet UIScrollView *scrollView;
    
    IBOutlet UIImageView *imageView_main;
    
    IBOutlet UIImageView *imageView_Andrew;
   IBOutlet UIImageView *imageView_Joelle;
   IBOutlet UIImageView *imageView_AlanPhan;
   IBOutlet UIImageView *imageView_KevinHall;
   IBOutlet UIImageView *imageView_KimBane;
    IBOutlet UIImageView *imageView_KevinCrouch;

   IBOutlet UIImageView *imageView_AlankritAror;

    
}

-(IBAction)ComposeMailButton:(id)sender;
@property(nonatomic,retain)UIScrollView *scrollView;
@end
