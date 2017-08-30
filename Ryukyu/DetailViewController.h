//
//  DetailViewController.h
//  Ryukyu
//
//  Created by 张燎原 on 2017/8/28.
//  Copyright © 2017年 张燎原. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

