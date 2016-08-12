//
//  OptionsParameterViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/13.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "OptionsParameterViewController.h"
#import "WeiboViewController.h"

@interface OptionsParameterViewController ()
@end

@implementation OptionsParameterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self optionsRepeat];
    [self optionsCurve];
    [self weibo];
}

- (void)optionsRepeat {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
//    现在讲下options参数
//    options 让你决定UIKit怎样创建动画，前面的方法中只是设置了动画的时长和延迟时间，其实我们还可以设置更多效果。下面是UIViewAnimationOptions中定义的options的集合，可以通过不同的结合而实现不同的动画效果。
//    重复Repeating
//    首先看下下面两个options
//    1.UIViewAnimationOptionRepeat:动画无限重复执行
//    2.UIViewAnimationOptionAutoreverse:这个选项要和UIViewAnimationOptionRepeat一起使用，让动画先顺着执行，然后再逆着返回
    
    [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionCurveLinear animations:^{
        CGPoint point = CGPointMake(self.view.bounds.size.width-25, view.center.y);
        view.center = point;
    } completion:nil];
}

- (void)optionsCurve{
    UIView *view0 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 50, 50)];
    view0.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view0];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 260, 50, 50)];
    view1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 320, 50, 50)];
    view2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view2];

    //速度渐变
//    生活中的物体，例如汽车和火车，是通过加速来达到匀速行使速度的；通过减速最终才能停下来（除非直接撞墙了...）。为了使动画看起来更加的现实，我们将以上效果添加到view中。
//    苹果提供了4种效果给我们选择：
//    1.UIViewAnimationOptionCurveEaseInOut: 默认值，在动画开始时有加速效果，在结束时有减速效果
//    2.UIViewAnimationOptionCurveEaseIn :在动画开始时有加速效果
//    3.UIViewAnimationOptionCurveEaseOut:在动画结束时有减速效果
//    4.UIViewAnimationOptionCurveLinear : 没有加速和减速效果
    [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGPoint point = CGPointMake(self.view.bounds.size.width, view0.center.y);
        view0.center = point;
    } completion:nil];
    
    [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGPoint point = CGPointMake(self.view.bounds.size.width, view1.center.y);
        view1.center = point;
    } completion:nil];
    
    [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        CGPoint point = CGPointMake(self.view.bounds.size.width, view2.center.y);
        view2.center = point;
    } completion:nil];
    
}

- (void)weibo{
    CGFloat buttonW = 40.0;
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREENW-buttonW)*0.5, SCREENH-buttonW-20, buttonW, buttonW)];
    [addButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(clickAdd:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
}

- (void)clickAdd:(UIButton*)button{
    WeiboViewController *vc = [[WeiboViewController alloc] init];
    [self presentViewController:vc animated:NO completion:nil];
}



//UIViewAnimationOptionLayoutSubviews //提交动画的时候布局子控件，表示子控件将和父控件一同动画。
//UIViewAnimationOptionAllowUserInteraction //动画过程中允许用户交互，比如响应触摸
//UIViewAnimationOptionBeginFromCurrentState //从当前状态开始动画
//UIViewAnimationOptionRepeat //动画无限重复
//UIViewAnimationOptionAutoreverse //执行动画回路,要与UIViewAnimationOptionRepeat一起使用
//UIViewAnimationOptionOverrideInheritedDuration //忽略外层动画嵌套的执行时间
//UIViewAnimationOptionOverrideInheritedCurve //忽略外层动画嵌套的时间变化曲线
//UIViewAnimationOptionAllowAnimatedContent //动画过程中重绘视图（仅适用于转场动画）
//UIViewAnimationOptionShowHideTransitionViews //用显隐的方式替代添加移除图层的动画效果
//UIViewAnimationOptionOverrideInheritedOptions //忽略嵌套继承的选项
////时间函数曲线相关
//UIViewAnimationOptionCurveEaseInOut //时间曲线函数，由慢到快
//UIViewAnimationOptionCurveEaseIn //时间曲线函数，由慢到特别快
//UIViewAnimationOptionCurveEaseOut //时间曲线函数，由快到慢
//UIViewAnimationOptionCurveLinear //时间曲线函数，匀速
////转场动画效果
//UIViewAnimationOptionTransitionNone //无转场动画
//UIViewAnimationOptionTransitionFlipFromLeft //转场从左翻转
//UIViewAnimationOptionTransitionFlipFromRight //转场从右翻转
//UIViewAnimationOptionTransitionCurlUp //上卷转场
//UIViewAnimationOptionTransitionCurlDown //下卷转场
//UIViewAnimationOptionTransitionCrossDissolve //转场交叉消失
//UIViewAnimationOptionTransitionFlipFromTop //转场从上翻转
//UIViewAnimationOptionTransitionFlipFromBottom //转场从下翻转

@end
