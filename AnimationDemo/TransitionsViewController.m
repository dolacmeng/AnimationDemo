//
//  TransitionsViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/18.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "TransitionsViewController.h"
#import "HYNoticeView.h"

@interface TransitionsViewController (){
    UIImageView *viewA;
    UIImageView *viewB;
    UIView *animationContainerView;
    BOOL isRevolve;
}

@end

@implementation TransitionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self transitionAdd];
    [self noticeView];
}

-(void)setUpView{
    animationContainerView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:animationContainerView];
    viewA = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiaoming0"]];
    viewA.center = CGPointMake(SCREENW*0.5, 200);
    viewA.userInteractionEnabled = YES;

    viewB = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiaoming0"]];
    viewB.center = CGPointMake(SCREENW*0.5, 400);
    viewB.userInteractionEnabled = YES;
    [self.view addSubview:viewB];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [viewB addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)sender
{
    if (isRevolve){
        return;
    }
    if (sender.state == UIGestureRecognizerStateEnded){
        [self changeImage];
    }
}

- (void)transitionAdd{
    //Transitions变换
    //前面已经学习了通过改变view的属性的方法来实现动画，下面将学习通过transitions来给view设置动画。
    //Transitions是已经预先定义好的动画，而不是像前面那样在开始和结束状态间插入动画效果。
    //例子1：添加view
    //使用transitions使得容器view添加子view时带有动画效果。
    [self execute:^{
        [UIView transitionWithView:animationContainerView
                          duration:2.0
                           options:UIViewAnimationOptionTransitionFlipFromLeft|UIViewAnimationOptionCurveEaseOut
                        animations:^{ [animationContainerView addSubview:viewA]; }
                        completion:^(BOOL finished) {
                            [self transitionRemove];
                        }];
    } after:0.5];
    
    //上面函数使用了一个新的option：UIViewAnimationOptionTransitionFlipFromLeft，这就是我们说的已经定义好的动画效果，下面是所有定于好的动画效果列表：
//    UIViewAnimationOptionTransitionFlipFromLeft
//    UIViewAnimationOptionTransitionFlipFromRight
//    UIViewAnimationOptionTransitionCurlUp
//    UIViewAnimationOptionTransitionCurlDown
//    UIViewAnimationOptionTransitionCrossDissolve
//    UIViewAnimationOptionTransitionFlipFromTop
//    UIViewAnimationOptionTransitionFlipFromBottom
}


- (void)transitionRemove{
    //例子2：移除view
    //在屏幕中移除子视图，并带有动画效果
    [self execute:^{
        [UIView transitionWithView:animationContainerView
                          duration:2.0
                           options:UIViewAnimationOptionTransitionFlipFromRight|UIViewAnimationOptionCurveEaseOut
                        animations:^{ [viewA removeFromSuperview]; }
                        completion:^(BOOL finished) {
                            [self transitionHide];
                        }];
    } after:0.5];
    
    
}

-(void)transitionHide{
    //例子3：隐藏/显示view
    //前面两个例子都是实现在视图层级上的动画效果，所以需要用到容器view，如果要隐藏和显示view，我们只需要操作view本身就可以了。先看代码：
    viewA.hidden = YES;
    [animationContainerView addSubview:viewA];
    [self execute:^{
        [UIView transitionWithView:viewA duration:1.5 options:UIViewAnimationOptionTransitionFlipFromBottom|UIViewAnimationOptionCurveEaseOut animations:^{
            viewA.hidden = NO;
        } completion:^(BOOL finished) {
            [self transitionReplace];
        }];
    } after:0.5];
}

-(void)transitionReplace{
    //例子4：view替换为另一个view
    UIImageView *anotherView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiaoming1"]];
    anotherView.center = viewA.center;
    [UIView transitionFromView:viewA toView:anotherView duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        [UIView transitionFromView:anotherView toView:viewA duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        }];
    }];
}

-(void)changeImage{
    isRevolve = YES;
    [UIView transitionWithView:viewB duration:0.8 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        viewB.image = [UIImage imageNamed:@"xiaoming1"];
    } completion:^(BOOL finished) {
        [self execute:^{
            [UIView transitionWithView:viewB duration:0.8 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                viewB.image = [UIImage imageNamed:@"xiaoming0"];
            } completion:^(BOOL finished) {
                isRevolve = NO;
            }];
        } after:1.0];
    }];
}

- (void)noticeView{
    //顶部提示，带有弯曲掉下的动画
    HYNoticeView *noticeTop = [[HYNoticeView alloc] initWithFrame:CGRectMake((SCREENW-200)*0.5, 450
, 200, 40) text:@"气泡提示：点击图片进行翻转" position:HYNoticeViewPositionTop];
    [noticeTop showType:HYNoticeTypeTestTop inView:self.view after:1.0 duration:0.6 options:UIViewAnimationOptionTransitionCurlDown|UIViewAnimationOptionCurveEaseInOut];
    noticeTop.closeClick = ^(){
        NSLog(@"closeClick!!");
    };
}


@end
