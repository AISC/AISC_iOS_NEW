//
//  EventCell.h
//  AISC
//
//  Created by Zach Whelchel on 11/19/14.
//  Copyright (c) 2014 AISC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventDateLabel;

@end
