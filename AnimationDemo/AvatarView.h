//
//  AvatarView.h
//  AnimationDemo
//
//  Created by pconline on 2017/3/1.
//  Copyright © 2017年 BFMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface AvatarView : UIView

@property(nonatomic,strong) IBInspectable UIImage *image;
@property(nonatomic,strong) IBInspectable NSString *name;

@end
