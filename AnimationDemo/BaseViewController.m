//
//  BaseViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/12.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
}

/**
 *  延时执行
 *
 *  @param task     需要执行的代码块
 *  @param duration 延时多少s后执行
 */
-(void)execute:(void(^)())task after:(double)duration{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        task();
    });
}

@end
