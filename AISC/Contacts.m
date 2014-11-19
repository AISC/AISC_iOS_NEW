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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.namesArray = @[@"Andrew Hoover", @"Joelle Basnight", @"Alan Phan", @"Kevin Hall", @"Kim Bane", @"Kevin Crouch", @"Alankrit Arora"];
    
    self.picturesArray = @[@"hoover3.jpg", @"Basnight_Joelle.jpg", @"alan.jpg", @"kevin hall.jpg", @"Kim Bane.jpg", @"kevin.jpg", @"Alankrit.jpg"];
    
    self.emailsArray = @[@"headofschool@aisch.org", @"hsprincipal@aisch.org", @"msprincipal@aisch.org", @"esprincipal@aisch.org", @"bkim@aisch.org", @"itdirector@aisch.org", @"directorofbuisnessaffairs@aisch.org"];

}

-(void)ComposeMailButton:(id)sender
{
    [self mailSend:[sender currentTitle]];
}

-(IBAction)PhoneCallButton:(id)sender
{
    [self phoneDialAuto:@"044-22549000"];
}

-(void)mailSend:(NSString *)mailstr
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@""];
        NSArray *toRecipients = [NSArray arrayWithObjects:mailstr, nil];
        [mailer setToRecipients:toRecipients];
        NSString *emailBody = @"";
        [mailer setMessageBody:emailBody isHTML:NO];
        mailer.navigationBar.barStyle = UIBarStyleBlackOpaque;
        [self presentViewController:mailer animated:NO completion:nil];
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.namesArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell"];
    
    cell.nameLabel.text = [self.namesArray objectAtIndex:indexPath.row];
    cell.pictureImageView.image = [UIImage imageNamed:[self.picturesArray objectAtIndex:indexPath.row]];
    [cell.emailButton setTitle:[self.emailsArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];

    cell.emailButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    cell.emailButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    [cell.emailButton addTarget:self action:@selector(ComposeMailButton:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}











@end
