//
//  DetailViewController.m
//  ProjectDemo
//
//  Created by shiwei on 2017/4/10.
//  Copyright © 2017年 shiwei. All rights reserved.
//
//

#import "DetailViewController.h"

#import "JHUD.h"


#define JHUDRGBA(r,g,b,a)     [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface DetailViewController ()

@property (nonatomic,strong) UIButton *rightButton;

@property (nonatomic) JHUD *hudView;

@property (nonatomic) CGRect orignalRect;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.selName;
    self.view.backgroundColor = [UIColor whiteColor];

    // 建议基类中Lazy创建，进行二次封装，使用时直接调用，避免子类中频繁创建产生冗余代码的问题。
    self.hudView = [[JHUD alloc]initWithFrame:self.view.bounds];

    __weak typeof(self)  _self = self;
    [self.hudView setJHUDReloadButtonClickedBlock:^() {
        NSLog(@"refreshButton");
        [_self customAnimation];
    }];

    SEL sel = NSSelectorFromString(self.selName);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:sel withObject:nil];
#pragma clang diagnostic pop

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightButton];

}

- (void)rightButtonClick:(UIButton *)button
{
    button.selected = !button.selected;
    button.selected ? [self hide] : [self failure];
}

-(UIButton *)rightButton
{
    if (_rightButton) {
        return _rightButton;
    }
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(0, 0,45, 35);
    [self.rightButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self.rightButton setTitle:@"Hide" forState:UIControlStateNormal];
    [self.rightButton setTitle:@"Show" forState:UIControlStateSelected];
    self.rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [self.rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    return self.rightButton;
}

- (void)circleAnimation
{
    self.hudView.messageLabel.text = @"circle animation";
    self.hudView.indicatorBackGroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.1];
    self.hudView.indicatorForegroundColor = [UIColor lightGrayColor];
    [self.hudView showAtView:self.view hudType:JHUDLoadingTypeCircle];
}

- (void)circleJoinAnimation
{
    self.hudView.messageLabel.text = @"circleJoin animation";
    self.hudView.indicatorForegroundColor = JHUDRGBA(60, 139, 246, .5);
    self.hudView.indicatorBackGroundColor = JHUDRGBA(185, 186, 200, 0.3);
    [self.hudView showAtView:self.view hudType:JHUDLoadingTypeCircleJoin];
}

- (void)dotAnimation
{
    self.hudView.messageLabel.text = @"dot animation";
    self.hudView.indicatorBackGroundColor = [UIColor whiteColor];
    self.hudView.indicatorForegroundColor = [UIColor orangeColor];
    [self.hudView showAtView:self.view hudType:JHUDLoadingTypeDot];
}


- (void)customAnimation
{
    NSMutableArray * images = [NSMutableArray array];
    for (int index = 1; index<=30; index++) {
        NSString * imageName = [NSString stringWithFormat:@"dropdown_loading_00%d",index];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }

    self.hudView.indicatorViewSize = CGSizeMake(80, 80);
    self.hudView.customAnimationImages = images;
    self.hudView.messageLabel.text = @"床前明月光\n地上鞋两双";
    [self.hudView showAtView:self.view hudType:JHUDLoadingTypeCustomAnimations];

}

- (void)gifAnimations
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"loadinggif3" ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];

    self.hudView.gifImageData = data;
    self.hudView.indicatorViewSize = CGSizeMake(110, 110); 
    self.hudView.messageLabel.text = @"gif animation";
    [self.hudView showAtView:self.view hudType:JHUDLoadingTypeGifImage];
}

- (void)failure
{
    self.hudView.indicatorViewSize = CGSizeMake(100, 100);
    self.hudView.messageLabel.text = @"没有数据? 没有网络?";
    [self.hudView.refreshButton setTitle:@"Refresh" forState:UIControlStateNormal];
    self.hudView.customImage = [UIImage imageNamed:@"null"];

    [self.hudView showAtView:self.view hudType:JHUDLoadingTypeFailure];

}

- (void)failure2
{
    self.hudView.indicatorViewSize = CGSizeMake(150, 150);
    self.hudView.messageLabel.text = @"失败,请重试";
    [self.hudView.refreshButton setTitle:@"Refresh ?" forState:UIControlStateNormal];
    self.hudView.customImage = [UIImage imageNamed:@"nullData"];

    [self.hudView showAtView:self.view hudType:JHUDLoadingTypeFailure];

}

- (void)classMethod
{
    self.rightButton.hidden = YES;

    [JHUD showAtView:self.view message:@"class method"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [JHUD hideForView:self.view];
    });
    
}

// 横竖屏适配的话，在此更新hudView的frame。
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    CGFloat padding = 0;
    self.hudView.frame = CGRectMake(padding,
                                    padding,
                                    self.view.frame.size.width - padding*2,
                                    self.view.frame.size.height - padding*2);
}

- (void)hide
{
    [self.hudView hide];

}


@end













