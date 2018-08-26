//
//  ChatCellViewModel.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "ChatCellViewModel.h"
#import "IMSMessage.h"

@interface ChatCellViewModel ()
@property (nonatomic, strong) IMSMessage *iMSMessage;
@end
@implementation ChatCellViewModel
- (instancetype)initWithModel:(IMSMessage *)iMSMessage {
    if (self=[super init]) {
        
    }
    return self;
}



- (NSUInteger)cellHeight {
    
    return 44;
}
@end
