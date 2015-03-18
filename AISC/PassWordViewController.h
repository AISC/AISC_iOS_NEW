//
//  PassWordViewController.h
//  AISC
//
//  Created by Griffin Laptop 1 on 8-1-15.
//  Copyright (c) 2015 AISC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PassWordViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIButton *rememberMe_Button;
    IBOutlet UITextField *textField;
        NSUserDefaults *defaults;
    
}
@property(nonatomic,retain)NSString *rememberString;
-(IBAction)submit:(id)sender;
-(IBAction)rememberMe:(id)sender;
@end
