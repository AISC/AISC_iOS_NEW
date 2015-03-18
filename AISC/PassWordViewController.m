//
//  PassWordViewController.m
//  AISC
//
//  Created by Griffin Laptop 1 on 8-1-15.
//  Copyright (c) 2015 AISC. All rights reserved.
//

#import "PassWordViewController.h"

@interface PassWordViewController ()
{
    UILabel  *nav_Label;
    UILabel  *back_Label;
}
@end

@implementation PassWordViewController
int temp;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)rememberMe:(id)sender
{
    
   if([[defaults valueForKey:@"Remember_Me"]isEqualToString:@"zero"])
    {
          if(textField.text.length==0)
        {
            UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Empty!" message:@"Pls Enter Your Password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [dialog show];
        }
        else if(![textField.text  isEqualToString:@"raptors15"])
        {
            UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Wrong Password" message:@"Your Passowrd is Wrong,Pls Enter correct password to remember" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [dialog show];
        }
        else if([textField.text  isEqualToString:@"raptors15"]){
        [rememberMe_Button setBackgroundImage:[UIImage imageNamed:@"rememberme_selected.png"] forState:UIControlStateNormal];
            
            [[NSUserDefaults standardUserDefaults]setValue:@"one"  forKey:@"Remember_Me"];
            [[NSUserDefaults standardUserDefaults]setValue:textField.text forKey:@"PassWord"];
            [[NSUserDefaults standardUserDefaults] synchronize];
   
             textField.text = @"raptors15";
        }
    }
    else{
         [[NSUserDefaults standardUserDefaults]setValue:@"zero"  forKey:@"Remember_Me"];
         [[NSUserDefaults standardUserDefaults] synchronize];
         [rememberMe_Button setBackgroundImage:[UIImage imageNamed:@"rememberme.png"] forState:UIControlStateNormal];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [nav_Label removeFromSuperview];
    
    [back_Label removeFromSuperview];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBar.topItem.title =@"";
    if([[defaults valueForKey:@"Remember_Me"]isEqualToString:@"one"])
    {
        textField.text =  [defaults valueForKey:@"PassWord"] ;
        [rememberMe_Button setBackgroundImage:[UIImage imageNamed:@"rememberme_selected.png"] forState:UIControlStateNormal];
    }
    else{
        textField.text = @"";
    }
    
    [super viewDidAppear:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    
     self.navigationController.navigationBar.topItem.title =@"";
    
    back_Label = [[UILabel alloc] initWithFrame:CGRectMake(14,6,70,30)];
    //navLabel.text = @"Social Media";
    back_Label.backgroundColor =[UIColor redColor];
    back_Label.text = @"Home";
    back_Label.textAlignment = NSTextAlignmentCenter;
    back_Label.font  =[UIFont fontWithName:@"HelveticaNeue" size:18];
    back_Label.backgroundColor =[ UIColor clearColor];
    back_Label.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:back_Label];
    
    //375
    nav_Label = [[UILabel alloc] initWithFrame:CGRectMake(80,6,self.view.frame.size.width-150,30)];
    nav_Label.text = @"Newsletters";
    nav_Label.textAlignment = NSTextAlignmentCenter;
    nav_Label.font  =[UIFont fontWithName:@"HelveticaNeue-Bold" size:22];
    nav_Label.backgroundColor =[ UIColor clearColor];
    nav_Label.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:nav_Label];
    
    [super viewWillAppear:YES];
    
}
- (void)viewDidLoad
{
    defaults =[NSUserDefaults standardUserDefaults];
    
    
 NSLog(@"%@",[defaults valueForKey:@"Remember_Me"]);
    
 
 // self.title  = @"Password";
    
       
 if([[defaults valueForKey:@"Remember_Me"]isEqualToString:@"one"])
 {
       textField.text =  [defaults valueForKey:@"PassWord"] ;
 }
 else{
      textField.text = @"";
 }
    
  
   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)submit:(id)sender
{
    if(textField.text.length==0)
    {
        
        UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Empty!" message:@"Pls Enter Your Password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [dialog show];
    }
 else if([textField.text isEqualToString:@"raptors15"]) {
     
  // [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"PasswordEntered"];
     [[NSUserDefaults standardUserDefaults]setValue:textField.text forKey:@"PassWord"];
    [[NSUserDefaults standardUserDefaults] synchronize];

     self.rememberString = textField.text;
     UIViewController *viewObject  =[self.storyboard instantiateViewControllerWithIdentifier:@"news"];
     
     [[self navigationController]pushViewController:viewObject animated:YES];

   
 }
    else
    {
        UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Wrong Password" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [dialog show];
    }
   
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder ];
    return YES;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
