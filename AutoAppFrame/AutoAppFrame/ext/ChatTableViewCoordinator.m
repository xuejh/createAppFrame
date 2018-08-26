//
//  ChatTableViewCoordinator.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "ChatTableViewCoordinator.h"
#import "ChatTableViewModel.h"
#import "ChatCellViewModel.h"
#import "ChatCellCoordinator.h"
#import "ChatCellView.h"
#import "UIView+Context.h"
#import "ChatContext.h"
#import <KVOController/FBKVOController.h>

@interface ChatTableViewCoordinator ()<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property(nonatomic, strong) FBKVOController *kvoController;
@property(nonatomic, strong) ChatTableViewModel *viewModel;
@property(nonatomic, strong) NSMutableDictionary *coordinatorDic; //用于保存cell协调器，用于和cell一一对应
@end
@implementation ChatTableViewCoordinator
- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self=[super init]) {
        _tableView = tableView;
        tableView.delegate = self;
        tableView.dataSource = self;
        
        [self bindData];
        [self fetchData];
    }
    
    return self;
}



- (void)bindData {
    [_kvoController unobserveAll];
    __weak typeof (self) wearkSelf = self;
    [self.kvoController observe:self.viewModel keyPath:@"cellViewModelList" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id observer, id object, NSDictionary *change) {
        
        [wearkSelf.tableView reloadData];
    }];
    
    
}

- (void)fetchData {
    [self.viewModel fetchData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.cellViewModelList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatCellViewModel *cellViewModel = self.viewModel.cellViewModelList[indexPath.row];
    return [cellViewModel cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellViewModel = self.viewModel.cellViewModelList[indexPath.row];
    NSString *identifier = @"ChatPlainTextCell";
    ChatCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ChatCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    ChatCellCoordinator *cellCoordinator = [self getCoordinatorWithCell:cell];
    [cellCoordinator bindData:cellViewModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSNumber *cellAddress = @((UInt64)cell);
    ChatCellCoordinator *cellCoordinator = [self.coordinatorDic objectForKey:cellAddress];
    [cellCoordinator didSelectCellView];
}

- (ChatCellCoordinator *)getCoordinatorWithCell:(ChatCellView *)cell {
    NSNumber *cellAddress = @((UInt64)cell);
    ChatCellCoordinator *cellCoordinator = [self.coordinatorDic objectForKey:cellAddress];
    if (!cellCoordinator) {
        cellCoordinator = [[ChatCellCoordinator alloc] initWithCellView:cell];
        [self.coordinatorDic setObject:cellCoordinator forKey:cellAddress];
    }
    return cellCoordinator;
}

- (FBKVOController *)kvoController {
    if (!_kvoController) {
        _kvoController = [[FBKVOController alloc] initWithObserver:self retainObserved:YES];
    }
    
    return _kvoController;
}

- (NSMutableDictionary *)coordinatorDic {
    if (!_coordinatorDic) {
        _coordinatorDic = [NSMutableDictionary dictionary];
    }
    return _coordinatorDic;
}

- (ChatTableViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ChatTableViewModel alloc] init];
    }
    return _viewModel;
}
@end
