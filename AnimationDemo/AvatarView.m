//
//  AvatarView.m
//  AnimationDemo
//
//  Created by pconline on 2017/3/1.
//  Copyright © 2017年 BFMobile. All rights reserved.
//

#import "AvatarView.h"
#import <QuartzCore/QuartzCore.h>

@interface AvatarView()

@property(nonatomic,assign) CGFloat lineWidth;
@property(nonatomic,assign) CGFloat animationDuration;

@property(nonatomic,strong) CALayer* photoLayer;
@property(nonatomic,strong) CAShapeLayer* circleLayer;
@property(nonatomic,strong) CAShapeLayer* maskLayer;
@property(nonatomic,strong) UILabel *label;

@end

@implementation AvatarView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if ([super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    _lineWidth = 6.f;
    _animationDuration = 1.f;
    _photoLayer = [CALayer layer];
    _circleLayer = [CAShapeLayer layer];
    _maskLayer = [CAShapeLayer layer];
    _label = [[UILabel alloc] init];
    _label.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:18.0];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = [UIColor blackColor];
}

- (void)layoutSubviews{
    _photoLayer.frame = CGRectMake((self.bounds.size.width - _image.size.width + _lineWidth)/2,(self.bounds.size.height - _image.size.height - _lineWidth)/2,_image.size.width,_image.size.height);

    //Draw the circle
    _circleLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
    _circleLayer.strokeColor = [UIColor whiteColor].CGColor;
    _circleLayer.lineWidth = _lineWidth;
    _circleLayer.fillColor = [UIColor clearColor].CGColor;
    
    //Size the layer
    _maskLayer.path = _circleLayer.path;
    _maskLayer.position = CGPointMake(0.0 ,10.0);
    
    //Size the label
    _label.frame = CGRectMake(0.0, self.bounds.size.height + 10.0, self.bounds.size.width, 24.0);
}

- (void)didMoveToWindow{
    [self.layer addSublayer:_photoLayer];
    _photoLayer.mask = _maskLayer;
    [self.layer addSublayer:_circleLayer];
    [self addSubview:_label];
}

- (void)setImage:(UIImage *)image{
    _image = image;
    _photoLayer.contents = (__bridge id _Nullable)(image.CGImage);
}

-(void)setName:(NSString *)name{
    _label.text = name;
}

@end
