//
//  ZSideCenterViewController.m
//  ZLJUI
//
//  Created by dazhongge on 2016/12/20.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

#import "ZSideCenterViewController.h"
#import "ZSideManagerViewController.h"

@interface ZSideCenterViewController ()

@end

@implementation ZSideCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];

    UIButton *blue = [UIButton buttonWithType:UIButtonTypeCustom];
    blue.frame = CGRectMake(20, 30, 45, 30);
    [blue addTarget:self action:@selector(showLeft:) forControlEvents:UIControlEventTouchUpInside];
    [blue setTitle:@"显示" forState:UIControlStateNormal];
    blue.backgroundColor = [UIColor clearColor];
    [self.view addSubview:blue];
    
}

- (void)showLeft:(UIButton *)sender {

    [ZSideManagerViewController showLeftView];

}

@end
