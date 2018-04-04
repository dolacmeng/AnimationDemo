//
//  AnimationGroupViewController.m
//  AnimationDemo
//
//  Created by pconline on 2017/1/24.
//  Copyright © 2017年 BFMobile. All rights reserved.
//

#import "AnimationGroupViewController.h"

@interface AnimationGroupViewController ()

@end

@implementation AnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self animationGroup];
}

- (void)animationGroup{
    UIButton *login = [[UIButton alloc] initWithFrame:CGRectMake(TEXTFIELDP, 220, TEXTFIELDW, TEXTFIELDH)];
    [login setBackgroundColor:[UIColor orangeColor]];
    [login setTitle:@"登 录" forState:UIControlStateNormal];
    login.layer.cornerRadius = 4.0;
    login.layer.masksToBounds = YES;
    [self.view addSubview:login];
    
    CAAnimationGroup *gruopAnimation = [CAAnimationGroup animation];
    gruopAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    gruopAnimation.duration = 0.5;
    gruopAnimation.fillMode = kCAFillModeBackwards;
    
    CABasicAnimation *scaleDown =  [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleDown.fromValue = @(3.5);
    scaleDown.toValue = @(1.0);
    
    CABasicAnimation *rotate =  [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotate.fromValue = @(M_PI_4);
    rotate.toValue = @(0.0);
    
    CABasicAnimation *fade =  [CABasicAnimation animationWithKeyPath:@"transform.opacity"];
    fade.fromValue = @(0.0);
    fade.toValue = @(1.0);

    gruopAnimation.animations = @[scaleDown,rotate,fade];
    [login.layer addAnimation:gruopAnimation forKey:nil];
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
