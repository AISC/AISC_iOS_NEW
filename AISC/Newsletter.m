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

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface Newsletter ()
{
    NSMutableArray  *colorArray;
    NSMutableArray *nameArray;
    UILabel *navLabel;
}
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
-(void)awakeFromNib
{
     self.navigationController.navigationBar.topItem.title =@"";
}
-(BOOL)shouldAutorotate{
    return NO;
}




-(void)viewWillDisappear:(BOOL)animated
{
    
  
    
    
    [navLabel removeFromSuperview];
    
}
-(void)viewDidAppear:(BOOL)animated
{ self.title  =@"";
     self.navigationController.navigationBar.topItem.title =@"";
   
    
    [super viewDidAppear:YES];
}
- (IBAction)backAction
{
    [self.navigationController  popToRootViewControllerAnimated:YES];
}
     

-(void)viewWillAppear:(BOOL)animated
{
     self.title  =@"";
    self.navigationController.navigationBar.topItem.title =@"";
    
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStyleBordered target:self action:@selector(Back)];
//    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_navi.png"]
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(backAction)];
    
    self.navigationItem.leftBarButtonItem = backButton;

    
    ///back_Label
  // self.navigationController.navigationBar.topItem.title =@"Back";
    navLabel = [[UILabel alloc] initWithFrame:CGRectMake(80,4,150,30)];
    navLabel.text = @"Newsletters";
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.font  =[UIFont fontWithName:@"HelveticaNeue-Bold" size:22];
    navLabel.backgroundColor =[ UIColor clearColor];
    navLabel.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:navLabel];
 
    [super viewWillAppear:YES];
    
}
-(NSUInteger)supportedInterfaceOrientations{
    return (UIInterfaceOrientationMaskPortrait);
}
- (void)viewDidLoad
{
    [self.navigationItem setHidesBackButton:YES];
    self.title  =@"";
    self.navigationController.navigationBar.topItem.title =@"";
    
    arrayValue = [[NSMutableArray alloc] init];
    [arrayValue addObject:@"Head of School's Newsletter"];
    [arrayValue addObject:@"Elementary School Principal's Newsletter"];
    [arrayValue addObject:@"Middle School Principal's Newsletter"];
    [arrayValue addObject:@"High School Principal's Newsletter"];
    [arrayValue addObject:@"PCA Newsletter"];

    arrayValueImages = [[NSMutableArray alloc] init];
    [arrayValueImages addObject:[UIImage imageNamed:@"Head.png"]];
    [arrayValueImages addObject:[UIImage imageNamed:@"e.png"]];
    [arrayValueImages addObject:[UIImage imageNamed:@"m.png"]];
    [arrayValueImages addObject:[UIImage imageNamed:@"h.png"]];
    [arrayValueImages addObject:[UIImage imageNamed:@"p.png"]];
    
    
        nameArray =[[NSMutableArray alloc]init];
        [nameArray addObject:@"Andrew Hoover"];
        [nameArray addObject:@"Kevin Hall"];
        [nameArray addObject:@"Alan Phan"];
        [nameArray addObject:@"Joelle Basnight"];
        [nameArray addObject:@"PCA President"];
    
    
    
  colorArray = [[NSMutableArray alloc]init];
    
    
    [colorArray   addObject:UIColorFromRGB(0X36559e)];
      [colorArray   addObject:UIColorFromRGB(0X0c7a3c)];
      [colorArray   addObject:UIColorFromRGB(0Xe05e26)];
      [colorArray   addObject:UIColorFromRGB(0X961d1f)];
      [colorArray   addObject:UIColorFromRGB(0X36559e)];
    
    
    self.view.backgroundColor = UIColorFromRGB(0Xd7d9d9);

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
    cell.contentView.backgroundColor  = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cbg.png"]];
    cell.titleLabel.text = [arrayValue objectAtIndex:indexPath.row];
    [cell.iconImageView setImage:[arrayValueImages objectAtIndex:indexPath.row]];
    cell.NameLabel.textColor =[colorArray objectAtIndex:indexPath.row];
    
      cell.NameLabel.text =[nameArray objectAtIndex:indexPath.row];
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
    
  //  if([[NSUserDefaults standardUserDefaults] boolForKey:@"PasswordEntered"]) {

        [self performSegueWithIdentifier:@"Web" sender:self];

////    }
////    else {
//        UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Enter Password" message:@"You only have to enter this password once then you can look at any Newsletter." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//        [dialog setAlertViewStyle:UIAlertViewStylePlainTextInput];
//        
//        // Change keyboard type
//        [[dialog textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeAlphabet];
//        [dialog show];
//    }
//    
//    
    
    
}



-(void)showAlertWithTextField{
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1)
    {
        if ([[[alertView textFieldAtIndex:0]text] isEqualToString:@"raptors15"]) {
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
