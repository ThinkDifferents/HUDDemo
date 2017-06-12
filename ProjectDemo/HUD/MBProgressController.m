//
//  MBProgressController.m
//  ProjectDemo
//
//  Created by shiwei on 2017/4/8.
//  Copyright © 2017年 shiwei. All rights reserved.
//

#import "MBProgressController.h"
#import "MBProgressHUD+HYExtension.h"

@interface MBProgressController ()
@property (weak, nonatomic) UIView *headerView;
@property (nonatomic, strong) NSArray *dataArray;
//@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation MBProgressController
- (NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[
                       @"showHUDWithMessage",
                       @"showHUDWithMessage:onView",
                       @"showHUD",
                       @"showHUDWithMessage:deltail",
                       @"showError",
                       @"showSuccess",
                       @"showIcon",
                       @"showMessage:icon",
                       @"showNoDataView"
                       ];
    }
    return _dataArray;
}
//- (NSArray *)imageArray
//{
//    if (_imageArray == nil) {
//        NSMutableArray *image = [NSMutableArray array];
//        for (NSInteger i = 1; i <= 30; i++) {
//            NSString *string = [NSString stringWithFormat:@"dropdown_loading_00%ld", i];
//            
//            [image addObject:[UIImage imageNamed:string]];
//        }
//        _imageArray = [NSArray arrayWithArray:image];
//    }
//    return _imageArray;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 180)];
    view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    self.headerView = view;
    self.tableView.tableHeaderView = view;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
            [MBProgressHUD showHUDWithMessage:string];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hidden];
            });
        }
            break;
        case 1:
        {
            [MBProgressHUD showHUDWithMessage:string onView:self.headerView];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hiddenForView:self.headerView];
            });
        }
            
            break;
        case 2:
        {
            [MBProgressHUD showHUD];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hidden];
            });
        }
            
            break;
        case 3:
        {
            [MBProgressHUD showHUDWithMessage:string deltail:string];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hidden];
            });
        }
            break;
        case 4:
        {
            [MBProgressHUD showError:string];
        }
            break;
        case 5:
        {
            [MBProgressHUD showSuccess:string];
        }
            break;
        case 6:
        {
            [MBProgressHUD showIcon:icon];
        }
            break;
        case 7:
        {
            [MBProgressHUD showMessage:string icon:icon];
        }
            break;
        case 8:
        {
            [MBProgressHUD showNoDataView:self.view title:@"no Data" imageName:icon];
        }
            break;
            
        default:
            break;
    }
}

@end
