//
//  SVProgressController.m
//  ProjectDemo
//
//  Created by shiwei on 2017/4/8.
//  Copyright © 2017年 shiwei. All rights reserved.
//

#import "SVProgressController.h"
#import "SVProgressHUD.h"

@interface SVProgressController ()
@property (weak, nonatomic) UIView *headerView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation SVProgressController

- (NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[
                       @"show",
                       @"dismiss",
                       @"showWithStatus",
                       @"showImage:status",
                       @"showProgress:status",
                       @"showErrorWithStatus",
                       @"showSuccessWithStatus",
                       @"showInfoWithStatus",
                       ];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    self.headerView = view;
    self.tableView.tableHeaderView = view;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setTitle:@"light" forState:UIControlStateNormal];
    [button setTitle:@"drak" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}
- (void)buttonClick:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    if (sender.isSelected) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    } else {
        
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = self.dataArray[indexPath.row];
    NSString *icon = @"nullData";
    switch (indexPath.row) {
        case 0:
        {
            [SVProgressHUD show];
        }
            break;
        case 1:
        {
            [SVProgressHUD dismiss];
        }
            
            break;
        case 2:
        {
            [SVProgressHUD showWithStatus:string];
        }
            
            break;
        case 3:
        {
            [SVProgressHUD showImage:[UIImage imageNamed:icon] status:string];
        }
            break;
        case 4:
        {
            [SVProgressHUD showProgress:0.2 status:string];
        }
            break;
        case 5:
        {
            [SVProgressHUD showErrorWithStatus:string];
        }
            break;
        case 6:
        {
            [SVProgressHUD showSuccessWithStatus:string];
        }
            break;
        case 7:
        {
            [SVProgressHUD showInfoWithStatus:string];
        }
            break;
            
        default:
            break;
    }
}
@end
