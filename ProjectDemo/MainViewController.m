//
//  MainViewController.m
//  ProjectDemo
//
//  Created by shiwei on 17/4/2.
//  Copyright © 2017年 shiwei. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"功能列表";
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
}

- (NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[
                       @{
                           @"text" : @"MBProgress",
                           @"Controller" : @"MBProgressController"
                           },
                       @{
                           @"text" : @"SVProgress",
                           @"Controller" : @"SVProgressController"
                           },
                       @{
                           @"text" : @"AMTumblrHUD",
                           @"Controller" : @"AMTumblrHudController"
                           },
                       @{ // 
                           @"text" : @"GifHUD",
                           @"Controller" : @"GifHUDController"
                           },
                       @{
                           @"text" : @"JHUD",
                           @"Controller" : @"JHUDController"
                           },
                       ];
    }
    return _dataArray;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 设置数据
    cell.textLabel.text = self.dataArray[indexPath.row][@"text"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class cls = NSClassFromString(self.dataArray[indexPath.row][@"Controller"]);
    UIViewController *vc = [[cls alloc] init];
    vc.title = self.dataArray[indexPath.row][@"text"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
