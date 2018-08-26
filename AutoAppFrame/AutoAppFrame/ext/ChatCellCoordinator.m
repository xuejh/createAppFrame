//
//  ChatCellCoordinator.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "ChatCellCoordinator.h"
#import "ChatCellView.h"
#import "ChatCellViewModel.h"
#import "UIView+Context.h"
#import "ChatContext.h"
#import <KVOController/FBKVOController.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface ChatCellCoordinator ()
@property(nonatomic, weak) ChatCellView *cell;
@property(nonatomic, weak) ChatCellViewModel *cellViewModel;
@property(nonatomic, strong) FBKVOController *kvoController;
@end
@implementation ChatCellCoordinator
- (instancetype)initWithCellView:(ChatCellView *)cell {
    if (self = [super init]) {
        self.cell = cell;
    }
    return self;
}

- (void)bindData:(ChatCellViewModel *)cellViewModel {
    [_kvoController unobserveAll];
    
}

- (void)didSelectCellView {
    
}



- (FBKVOController *)kvoController {
    if (!_kvoController) {
        _kvoController = [[FBKVOController alloc] initWithObserver:self retainObserved:YES];
    }
    
    return _kvoController;
}
@end
