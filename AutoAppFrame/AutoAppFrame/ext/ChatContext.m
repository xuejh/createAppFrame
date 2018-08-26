//
//  ChatContext.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "ChatContext.h"

@interface ChatContext ()
@property(nonatomic, weak) UIViewController *controller;
@end
@implementation ChatContext
- (instancetype)initWithViewController:(UIViewController *)controller {
    if (self=[super init]) {
        self.controller = controller;
    }
    
    return self;
}
@end