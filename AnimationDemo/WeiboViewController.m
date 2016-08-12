//
//  WeiboViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/14.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "WeiboViewController.h"

@interface WeiboViewController ()

@end

@implementation WeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self setUpView];
}

-(void)setUpView{
    CGFloat addButtonW = 40.0;
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREENW-addButtonW)*0.5, SCREENH-addButtonW-20, addButtonW, addButtonW)];
    [addButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(clickClose:) forControlEvents:UIControlEventTouchUpInside];
    addButton.tag = 99;
    [self.view addSubview:addButton];
    [UIView animateWithDuration:0.2 animations:^{
        addButton.transform = CGAffineTransformMakeRotation(M_PI_4);
    } completion:^(BOOL finished) {
        addButton.transform = CGAffineTransformIdentity;
        [addButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateNormal];
    }];
    
    CGFloat paddingLeft = 5;
    CGFloat paddingTop = 30;
    CGFloat buttonW = (SCREENW-paddingLeft*2)/3;
    CGFloat buttonH = 72.0;
    for (int i=0; i<6; i++) {
        CGFloat x = paddingLeft + buttonW * (i%3);
        CGFloat y = SCREENH + (paddingTop+buttonH) * (i/3) - 50;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, buttonW, buttonH)];
        button.tag = 100 + i;
        button.alpha = 0.0;
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_compose_%zd",i]] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
    
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.65 initialSpringVelocity:0 options:0 animations:^{
        UIButton *button0 = [self.view viewWithTag:100];
        UIButton *button1 = [self.view viewWithTag:103];
        button0.transform = CGAffineTransformMakeTranslation(0, -250);
        button1.transform = CGAffineTransformMakeTranslation(0, -250);
        button0.alpha = 1.0;
        button1.alpha = 1.0;
    } completion:nil];

    [UIView animateWithDuration:0.45 delay:0.15 usingSpringWithDamping:0.65 initialSpringVelocity:0 options:0 animations:^{
        UIButton *button0 = [self.view viewWithTag:101];
        UIButton *button1 = [self.view viewWithTag:104];
        button0.transform = CGAffineTransformMakeTranslation(0, -250);
        button1.transform = CGAffineTransformMakeTranslation(0, -250);
        button0.alpha = 1.0;
        button1.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.65
        initialSpringVelocity:0 options:0 animations:^{
        UIButton *button0 = [self.view viewWithTag:102];
        UIButton *button1 = [self.view viewWithTag:105];
        button0.transform = CGAffineTransformMakeTranslation(0, -250);
        button1.transform = CGAffineTransformMakeTranslation(0, -250);
        button0.alpha = 1.0;
        button1.alpha = 1.0;
    } completion:nil];
}

- (void)clickClose:(UIButton*)button{
    [UIView animateWithDuration:0.60 animations:^{
        UIButton *button0 = [self.view viewWithTag:100];
        UIButton *button1 = [self.view viewWithTag:103];
        button0.transform = CGAffineTransformMakeTranslation(0, 250);
        button1.transform = CGAffineTransformMakeTranslation(0, 250);
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    
    [UIView animateWithDuration:0.45 animations:^{
        UIButton *button0 = [self.view viewWithTag:101];
        UIButton *button1 = [self.view viewWithTag:104];
        button0.transform = CGAffineTransformMakeTranslation(0, 250);
        button1.transform = CGAffineTransformMakeTranslation(0, 250);
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        UIButton *addButton = [self.view viewWithTag:99];
        addButton.transform = CGAffineTransformMakeRotation(-M_PI_4);
        UIButton *button0 = [self.view viewWithTag:102];
        UIButton *button1 = [self.view viewWithTag:105];
        button0.transform = CGAffineTransformMakeTranslation(0, 250);
        button1.transform = CGAffineTransformMakeTranslation(0, 250);
    }];

}


@end
