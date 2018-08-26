//
//  CreateFile.h
//  AutoAppFrame
//
//  Created by jinhui  xue on 2018/8/26.
//  Copyright © 2018年 jinhui  xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreateFile : NSObject

@property (nonatomic,strong)NSString *fileName;
@property (nonatomic,strong)NSString *modelName;

- (void)createFile;

@end
