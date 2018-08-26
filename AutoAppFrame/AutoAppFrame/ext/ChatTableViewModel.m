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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //从数据源(dataSource类)获取数据
        NSArray<IMSMessage *> *array =  [self fetchDataList];
        self.cellViewModelList = [self convertToCellViewModels:array];
    });
    
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
    NSMutableArray *cellVMArray = [NSMutableArray array];
    for (int i=0; i<100; i++) {
        IMSMessage *conv = [[IMSMessage alloc] init];
        conv.messageID = [NSString stringWithFormat:@"message-%u", i];
        conv.content = [NSString stringWithFormat:@"content-%u", i];
        
        [cellVMArray addObject:conv];
    }
    
    return cellVMArray;
}

+ (ChatCellViewModel *)createCellViewModel:(IMSMessage *)model {
    ChatCellViewModel *cellViewModel = [[ChatCellViewModel alloc] initWithModel:model];
    
    return cellViewModel;
}
@end
