//
//  ViewController.m
//  AnimationDemo
//
//  Created by JackXu on 16/7/12.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *titleArray;
    NSArray *vcArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    titleArray = @[@"基本动画",@"变换动画（transform）",@"options参数",@"弹簧动画",@"Transitions动画",@"关键帧动画",@"layer简单动画",@"动画代理",@"AnimationGroup",@"CA弹簧",@"CAKeyframeAnimation",@"ShapeLayer"];
    vcArray = @[@"BasisAnimationViewController",@"TransformAnimationViewController",@"OptionsParameterViewController",@"SpringAnimationViewController",@"TransitionsViewController",@"KeyframeViewController",@"LayerAnimationViewController",@"AnimationnDelegateViewController",@"AnimationGroupViewController",@"CASpringAnimationViewController",@"CAKeyframeAnimationViewController",@"ShapeLayerAnimateViewController"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = titleArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *classStr = vcArray[indexPath.row];
    Class c = NSClassFromString(classStr);
    UIViewController *vc = [[c alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
