//
//  BasisAnimationViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/12.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "BasisAnimationViewController.h"

@interface BasisAnimationViewController ()

@end

@implementation BasisAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mostBasisAnimation];
    [self basisAnimation];
}

-(void)mostBasisAnimation{
    //红色小块
    UIView *viewA = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 30, 30)];
    viewA.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewA];
    
    //蓝色小块
    UIView *viewB = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 30, 30)];
    viewB.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewB];
    
    //UIKit已经封装好了动画，即UIView动画，使用起来十分方便：
    [UIView animateWithDuration:3.0 animations:^{
        CGPoint point = CGPointMake(viewA.center.x+200, viewA.center.y);
        viewA.center = point;
    }];
    
//    animateWithDuration:动画持续时间 animations：view属性改变的block。
//    1、改变位置和大小
//    我们可以改变view的位置和大小的属性来实现放大、缩小、移动等效果，可以使用下面这些属性
//    (1).bounds:改变view中的内容
//    (2).frame:移动view或改变view大小
//    (3).center:移动view
    [UIView animateWithDuration:2.0 animations:^{
        viewB.frame = CGRectMake(self.view.bounds.size.width, viewB.frame.origin.y+100, 2, 2);//x轴移动100个单位
    }];
    
    //橙色小块
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 100, 100)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    //2、改变外观
    //可以view的的背景色和透明度
    //(1).backgroundColor:通过改变这个属性实现背景色渐变效果
    //(2).alpha:通过这个属性来实现渐显和淡出的效果
    [UIView animateWithDuration:5.0 animations:^{
        view.backgroundColor = [UIColor purpleColor];//颜色渐变为紫色
        view.alpha = 0.0;//逐渐变为透明
    }];
    
}

-(void)basisAnimation{
    //绿色小块
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 30, 30)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];

    //为了达到更多效果，我们可以用下面这个方法
    [UIView animateWithDuration:2.0 delay:3.0 options:0 animations:^{
        CGPoint point = CGPointMake(view.center.x+200, view.center.y);
        view.center = point;
    } completion:nil];
    
    //这个方法和上面的类似，只是多了几个用来设置动画的参数
    //duration: 动画持续时间
    //delay: 动画开始前延时的时间
    //options: 动画效果集合，后面会讲到，现在先传0表示不需要动画效果
    //animation: 要执行的动画block
    //completion: 动画结束后会执行的block，一般用来处理动画结束后的清理工作或者执行下一个动画
}

@end
