//
//  JHUDController.m
//  ProjectDemo
//
//  Created by shiwei on 2017/4/10.
//  Copyright © 2017年 shiwei. All rights reserved.
//

#import "JHUDController.h"
#import "DetailViewController.h"

@interface JHUDController ()

@property (nonatomic) NSArray  *datas;

@end

@implementation JHUDController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datas = @[@"circleAnimation",
                   @"circleJoinAnimation",
                   @"dotAnimation",
                   @"customAnimation",
                   @"gifAnimations",
                   @"failure",
                   @"failure2",
                   @"classMethod",
                   ];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"JHUD";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _datas[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    DetailViewController * detailVC = [DetailViewController new];
    detailVC.selName = _datas[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
