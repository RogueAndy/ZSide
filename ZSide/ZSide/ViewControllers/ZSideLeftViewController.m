//
//  ZSideLeftViewController.m
//  ZLJUI
//
//  Created by dazhongge on 2016/12/20.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

#import "ZSideLeftViewController.h"
#import "ZSideLeftCell.h"
#import "ZSideManagerViewController.h"

@interface ZSideLeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *buttonTable;

@property (nonatomic, strong) NSArray *buttonNames;

@end

@implementation ZSideLeftViewController

- (void)loadInit {

    self.view.backgroundColor = [UIColor orangeColor];
    _buttonNames = @[@"第一个", @"第二个", @"第三个", @"第四个", @"第五个"];

}

- (void)loadViews {

    _buttonTable = [[UITableView alloc] initWithFrame:CGRectZero];
    _buttonTable.delegate = self;
    _buttonTable.dataSource = self;
    UIView *clearView = [UIView new];
    clearView.backgroundColor = [UIColor clearColor];
    [_buttonTable setTableFooterView:clearView];
    [self.view addSubview:_buttonTable];

}

- (void)loadLayout {

    _buttonTable.frame = CGRectMake(0, 200, 300, 200);

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _buttonNames.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifier = @"ZSideLeftCell";
    ZSideLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell) {
    
        cell = [[ZSideLeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    }
    cell.actionLabel.text = [_buttonNames objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 42;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [ZSideManagerViewController selectViewControllerOfIndex:indexPath.row];

}

@end
