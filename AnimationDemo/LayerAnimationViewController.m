
//
//  LayerAnimationViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/21.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "LayerAnimationViewController.h"

@interface LayerAnimationViewController ()<UITextFieldDelegate>
@property (nonatomic,weak) UITextField *username;
@property (nonatomic,weak) UITextField *passwork;
@end

@implementation LayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    [self positionAndSize];
}

- (void)positionAndSize{
    //Layer动画和view动画十分相似。只要设置属性的开始值和结束值、动画时间，CoreAnimation会帮我们完成动画过程。
    //但是layer有更多的属性，而且CALayer的很多子类额外添加了更多属性，因此可以更多的动画效果。
    //1.位置和大小
    //bounds
    //position
    //tranform:移动、缩放、旋转
    //2.边框
    //borderColor:边框颜色
    //borderWidth:边框宽度
    //cornerRadius:圆角
    //3.阴影
    //shadowOffset
    //shadowOpacity
    //shadowPath
    //shadowRadius
    //4.内容
    //contents
    //mask
    //opacity
    [self position];
    [self animationDelegate];
    
}

- (void)position{
    UITextField *username = [[UITextField alloc] initWithFrame:CGRectMake( -SCREENW -TEXTFIELDW , 100, TEXTFIELDW, TEXTFIELDH)];
    [username setBorderStyle:UITextBorderStyleRoundedRect];
    [username setPlaceholder:@"请输入用户名"];
    _username  = username;
    [self.view addSubview:username];
    
    UITextField *password = [[UITextField alloc] initWithFrame:CGRectMake(-SCREENW -TEXTFIELDW, 160, TEXTFIELDW, TEXTFIELDH)];
    [password setBorderStyle:UITextBorderStyleRoundedRect];
    [password setPlaceholder:@"请输入密码"];
    password.delegate = self;
    _passwork = password;
    [self.view addSubview:password];
    
    //在iOS中如果使用普通的动画则可以使用UIKit提供的动画方式来实现，如果想实现更复杂的效果，则使用Core Animation
    //Core Animation中的Animation只是普通的数据模型，只要创建模型的实例对象，直接设置对象的属性即可。
    //CABasicAnimation描述了layer动画，通过keyPath参数来指定需要改变的属性，然后设置对应属性的fromValue和toValue，最后，设置动画的持续时间。
    CABasicAnimation *flyRight = [CABasicAnimation animationWithKeyPath:@"position.x"];
    flyRight.fromValue = @(username.frame.origin.x);
    flyRight.toValue = @(SCREENW*0.5);
    flyRight.duration = 0.8;
    //flyRight.beginTime = CACurrentMediaTime()+0.7;
    flyRight.fillMode = kCAFillModeBoth;
    //flyRight.removedOnCompletion = NO;
    //现在动画已经设置好了，可以将它设置给layer：
    [username.layer addAnimation:flyRight forKey:nil];
    
    //flyRight.beginTime = CACurrentMediaTime()+0.8;
    [password.layer addAnimation:flyRight forKey:nil];
    
    //使用fillMode
    
    //动画执行的时候，并非textfield本身进行动画变化，而是它的替身--呈现层（presentation layer）。在动画开始时，textfield隐藏，呈现层出现，在动画结束时呈现层从屏幕中移除，textfield重现。
    //在动画结束时，呈现层会消失，原textfield变为可见，但是仍在动画开始前的位置。
    //为了让动画保留在结束后的位置上，需要用到CABasicAnimation的rremovedOnCompletion属性：flyRight.removedOnCompletion = NO;
    //同时设置flyRight.fillMode = kCAFillModeBoth;
    
    //此时点击textfield时，并不会响应点击事件，因为你点击的是textfield的替身。
    //为了解决这个问题，需要移除动画，并且显示真正的textfield、更新textfield的属性
    username.layer.position = CGPointMake(SCREENW*0.5, username.layer.position.y);
    password.layer.position = CGPointMake(SCREENW*0.5, password.layer.position.y);
}

//代理
-(void)animationDelegate{
    UIButton *login = [[UIButton alloc] initWithFrame:CGRectMake(-SCREENW -TEXTFIELDW, 220, TEXTFIELDW, TEXTFIELDH)];
    [login setBackgroundColor:[UIColor orangeColor]];
    [login setTitle:@"登 录" forState:UIControlStateNormal];
    login.layer.cornerRadius = 4.0;
    login.layer.masksToBounds = YES;
    [self.view addSubview:login];
    
    CABasicAnimation *fly = [CABasicAnimation animationWithKeyPath:@"position.x"];
    fly.fromValue = @(login.frame.origin.x);
    fly.toValue = @(SCREENW*0.5);
    fly.duration = 0.8;
    fly.beginTime = CACurrentMediaTime()+0.3;
    fly.fillMode = kCAFillModeBoth;
    fly.delegate = self;

    //执行代码，可以看到输出start和stop，一个CABasicAnimation可以添加到不同的layer上，要怎么确定是哪个layer的动画呢？CAAnimation类和其子类遵守键-值编码（key-value coding）,也就是在运行时，你可以像字典一样，给它设置新的属性。
    [fly setValue:@"form" forKey:@"name"];
    [fly setValue:login.layer forKey:@"layer"];
    
    //上面的代码给fly设置了key为name，值为form的属性，现在可以在代理回调方法中获取到name对应的值，从而区分不同的动画。
    //同时设置了key为layer，值为view.layer的属性，因此可以在回调中获取到动画对应的layer。
    
    [login.layer addAnimation:fly forKey:nil];
    
    login.center = CGPointMake(SCREENW*0.5, login.layer.position.y);

    UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(0, 280, SCREENW, 30)];
    info.textAlignment = NSTextAlignmentCenter;
    info.textColor = [UIColor redColor];
    info.text = @"请输入用户名和密码";
    info.tag = [@"info" hash];
    [self.view addSubview:info];
    
    CABasicAnimation *flyLeft = [CABasicAnimation animationWithKeyPath:@"position.x"];
    flyLeft.fromValue = @(info.frame.origin.x + SCREENW);
    flyLeft.toValue = @(SCREENW*0.5);
    flyLeft.duration = 5.0;
    [info.layer addAnimation:flyLeft forKey:@"infoappear"];
    
    CABasicAnimation *fadeLabelIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeLabelIn.fromValue = @(0.2);
    fadeLabelIn.toValue = @(1.0);
    fadeLabelIn.duration = 4.5;
    [info.layer addAnimation:fadeLabelIn forKey:@"fadein"];
}

- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"start");
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"stop");
    NSString *name = [anim valueForKey:@"name"];
    if([name isEqualToString:@"form"]){
        CALayer *layer = [anim valueForKey:@"layer"];
        
        CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        pulse.fromValue = @(1.25);
        pulse.toValue = @(1.0);
        pulse.duration = 0.4;
        [layer addAnimation:pulse forKey:nil];
    }
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    UIView *info = [self.view viewWithTag:[@"info" hash]];
    [info.layer removeAnimationForKey:@"infoappear"];
}

@end
