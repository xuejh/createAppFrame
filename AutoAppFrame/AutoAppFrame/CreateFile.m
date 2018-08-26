//
//  CreateFile.m
//  AutoAppFrame
//
//  Created by jinhui  xue on 2018/8/26.
//  Copyright © 2018年 jinhui  xue. All rights reserved.
//

#import "CreateFile.h"

@interface CreateFile()

@property (nonatomic,strong)NSDictionary * plistDic;




@end


@implementation CreateFile


- (instancetype)init {
    
    if (self = [super init]) {
        
        self.plistDic = [self convertPlist];
        
        
    }
    
    return self;
}


/**
 *  获取plist文件
 *
 *  @return 字典
 */
- (NSDictionary *)convertPlist {
    
    NSString     *path = [[NSBundle mainBundle] pathForResource:@"mainFile.plist" ofType:nil];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return data;
}


- (void)createFile {
    
    [self createOBjectiveCFile];
    [self createContextFile];
}



- (void)createOBjectiveCFile {
    
    [self createViewControllerFile];
    [self logPath];
    
}

- (void)logPath{
     NSLog(@"生成的文件在以下地址: \n%@", [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"]);
}

- (void)writeHeadFile:(NSString*)fileStr headfileName:(NSString*)headerName{
    
   NSString*  mfileStr = [fileStr stringByReplacingOccurrencesOfString:@"[FileName-WaitForReplaced]"
                                                                                               withString:self.fileName];
    NSError * error = nil;
    [mfileStr writeToFile:[self filePathWithFileName:[headerName stringByAppendingString:@".h"]]
                                     atomically:YES
                                       encoding:NSUTF8StringEncoding
                                          error:&error];
    
    
}

- (void)writeMFile:(NSString*)fileStr headfileName:(NSString*)headerName{
    
    NSString*  mfileStr = [fileStr stringByReplacingOccurrencesOfString:@"[FileName-WaitForReplaced]"
                                                             withString:self.fileName];
    NSError * error = nil;
    [mfileStr writeToFile:[self filePathWithFileName:[headerName stringByAppendingString:@".m"]]
               atomically:YES
                 encoding:NSUTF8StringEncoding
                    error:&error];
    
    
}



- (void)createViewControllerFile{
    
    NSString *viewControllerHeaderFileString = self.plistDic[@"viewControllerHeaderFileString"];
    NSString * viewControllerFileName = [NSString stringWithFormat:@"%@%@",self.fileName,@"ViewController"];
    [self writeHeadFile:viewControllerHeaderFileString headfileName:viewControllerFileName];
    
    NSString *viewControllerMFileString = self.plistDic[@"viewControllerMFileString"];
    [self writeMFile:viewControllerMFileString headfileName:viewControllerFileName];
    
}

- (void)createContextFile{
    
    NSString *contextHeaderFileString = self.plistDic[@"contextHeaderFileString"];
    NSString * contextFileName = [NSString stringWithFormat:@"%@%@",self.fileName,@"Context"];
    [self writeHeadFile:contextHeaderFileString headfileName:contextFileName];
    
    NSString *contextMFileString = self.plistDic[@"contextMFileString"];
    [self writeMFile:contextMFileString headfileName:contextFileName];
    
}



- (NSString *)filePathWithFileName:(NSString *)name {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@", name]];
}

@end
