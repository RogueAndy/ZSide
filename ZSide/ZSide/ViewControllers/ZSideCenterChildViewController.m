//
//  ZSideCenterChildViewController.m
//  ZLJUI
//
//  Created by dazhongge on 2016/12/22.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

#import "ZSideCenterChildViewController.h"
#import "ZSideManagerViewController.h"

@implementation ZSideCenterChildViewController


@end







@implementation ZChildViewController1

- (void)loadViews {

    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    textLabel.font = [UIFont systemFontOfSize:17];
    textLabel.textColor = [UIColor blackColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = @"child 1";
    [self.view addSubview:textLabel];
    
    textLabel.frame = CGRectMake(30, 100, CGRectGetWidth(self.view.bounds) - 60, 40);
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setTitle:@"显示" forState:UIControlStateNormal];
    [left setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    left.frame = CGRectMake(30, 80, 50, 30);
    [self.view addSubview:left];

}

- (void)leftAction:(UIButton *)sender {

    [ZSideManagerViewController showLeftView];

}

@end




@implementation ZChildViewController2

- (void)loadViews {
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    textLabel.font = [UIFont systemFontOfSize:17];
    textLabel.textColor = [UIColor blackColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = @"child 2";
    [self.view addSubview:textLabel];
    
    textLabel.frame = CGRectMake(30, 100, CGRectGetWidth(self.view.bounds) - 60, 40);
    self.view.backgroundColor = [UIColor magentaColor];
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setTitle:@"显示" forState:UIControlStateNormal];
    [left setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    left.frame = CGRectMake(30, 80, 50, 30);
    [self.view addSubview:left];
    
}

- (void)leftAction:(UIButton *)sender {
    
    [ZSideManagerViewController showLeftView];
    
}

@end


@implementation ZChildViewController3

- (void)loadViews {
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    textLabel.font = [UIFont systemFontOfSize:17];
    textLabel.textColor = [UIColor blackColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = @"child 3";
    [self.view addSubview:textLabel];
    
    textLabel.frame = CGRectMake(30, 100, CGRectGetWidth(self.view.bounds) - 60, 40);
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setTitle:@"显示" forState:UIControlStateNormal];
    [left setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    left.frame = CGRectMake(30, 80, 50, 30);
    [self.view addSubview:left];
    
}

- (void)leftAction:(UIButton *)sender {
    
    [ZSideManagerViewController showLeftView];
    
}

@end


@implementation ZChildViewController4

- (void)loadViews {
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    textLabel.font = [UIFont systemFontOfSize:17];
    textLabel.textColor = [UIColor blackColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = @"child 4";
    [self.view addSubview:textLabel];
    
    textLabel.frame = CGRectMake(30, 100, CGRectGetWidth(self.view.bounds) - 60, 40);
    self.view.backgroundColor = [UIColor brownColor];
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setTitle:@"显示" forState:UIControlStateNormal];
    [left setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    left.frame = CGRectMake(30, 80, 50, 30);
    [self.view addSubview:left];
    
}

- (void)leftAction:(UIButton *)sender {
    
    [ZSideManagerViewController showLeftView];
    
}

@end


@implementation ZChildViewController5

- (void)loadViews {
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    textLabel.font = [UIFont systemFontOfSize:17];
    textLabel.textColor = [UIColor blackColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = @"child 5";
    [self.view addSubview:textLabel];
    
    textLabel.frame = CGRectMake(30, 100, CGRectGetWidth(self.view.bounds) - 60, 40);
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setTitle:@"显示" forState:UIControlStateNormal];
    [left setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    left.frame = CGRectMake(30, 80, 50, 30);
    [self.view addSubview:left];
    
    UIButton *click = [UIButton buttonWithType:UIButtonTypeCustom];
    [click setTitle:@"点击测试" forState:UIControlStateNormal];
    [click setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [click addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    click.frame = CGRectMake(30, 200, 80, 30);
    [self.view addSubview:click];
    
}

- (void)leftAction:(UIButton *)sender {
    
    [ZSideManagerViewController showLeftView];
    
}

- (void)click:(UIButton *)sender {

    NSLog(@"测试一下点击事件");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"测试点击效果" message:@"测试点击效果" delegate:nil cancelButtonTitle:@"取消吧" otherButtonTitles:nil];
    [alert show];

}

@end
