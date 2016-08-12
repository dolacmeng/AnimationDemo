//
//  KeyframeViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/18.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "KeyframeViewController.h"

@interface KeyframeViewController ()

@end

@implementation KeyframeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self keyframe];
}

- (void)keyframe {
    //Keyframe动画
    //有时候，我们想要给view设置连续的动画，通过前面的学习，我们知道可以用completion block来实现连续的动画。虽然这样可以连接多个简单动画，但是代码看起来会混乱和复杂。例如飞机起飞的动画：
    //    oldView.center = CGPointMake(100, 100);
    UIImageView *planeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plane"]];
    planeImage.center = CGPointMake(180, 180);
    CGPoint originalCenter = planeImage.center;
    [self.view addSubview:planeImage];
    
    //我们可以使用关键帧动画
    //飞机首先在跑道上加速、开始向上提升、以更快的速度加速提升、最后飞出屏幕，消失在云中。
    [UIView animateKeyframesWithDuration:1.5 delay:2.0 options:0 animations:^{
        
        //这里的开始时间和动画时间参数取值为0-1.0，是总时间（1.5s）的百分比
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.25 animations:^{
            CGPoint center = planeImage.center;
            center.x += 80.0;
            center.y -= 10.0;
            planeImage.center = center;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.1 relativeDuration:0.4 animations:^{
            planeImage.transform = CGAffineTransformMakeRotation(-M_PI_4/2);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            CGPoint center = planeImage.center;
            center.x += 100.0;
            center.y -= 50.0;
            planeImage.center = center;
            planeImage.alpha = 0.0;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.51 relativeDuration:0.01 animations:^{
            planeImage.transform = CGAffineTransformIdentity;
            planeImage.center = CGPointMake(0.0, originalCenter.y);
        }];
        
        
        [UIView addKeyframeWithRelativeStartTime:0.55 relativeDuration:0.45 animations:^{
            planeImage.alpha = 1.0;
            planeImage.center = originalCenter;
        }];
        
    } completion:nil];
}


@end
