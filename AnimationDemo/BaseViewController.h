//
//  BaseViewController.h
//  AnimationDemo
//
//  Created by JackXu on 16/7/12.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define TEXTFIELDP  60
#define TEXTFIELDH  40
#define TEXTFIELDW SCREENW - 2*TEXTFIELDP

@interface BaseViewController : UIViewController


/**
 *  延时执行
 *
 *  @param task     需要执行的代码块
 *  @param duration 延时多少s后执行
 */
-(void)execute:(void(^)())task after:(double)duration;

@end
