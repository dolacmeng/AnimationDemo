//
//  TransformAnimationViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/13.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "TransformAnimationViewController.h"

@interface TransformAnimationViewController ()

@end

@implementation TransformAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self transformTranslation];
    [self transformScale];
    [self transformRotation];
}

//移动
- (void)transformTranslation{
    //蓝色小块
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
    view.backgroundColor = [UIColor blueColor];
    
    
//    使用UIView的transform属性，可以达到移动、缩放、旋转等2D变化效果。
//    CGAffineTransformMakeTranslation (CGFloat tx,CGFloat ty)：平移（在x轴上平移的数值，在y轴上平移的数值）
//    CGAffineTransformMakeScale (CGFloat sx,CGFloat sy)：缩放（在x轴上的缩放比例，在y轴上的缩放比例）
//    CGAffineTransformMakeRotation(CGFloat angle); 旋转(旋转的角度)
//    CGAffineTransformTranslate(CGAffineTransform t,CGFloat tx,CGFloat ty)：平移（已存在的变换，在x轴上平移的数值，在y轴上平移的数值）
//
//    CGAffineTransformScale（CGAffineTransform t,CGFloat sx,CGFloat sy）：缩放（已存在的变换，在x轴上的缩放比例，在y轴上的缩放比例）
//    CGAffineTransformRotate(CGAffineTransform t，CGFloat angle); 旋转(已存在的变换，旋转的角度)
//    注意到每种变换都有两个类似的函数，如
//    (1) CGAffineTransformMakeTranslation(CGFloat tx,CGFloat ty)
//    (2) CGAffineTransformTranslate(CGAffineTransform t,CGFloat tx, CGFloat ty)
//    方法1中，每次变换是从view的初始状态开始
//    方法2中，每次变换都是以上一次的状态（CGAffineTransform t）进行的变化，因此可以多次连续变化
    
    [UIView animateWithDuration:1.5 animations:^{
        view.transform = CGAffineTransformMakeTranslation(200,0);//在原位置上向x轴方向移动200
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            view.transform = CGAffineTransformTranslate(view.transform, 0, 100);//能够多次变化，每次变化都是在上一次的状态（CGAffineTransform t）进行变化
        }];
    }];
    [self.view addSubview:view];
}

//缩放
- (void)transformScale{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    view.backgroundColor = [UIColor greenColor];
    [self .view addSubview:view];
    [UIView animateWithDuration:1.5 animations:^{
        view.transform = CGAffineTransformMakeScale(1.5, 1.5);//长和宽都放大1.5倍
    }];
}

//旋转和还原
- (void)transformRotation{

    //橙色小块
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
    view.backgroundColor = [UIColor orangeColor];

    //设置transform设置为CGAffineTransformIdentity，可还原至初始状态
    [UIView animateWithDuration:2 animations:^{
        view.transform = CGAffineTransformMakeRotation(M_PI_4);//顺时针旋转90度
    } completion:^(BOOL finished) {
        [self execute:^{
            view.transform = CGAffineTransformIdentity;//还原
        } after:1.0];
    }];
    [self.view addSubview:view];
}





@end
