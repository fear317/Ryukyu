//
//  DetailViewController.m
//  Ryukyu
//
//  Created by 张燎原 on 2017/8/28.
//  Copyright © 2017年 张燎原. All rights reserved.
//

#import "DetailViewController.h"
#import "UIResponderView.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIResponderView *responderView;
@property (strong, nonatomic) CALayer *leftLineLayer;
@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    
    [self.responderView setFrame:CGRectMake(0, 64, 200, 200)];
    [self.view addSubview:self.responderView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}
#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDate *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

#pragma mark - event
- (void)linePositiveAnimation {
    CGFloat a = self.responderView.bounds.size.width;    //左侧缩放动画
    UIBezierPath *leftPath1 = [UIBezierPath bezierPath];
    [leftPath1 moveToPoint:CGPointMake(0.2*a,0.4*a)];
    [leftPath1 addLineToPoint:CGPointMake(0.2*a,a)];
    _leftLineLayer.path = leftPath1.CGPath;
    [_leftLineLayer addAnimation:[self pathAnimationWithDuration:positionDuration/2] forKey:nil];    //右侧竖线位移动画
    UIBezierPath *rightPath1 = [UIBezierPath bezierPath];
    [rightPath1 moveToPoint:CGPointMake(0.8*a, 0.8*a)];
    [rightPath1 addLineToPoint:CGPointMake(0.8*a,-0.2*a)];
    _rightLineLayer.path = rightPath1.CGPath;
    [_rightLineLayer addAnimation:[self pathAnimationWithDuration:positionDuration/2] forKey:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  positionDuration/2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){        //左侧位移动画
        UIBezierPath *leftPath2 = [UIBezierPath bezierPath];
        [leftPath2 moveToPoint:CGPointMake(a*0.2,a*0.2)];
        [leftPath2 addLineToPoint:CGPointMake(a*0.2,a*0.8)];
        _leftLineLayer.path = leftPath2.CGPath;
        [_leftLineLayer addAnimation:[self pathAnimationWithDuration:positionDuration/2] forKey:nil];        //右侧竖线缩放动画
        UIBezierPath *rightPath2 = [UIBezierPath bezierPath];
        [rightPath2 moveToPoint:CGPointMake(a*0.8,a*0.8)];
        [rightPath2 addLineToPoint:CGPointMake(a*0.8,a*0.2)];
        _rightLineLayer.path = rightPath2.CGPath;
        [_rightLineLayer addAnimation:[self pathAnimationWithDuration:positionDuration/2] forKey:nil];
    });
}
#pragma mark - property getter
- (UIResponderView *)responderView {
    if (!_responderView) {
        _responderView = [[UIResponderView alloc] initWithFrame:CGRectZero];
        [_responderView setBackgroundColor:[UIColor redColor]];
    }
    return _responderView;
}

- (CALayer *)leftLineLayer {
    if (!_leftLineLayer) {
        _leftLineLayer = [[CALayer alloc] init];
    }
    return leftLineLayer;
}
@end
