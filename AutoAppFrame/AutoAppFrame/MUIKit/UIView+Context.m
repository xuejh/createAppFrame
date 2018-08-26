//
//  UIView+Context.m
//  AppFramework
//
//  Created by zhengjf on 2018/3/27.
//  Copyright © 2018年 nd. All rights reserved.
//

#import "UIView+Context.h"
#import <objc/runtime.h>

static char *UIViewContextProtocol = "UIViewContextProtocolKey";
@implementation UIView (Context)
- (void)setContext:(id<UIViewContextProtocol>)delegate {
    
    objc_setAssociatedObject(self, UIViewContextProtocol, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<UIViewContextProtocol>)context {
    id<UIViewContextProtocol> context = [self p_context:self];
    if (!context) {
        context = [self parentContext:self.superview];
    }
    return context;
}

- (id<UIViewContextProtocol>)parentContext:(UIView *)parentView {
    if (!parentView) {
        return nil;
    }
    id<UIViewContextProtocol> context = [parentView p_context:parentView];
    if (!context) {
        context = [self parentContext:parentView.superview];
    } else {
        self.context = context;
    }
    
    return context;
}

- (id<UIViewContextProtocol>)p_context:(id)object {
    id<UIViewContextProtocol> context = objc_getAssociatedObject(object, UIViewContextProtocol);

    return context;
}
@end
