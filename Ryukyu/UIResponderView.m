//
//  UIResponderView.m
//  Ryukyu
//
//  Created by 张燎原 on 2017/8/28.
//  Copyright © 2017年 张燎原. All rights reserved.
//

#import "UIResponderView.h"

@implementation UIResponderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}
@end
