//
//  UPComingEvents.h
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"


@interface Newsletter : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    IBOutlet UITableView *MyTable;
    NSMutableArray *arrayValue;
    NSMutableArray *arrayValueImages;

    IBOutlet UITextField *passwordTxt;
}

-(IBAction)OkButton:(id)sender;
-(IBAction)BackButton:(id)sender;

//@property(nonatomic)BOOL isPassword;

@end
