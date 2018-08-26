//
//  UIResponder+Router.h
//  AppFramework
//
//  Created by zhengjf on 2018/3/27.
//  Copyright © 2018年 nd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIResponderEventProtocol <NSObject>
- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;
@end

@interface UIResponder (Router)
@property(nonatomic, weak) id<UIResponderEventProtocol> eventDelegate;
- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;
@end
