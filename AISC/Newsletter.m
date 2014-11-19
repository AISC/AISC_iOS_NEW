//
//  UPComingEvents.m
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "Newsletter.h"
#import "Web.h"
#import "NewsletterCell.h"

@interface Newsletter ()

@end

@implementation Newsletter
//@synthesize isPassword;

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
    arrayValue = [[NSMutableArray alloc] init];
    [arrayValue addObject:@"Head of School's Newsletter"];
    [arrayValue addObject:@"Elementary School Principal's Newsletter"];
    [arrayValue addObject:@"Middle School Principal's Newsletter"];
    [arrayValue addObject:@"High School Principal's Newsletter"];
    [arrayValue addObject:@"PCA Newsletter"];

    arrayValueImages = [[NSMutableArray alloc] init];
    [arrayValueImages addObject:[UIImage imageNamed:@"hos.png"]];
    [arrayValueImages addObject:[UIImage imageNamed:@"ES.png"]];
    [arrayValueImages addObject:[UIImage imageNamed:@"MS.png"]];
    [arrayValueImages addObject:[UIImage imageNamed:@"hs.png"]];
    [arrayValueImages addObject:[UIImage imageNamed:@"pca.png"]];
    

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayValue count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsletterCell";
    NewsletterCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[NewsletterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    cell.titleLabel.text = [arrayValue objectAtIndex:indexPath.row];
    [cell.iconImageView setImage:[arrayValueImages objectAtIndex:indexPath.row]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if (MyTable.indexPathForSelectedRow.row == 0) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"http://hosnewsletter.blogspot.in/";
        webVC.title = @"HOS";
    }
    
    else if (MyTable.indexPathForSelectedRow.row == 1) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"http://es-principal-notes.blogspot.in/";
        webVC.title = @"ES";
    }
    
    else if (MyTable.indexPathForSelectedRow.row == 2) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"http://ms-principal-notes.blogspot.in/";
        webVC.title = @"MS";
    }
    
    else if (MyTable.indexPathForSelectedRow.row == 3) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"http://aischsprincipal.blogspot.in/";
        webVC.title = @"HS";
    }
    
    else if (MyTable.indexPathForSelectedRow.row == 4) {
        Web *webVC = (Web *)segue.destinationViewController;
        webVC.urlString = @"http://aiscptonews.blogspot.in/";
        webVC.title = @"PCA";
    }

}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"PasswordEntered"]) {

        [self performSegueWithIdentifier:@"Web" sender:self];

    }
    else {
        UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Enter Password" message:@"You only have to enter this password once then you can look at any Newsletter." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [dialog setAlertViewStyle:UIAlertViewStylePlainTextInput];
        
        // Change keyboard type
        [[dialog textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeAlphabet];
        [dialog show];
    }
    
    
    
    
}



-(void)showAlertWithTextField{
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1)
    {
        if ([[[alertView textFieldAtIndex:0]text] isEqualToString:@"raptors14"]) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"PasswordEntered"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Correct" message:@"You can now view any Newsletter." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [dialog show];
        }
        else {
            UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Wrong Password" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [dialog show];
        }
    }
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
