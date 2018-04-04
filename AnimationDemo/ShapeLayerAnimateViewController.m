//
//  ShapeLayerAnimateViewController.m
//  AnimationDemo
//
//  Created by pconline on 2017/2/28.
//  Copyright © 2017年 BFMobile. All rights reserved.
//

#import "ShapeLayerAnimateViewController.h"

@interface ShapeLayerAnimateViewController ()
@property (weak, nonatomic) IBOutlet UIView *myAvatar;

@end

@implementation ShapeLayerAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchForoppoent{
    CGSize avatarSize = _myAvatar.frame.size;
    CGFloat bounceXOffset = avatarSize.width/1.9;
    CGSize morphSize = CGSizeMake(avatarSize.width*0.85, avatarSize.height*1.1);
    
    CGPoint rightBouncePoint = CGPointMake(self.view.bounds.size.width*0.5 + bounceXOffset, _myAvatar.center.y);
}

@end
