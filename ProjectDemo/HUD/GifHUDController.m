//
//  GifHUDController.m
//  ProjectDemo
//
//  Created by shiwei on 2017/4/10.
//  Copyright © 2017年 shiwei. All rights reserved.
//

#import "GifHUDController.h"
#import "GiFHUD.h"

@interface GifHUDController ()

@end

@implementation GifHUDController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setup GiFHUD image
    [GiFHUD setGifWithImageName:@"pika.gif"];
}


- (IBAction)showViewPressed:(id)sender {
    [GiFHUD show];
}
- (IBAction)showWindowPressed:(id)sender {
    [GiFHUD showView:self.view];
}

- (IBAction)showWithOverlayPressed:(id)sender {
    [GiFHUD showWithOverlay];
    
    // dismiss after 2 seconds
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [GiFHUD dismiss];
    });
}

- (IBAction)dismissPressed:(id)sender {
    [GiFHUD dismiss];
}


@end
