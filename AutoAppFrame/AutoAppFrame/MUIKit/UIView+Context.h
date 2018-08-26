//
//  UIView+Context.h
//  AppFramework
//
//  Created by zhengjf on 2018/3/27.
//  Copyright © 2018年 nd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIViewContextProtocol <NSObject>
@property(nonatomic, weak, readonly) UIViewController *controller;
- (instancetype)initWithViewController:(UIViewController *)controller;
@end

@interface UIView (Context)
@property(nonatomic, strong) id<UIViewContextProtocol> context;
@end
