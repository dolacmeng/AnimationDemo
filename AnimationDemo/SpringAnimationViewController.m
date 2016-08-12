//
//  SpringAnimationViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/15.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "SpringAnimationViewController.h"

@interface SpringAnimationViewController ()

@end

@implementation SpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self springAnimation];
}

- (void)springAnimation {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    //弹簧效果
    //通过上面的代码，可以轻易实现将view从点A移动到点B,现在我们创建稍复杂一点的动画：移动view时添加弹簧效果，就像view被系上了一根弹簧。
    view.alpha = 0.0;
    [UIView animateWithDuration:2.0 delay:1.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:0 animations:^{
        CGPoint point = CGPointMake(250, view.center.y);
        view.center = point;
        view.alpha = 1.0;
    } completion:nil];
    //用的方法和前面的类似，只是多了两个参数：
    //1.usingSpringWithDamping :设置阻尼，取值范围是0.0-1.0，简单来说取值越接近于0，越有弹性，越接近与1，越僵硬。
    //2.initialSpringVelocity:设置初始速度
}



@end
