//
//  FirstView.m
//  RACDemoTest
//
//  Created by xiaohui on 2018/1/9.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "FirstView.h"

@interface FirstView ()

@end

@implementation FirstView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews {
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn setTitle:@"button" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btn];
}

//- (void)btnClicked {
//    NSLog(@"按钮被点击了！");
//}

@end
