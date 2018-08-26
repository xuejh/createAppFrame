//
//  ChatCellCoordinator.h
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChatCellView;
@class ChatCellViewModel;
@interface ChatCellCoordinator : NSObject
- (instancetype)initWithCellView:(ChatCellView *)cell;
- (void)bindData:(ChatCellViewModel *)cellViewModel;
- (void)didSelectCellView;
@end
