//
//  ChatCellViewModel.h
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMSMessage;
@interface ChatCellViewModel : NSObject

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *messageID;


- (instancetype)initWithModel:(IMSMessage *)iMSMessage;
- (NSUInteger)cellHeight;
@end
