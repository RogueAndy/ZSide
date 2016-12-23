//
//  ZSideLeftCell.m
//  ZLJUI
//
//  Created by dazhongge on 2016/12/22.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

#import "ZSideLeftCell.h"

@interface ZSideLeftCell()

@property (nonatomic, strong, readwrite) UILabel *actionLabel;

@end

@implementation ZSideLeftCell

- (void)loadViews {

    self.backgroundColor = [UIColor clearColor];
    
    _actionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _actionLabel.font = [UIFont systemFontOfSize:15];
    _actionLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_actionLabel];

}

- (void)loadLayout {

    _actionLabel.frame = CGRectMake(20, 5, 150, 30);

}

- (void)drawRect:(CGRect)rect {

    [super drawRect:rect];
    
    UIColor *gray = [UIColor colorWithRed:180/255.f green:200/255.f blue:200/255.f alpha:1];
    [gray set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 41)];
    [path addLineToPoint:CGPointMake(300, 41)];
    [path stroke];

}

@end
