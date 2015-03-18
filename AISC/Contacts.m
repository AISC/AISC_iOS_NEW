//
//  Contacts.m
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "Contacts.h"
#import "ContactsCell.h"

@interface Contacts ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *namesArray;
@property (strong, nonatomic) NSArray *picturesArray;
@property (strong, nonatomic) NSArray *emailsArray;

@end

@implementation Contacts

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait);
}

//-(void)viewDidLayoutSubviews
//{
    //[super viewDidLayoutSubviews];
  //  [self.scrollView layoutIfNeeded];
   
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //10,380,301,80

     self.navigationController.navigationBar.topItem.title =@"Home";
    imageView_main.frame = CGRectMake(10,10,self.view.frame.size.width-20,51 );
    imageView_Andrew.frame = CGRectMake(10,70,self.view.frame.size.width-20,80);
    imageView_Joelle.frame = CGRectMake(10,174,self.view.frame.size.width-20,80);
    imageView_AlanPhan.frame = CGRectMake(10,277,self.view.frame.size.width-20,80);
    imageView_KevinHall.frame = CGRectMake(10,380,self.view.frame.size.width-20,80);
    imageView_KimBane.frame = CGRectMake(10,484,self.view.frame.size.width-20,80);
    imageView_KevinCrouch.frame = CGRectMake(10,584,self.view.frame.size.width-20,80);
    imageView_AlankritAror  .frame = CGRectMake(10,682,self.view.frame.size.width-20,80 );
    
     self.scrollView.frame  = CGRectMake(0, 44+20, self.view.frame.size.width,self.view.frame.size.height);
     self.scrollView.contentSize = CGSizeMake(320, 840);
    
    [scrollView addSubview:imageView_Andrew];
    [scrollView addSubview:imageView_Joelle];
    [scrollView addSubview:imageView_AlanPhan];
    [scrollView addSubview:imageView_KevinHall];
    [scrollView addSubview:imageView_KimBane];
    [scrollView addSubview:imageView_KevinCrouch];
    [scrollView addSubview:imageView_AlankritAror];
    [scrollView addSubview:imageView_main];

    
    
    
    
     [self.view addSubview:scrollView];
    // Do any additional setup after loading the view from its nib.
    

}

-(IBAction)ComposeMailButton:(id)sender
{
    [self mailSend:[sender currentTitle]];
}

-(IBAction)PhoneCallButton:(id)sender
{
    
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"dev %@",[device model]);

        if([[device model] isEqualToString:@"iPhone"])
        {
            [self phoneDialAuto:@"044-22549000"];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Calling feature is not supported by this device "  delegate:self cancelButtonTitle:@"OK"otherButtonTitles: nil];
            [alert show];
        }

}

-(void)mailSend:(NSString *)mailstr
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@""];
        NSArray *toRecipients = [NSArray arrayWithObjects:mailstr, nil];
        [mailer setToRecipients:toRecipients];
        NSString *emailBody = @"";
        [mailer setMessageBody:emailBody isHTML:NO];
        mailer.navigationBar.barStyle = UIBarStyleBlackOpaque;
        
        //[[self navigationController]pushViewController:mailer animated:YES];
    [self presentViewController:mailer animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)phoneDialAuto:(NSString *)phonestr
{
    NSString *teleFormat = @"telprompt://";
    NSString *phoneNumber = [teleFormat stringByAppendingString:phonestr];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
