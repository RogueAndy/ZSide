//
//  ZSideManagerViewController.m
//  ZLJUI
//
//  Created by dazhongge on 2016/12/20.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

#import "ZSideManagerViewController.h"

// 手势移动方向的枚举类型

typedef NS_ENUM(NSInteger, ZPanGestureDirection) {
    
    ZNotMoveDirection   = 0,
    ZMoveUpDirection    = 1,
    ZMoveDownDirection  = 2,
    ZMoveLeftDirection  = 3,
    ZMoveRightDirection = 4
    
};


static ZSideManagerViewController *manager = nil;

@interface ZSideManagerViewController ()

@property (nonatomic, strong) UIViewController *leftController; //左边的控制器

@property (nonatomic, strong) UIViewController *centerController; //目前的中间控制器，用于内存记录作用

@property (nonatomic, strong) UIView *leftView; //用来代替左边控制器的 view

@property (nonatomic, strong) UIView *centerView; //用来代替中间控制器的 view

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture; // 手势控制

@property (nonatomic) CGPoint lasttimePoint; //最新的一次手势所在的坐标(非当前坐标)

@property (nonatomic) CGFloat maxMoveDistance; //设置侧滑栏移动的距离

@property (nonatomic, strong) UIView *preventView; //侧滑栏出现后，用于阻止中间 view 的一切效果

@property (nonatomic, strong) NSArray *viewControllers; //控制器集合

@end

@implementation ZSideManagerViewController

#pragma mark - single Method

+ (instancetype)initWithLeftController:(UIViewController *)leftController centerControllers:(NSArray<UIViewController *> *)centerControllers moveMaxDistance:(CGFloat)distance {

    NSAssert(leftController && centerControllers, @"leftController or centerController can't be nil");
    ZSideManagerViewController *side = [self shareInstance];
    side.leftController = leftController;
    side.viewControllers = centerControllers;
    side.maxMoveDistance = distance;
    return side;

}

+ (instancetype)initWithLeftController:(UIViewController *)leftController centerControllers:(NSArray<UIViewController *> *)centerControllers {
    
    NSAssert(leftController && centerControllers, @"leftController or centerController can't be nil");
    ZSideManagerViewController *side = [self shareInstance];
    side.leftController = leftController;
    side.viewControllers = centerControllers;
    return side;
    
}

+ (void)showLeftView {
    
    [manager showLeftView];
    
}

+ (void)hideLeftView {
    
    [manager hideLeftView];
    
}

+ (void)selectViewControllerOfIndex:(NSInteger)index {

    [manager switchToViewController:index];

}

+ (instancetype)shareInstance {

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        manager = [[self alloc] init];
        
    });
    
    return manager;

}

#pragma mark - set Method

- (void)setViewControllers:(NSArray *)viewControllers {

    _viewControllers = viewControllers;
    for (UIViewController *viewController in _viewControllers) {
    
        [self addChildViewController:viewController];
    
    }

}

#pragma mark - lazy load

- (UIView *)preventView {

    if(!_preventView) {
    
        _preventView = [[UIView alloc] initWithFrame:self.centerView.bounds];
        [self.centerView addSubview:_preventView];
    
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPreventView:)];
        _preventView.userInteractionEnabled = YES;
        [_preventView addGestureRecognizer:tap];
        _preventView.backgroundColor = [UIColor clearColor];
    }
    
    return _preventView;

}

#pragma mark - load Base views

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)loadInit {
    
    self.centerController = [self.childViewControllers firstObject];
    self.leftView = self.leftController.view;
    self.centerView = [self.centerController view];
    self.leftView.frame = [self leftViewBaseRect];
    self.centerView.frame = [self centerViewBaseRect];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(vvGestureAction:)];
    [self.view addGestureRecognizer:self.panGesture];

}

- (void)loadViews {

    

}

- (void)loadLayout {

    [self.view addSubview:self.centerView];
    [self.view addSubview:self.leftView];

}

#pragma mark - lazy load

- (CGFloat)maxMoveDistance {

    if(!_maxMoveDistance || _maxMoveDistance == 0) {
    
        _maxMoveDistance = 300.0;
    
    }
    
    return _maxMoveDistance;

}

#pragma mark - dynamic method in static method

- (void)showLeftView {

    [UIView animateWithDuration:0.25
                     animations:^{
                         
                         [self setLeftViewOverRect];
                         if(self.isCenterViewControllerMoveAlongWithLeft) {
                             
                             [self setCenterViewOverRect];
                             
                         }
                         
                     } completion:^(BOOL finished) {
                         
                         [self setPreventViewAppear];
                         
                     }];
    
}

- (void)hideLeftView {

    [UIView animateWithDuration:0.25
                     animations:^{
                         
                         [self setLeftViewBaseRect];
                         if(self.isCenterViewControllerMoveAlongWithLeft) {
                             
                             [self setCenterViewBaseRect];
                             
                         }
                         
                     } completion:^(BOOL finished) {
                         
                         [self setPreventViewDisAppear];
                         
                     }];

}

#pragma mark - set LeftViewController and CenterViewController's base frame

- (CGRect)leftViewBaseRect {

    return CGRectMake(-self.maxMoveDistance, 0, self.maxMoveDistance, CGRectGetHeight([[UIScreen mainScreen] bounds]));

}

- (CGRect)leftViewOverRect {

    return CGRectMake(0, 0, self.maxMoveDistance, CGRectGetHeight([[UIScreen mainScreen] bounds]));

}

- (CGRect)centerViewBaseRect {
    
    return self.view.bounds;
    
}

- (CGRect)centerViewOverRect {
    
    return CGRectMake(self.maxMoveDistance, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds]));
    
}

#pragma mark - set leftView and centerView's frame

- (void)setLeftViewBaseRect {
    
    self.leftView.frame = [self leftViewBaseRect];
    
}

- (void)setLeftViewOverRect {
    
    self.leftView.frame = [self leftViewOverRect];
    
}

- (void)setCenterViewBaseRect {
    
    self.centerView.frame = [self centerViewBaseRect];
    
}

- (void)setCenterViewOverRect {
    
    self.centerView.frame = [self centerViewOverRect];
    
}

- (void)setPreventViewAppear {

    self.preventView.alpha = 1;

}

- (void)setPreventViewDisAppear {

    self.preventView.alpha = 0;
    
    [self.preventView removeFromSuperview];
    self.preventView = nil;

}

#pragma mark - Selector Method


- (void)vvGestureAction:(UIPanGestureRecognizer *)gesture {

    CGPoint panPoint = [gesture translationInView:self.view];
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
        
            self.lasttimePoint = panPoint;
        
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
        
            [self moveWithUserPangesture:[self makeDirectionWithNowPoint:panPoint beforePoint:self.lasttimePoint]];
        
        }
            break;
            
        case UIGestureRecognizerStateEnded:
        {
        
            [self stopDragAndViewGoBack];
        
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - PanGesture and TapGesture Method

- (void)tapPreventView:(UITapGestureRecognizer *)tap {

    [self hideLeftView];

}

- (void)moveWithUserPangesture:(CGFloat)distance {

    [self leftViewRectAfterMove:distance];
    [self centerViewRectAfterMove:distance];

}

#pragma mark - use this Method when view is moving

- (void)leftViewRectAfterMove:(CGFloat)distance {
    
    if(self.leftView.frame.origin.x + distance <= -self.maxMoveDistance) {
    
        self.leftView.frame = [self leftViewBaseRect];
        return;
    
    }
    
    if(self.leftView.frame.origin.x + distance >= 0) {
    
        self.leftView.frame = [self leftViewOverRect];
        return;
    
    }

    self.leftView.frame = CGRectMake(self.leftView.frame.origin.x + distance, self.leftView.frame.origin.y, CGRectGetWidth(self.leftView.frame), CGRectGetHeight(self.leftView.frame));

}

- (void)centerViewRectAfterMove:(CGFloat)distance {
    
    if(!self.isCenterViewControllerMoveAlongWithLeft) {
    
        return;
    
    }

    if(self.centerView.frame.origin.x + distance <= 0) {
        
        self.centerView.frame = [self centerViewBaseRect];
        return;
        
    }
    
    if(self.centerView.frame.origin.x + distance >= self.maxMoveDistance) {
        
        self.centerView.frame = [self centerViewOverRect];
        return;
        
    }
    
    self.centerView.frame = CGRectMake(self.centerView.frame.origin.x + distance, self.centerView.frame.origin.y, CGRectGetWidth(self.centerView.frame), CGRectGetHeight(self.centerView.frame));

}

#pragma mark - when user stop the drag, the view need go back and stop

- (void)stopDragAndViewGoBack {

    CGFloat leftViewOriginX = self.leftView.frame.origin.x;
    
    if(leftViewOriginX < - self.maxMoveDistance / 2.0) {
        
        if(self.isCenterViewControllerMoveAlongWithLeft) {
            
            [UIView animateWithDuration:0.25 animations:^{
                
                [self setLeftViewBaseRect];
                [self setCenterViewBaseRect];
                
            } completion:^(BOOL finished) {
                
                [self setPreventViewDisAppear];
                
            }];
            
            return;
        
        }
        
        [UIView animateWithDuration:0.25 animations:^{
            
            [self setLeftViewBaseRect];
            
        } completion:^(BOOL finished) {
            
            [self setPreventViewDisAppear];
            
        }];
        
        return;
        
    }
    
    if(self.isCenterViewControllerMoveAlongWithLeft) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            [self setLeftViewOverRect];
            [self setCenterViewOverRect];
            
        } completion:^(BOOL finished) {
            
            [self setPreventViewAppear];
            
        }];
        
        return;
        
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self setLeftViewOverRect];
        
    } completion:^(BOOL finished) {
        
        [self setPreventViewAppear];
        
    }];

}

#pragma mark - get the distance for the moving

- (CGFloat)makeDirectionWithNowPoint:(CGPoint)nowPoint beforePoint:(CGPoint)beforePoint {

    CGFloat distance = nowPoint.x - beforePoint.x;
    self.lasttimePoint = nowPoint;
    
    return distance;

}

#pragma mark - click left menus and switch to viewController

- (void)switchToViewController:(NSInteger)index {

    UIViewController *selectViewController = [self.childViewControllers objectAtIndex:index];
    if(selectViewController == self.centerController) {
    
        [self hideLeftView];
        return;
    
    }
    
    self.centerView = selectViewController.view;
    [self setCenterViewOverRect];
    [self transitionFromViewController:self.centerController
                      toViewController:selectViewController
                              duration:0
                               options:UIViewAnimationOptionTransitionNone
                            animations:^{
                                
                            }
                            completion:^(BOOL finished) {
                                
                                self.centerController = selectViewController;
                                [self hideLeftView];
                                
                            }];

}

@end
