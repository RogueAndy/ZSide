//
//  ZSideManagerViewController.h
//  ZLJUI
//
//  Created by dazhongge on 2016/12/20.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

#import "ZBaseViewController.h"

@interface ZSideManagerViewController : ZBaseViewController

// 设置中间的控制器是否随着左侧的控制器滑动而滑动

@property (nonatomic, assign) BOOL isCenterViewControllerMoveAlongWithLeft;

// 初始化一个对象，leftController 左侧控制器， centerControllers 中间需要显示的控制器的数组集合

+ (instancetype)initWithLeftController:(UIViewController *)leftController centerControllers:(NSArray<UIViewController *> *)centerControllers moveMaxDistance:(CGFloat)distance;

+ (instancetype)initWithLeftController:(UIViewController *)leftController centerControllers:(NSArray<UIViewController *> *)centerControllers;

// 静态方法外部控制显示侧滑栏(本来想使用 代理 来完成该功能，但是为了显得只管，毕竟不喜欢代理功能，所以直接用静态方法封装)

+ (void)showLeftView;

// 静态方法外部控制关闭侧滑栏

+ (void)hideLeftView;

// 静态方法外部控制跳转到某一个控制器

+ (void)selectViewControllerOfIndex:(NSInteger)index;

@end
