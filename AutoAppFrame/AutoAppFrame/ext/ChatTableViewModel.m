//
//  ChatTableViewModel.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "ChatTableViewModel.h"
#import "IMSMessage.h"
#import "ChatCellViewModel.h"

@interface ChatTableViewModel ()
@property (nonatomic, strong) NSArray<ChatCellViewModel *> *cellViewModelList;  //Model
@end
@implementation ChatTableViewModel
- (void)fetchData {
    
    
}

- (NSArray *)convertToCellViewModels:(NSArray<IMSMessage *> *)array {
    
    NSMutableArray *cellVMArray = [NSMutableArray array];
    for (int i=0; i<[array count]; i++) {
        IMSMessage *model = array[i];
        ChatCellViewModel *cellViewModel = [ChatTableViewModel createCellViewModel:model];
        
        [cellVMArray addObject:cellViewModel];
    }
    return cellVMArray;
}

- (NSArray<IMSMessage *> *)fetchDataList {
    
}

+ (ChatCellViewModel *)createCellViewModel:(IMSMessage *)model {
    ChatCellViewModel *cellViewModel = [[ChatCellViewModel alloc] initWithModel:model];
    
    return cellViewModel;
}
@end
