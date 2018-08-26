//
//  ChatCellView.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "ChatCellView.h"

@interface ChatCellView ()

@end
@implementation ChatCellView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    
}




- (void)setContent:(NSString *)content {
    _content = content;
}

- (void)setMessageid:(NSString *)messageID {
    _messageID = messageID;
}




@end
