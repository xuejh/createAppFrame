//
//  ChatTableViewModel.h
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChatCellViewModel;
@interface ChatTableViewModel : NSObject
@property (nonatomic, strong, readonly) NSArray<ChatCellViewModel *> *cellViewModelList;  //Model
- (void)fetchData;
@end
