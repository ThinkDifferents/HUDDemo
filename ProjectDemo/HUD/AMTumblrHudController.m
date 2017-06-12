//
//  AMTumblrHudController.m
//  ProjectDemo
//
//  Created by shiwei on 2017/4/10.
//  Copyright © 2017年 shiwei. All rights reserved.
//

#import "AMTumblrHudController.h"
#import "AMTumblrHud.h"

@interface AMTumblrHudController ()

@end

@implementation AMTumblrHudController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    AMTumblrHud *tumblrHUD = [[AMTumblrHud alloc] initWithFrame:CGRectMake((CGFloat) ((self.view.frame.size.width - 55) * 0.5),
                                                                           (CGFloat) ((self.view.frame.size.height - 20) * 0.5), 55, 20)];
    tumblrHUD.hudColor = [UIColor redColor];
    [self.view addSubview:tumblrHUD];
    
    [tumblrHUD showAnimated:YES];
}

@end
