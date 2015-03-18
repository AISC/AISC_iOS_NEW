//
//  NotificationViewController.m
//  AISC
//
//  Created by Griffin Laptop 1 on 28-1-15.
//  Copyright (c) 2015 AISC. All rights reserved.
//

#import "NotificationViewController.h"
#import "dbconnection.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface NotificationViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *nottifactionArray;
}
@end

@implementation NotificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   
    
    nottifactionArray  =[[NSMutableArray alloc]init];
    
    dbconnection *dbobject  =[[dbconnection alloc]init];
    nottifactionArray= [dbobject getallRecords];
    
    
    NSLog(@"nottifactionArray==>%@",nottifactionArray);
    
     self.navigationController.navigationBar.topItem.title =@"Home";
    self.title = @"Notifications";
    
    UITableView  *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    table.delegate =self;
    table .dataSource =self;
    table.backgroundColor = UIColorFromRGB(0X1e3869);
        table.tableFooterView  =[[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:table];
    
    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nottifactionArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.backgroundColor  = [UIColor clearColor];
    cell.textLabel.textColor= [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
    
    cell.textLabel.numberOfLines  = 3;

     cell.detailTextLabel.textColor = [UIColor lightGrayColor];
     cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.text  =[[nottifactionArray objectAtIndex:indexPath.row]valueForKey:@"notification_String"];
   cell.detailTextLabel.text =[[nottifactionArray objectAtIndex:indexPath.row]valueForKey:@"date_String"];
   

    return cell;
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
