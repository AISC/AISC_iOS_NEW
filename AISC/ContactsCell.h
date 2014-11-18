//
//  ContactsCell.h
//  AISC
//
//  Created by Zach Whelchel on 11/18/14.
//  Copyright (c) 2014 AISC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *emailButton;

@end
