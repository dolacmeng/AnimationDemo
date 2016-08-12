//
//  AnimationnDelegateViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/8/1.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "AnimationnDelegateViewController.h"

@interface AnimationnDelegateViewController ()

@end

@implementation AnimationnDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self animationDelegate];
}

- (void)animationDelegate{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 40, 40)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    CABasicAnimation *fly = [CABasicAnimation animationWithKeyPath:@"position.x"];
    fly.fromValue = @(50.0);
    fly.toValue = @(200);
    fly.duration = 0.5;
    fly.delegate = self;

    //执行代码，可以看到输出start和stop，一个CABasicAnimation可以添加到不同的layer上，要怎么确定是哪个layer的动画呢？CAAnimation类和其子类遵守键-值编码（key-value coding）,也就是在运行时，你可以像字典一样，给它设置新的属性。
    [fly setValue:@"form" forKey:@"name"];
    [fly setValue:view.layer forKey:@"layer"];
    
    //上面的代码给fly设置了key为name，值为form的属性，现在可以在代理回调方法中获取到name对应的值，从而区分不同的动画。
    //同时设置了key为layer，值为view.layer的属性，因此可以在回调中获取到动画对应的layer。
    
    [view.layer addAnimation:fly forKey:nil];

    view.layer.frame = CGRectMake(200, view.frame.origin.y, view.layer.frame.size.width, view.layer.frame.size.height);
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
        pulse.duration = 0.25;
        [layer addAnimation:pulse forKey:nil];
    }
}

@end
