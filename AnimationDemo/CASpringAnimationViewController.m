
//
//  CASpringAnimationViewController.m
//  AnimationDemo
//
//  Created by pconline on 2017/2/24.
//  Copyright © 2017年 BFMobile. All rights reserved.
//

#import "CASpringAnimationViewController.h"

@interface CASpringAnimationViewController ()

@end

@implementation CASpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self springAnimation];
}

- (void)springAnimation {
    [super didReceiveMemoryWarning];
    UIButton *login = [[UIButton alloc] initWithFrame:CGRectMake(TEXTFIELDP, 220, TEXTFIELDW, TEXTFIELDH)];
    [login setBackgroundColor:[UIColor orangeColor]];
    [login setTitle:@"登 录" forState:UIControlStateNormal];
    login.layer.cornerRadius = 4.0;
    login.layer.masksToBounds = YES;
    [self.view addSubview:login];
    
    CASpringAnimation *spring = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    spring.beginTime = CACurrentMediaTime()+0.8;
    spring.damping = 2.0;
    spring.fromValue = @(1.25);
    spring.toValue = @(1.0);
    spring.duration = spring.settlingDuration;
    [login.layer addAnimation:spring forKey:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
