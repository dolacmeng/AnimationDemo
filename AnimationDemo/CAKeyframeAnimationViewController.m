//
//  CAKeyframeAnimationViewController.m
//  AnimationDemo
//
//  Created by pconline on 2017/2/24.
//  Copyright © 2017年 BFMobile. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"

@interface CAKeyframeAnimationViewController ()
@property (nonatomic,strong) UIView *testView;
@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self keyframe];
}

- (void)setUpView{
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 80, 80)];
    [self.testView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:self.testView];
}

- (void)keyframe {
    CAKeyframeAnimation *wobble = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    wobble.duration = 0.25;
    wobble.repeatCount = 4;
    wobble.values = @[@(0.0), @(-M_PI_4/4), @(0.0), @(M_PI_4/4), @(0.0)];
    wobble.keyTimes = @[@(0.0),@(0.25),@(0.5),@(0.75),@(1.0)];
    [self.testView.layer addAnimation:wobble forKey:nil];
}


@end
