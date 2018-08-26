//
//  UIResponder+Router.m
//  AppFramework
//
//  Created by zhengjf on 2018/3/27.
//  Copyright © 2018年 nd. All rights reserved.
//

#import "UIResponder+Router.h"
#import <objc/runtime.h>

static char *EventDelegateKey = "eventDelegateKey";
@implementation UIResponder (Router)
//沿着响应者链将事件往父视图传递， 事件最终被拦截处理 或者 无人处理直接丢弃
- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    if([self.eventDelegate respondsToSelector:@selector(routeEvent:userInfo:)]) {
        
        [self.eventDelegate routeEvent:eventName userInfo:userInfo];
    }
    
    [self.nextResponder routeEvent:eventName userInfo:userInfo];
}

- (void)setEventDelegate:(id<UIResponderEventProtocol>)delegate {
 
    objc_setAssociatedObject(self, EventDelegateKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<UIResponderEventProtocol>)eventDelegate {
    return objc_getAssociatedObject(self, EventDelegateKey);
}
@end
