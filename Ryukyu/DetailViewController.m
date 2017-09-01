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
@property (strong, nonatomic) NSString *name;
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

#pragma mark - property getter
- (UIResponderView *)responderView {
    if (!_responderView) {
        _responderView = [[UIResponderView alloc] initWithFrame:CGRectZero];
        [_responderView setBackgroundColor:[UIColor redColor]];
    }
    return _responderView;
}

@end
