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
    [self createTableViewModelFile];
    [self createCellViewFile];
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

- (void)createTableViewModelFile{
    
    NSString *tableViewModelHeaderFileString = self.plistDic[@"tableViewModelHeaderFileString"];
    NSString * tableViewModelFileName = [NSString stringWithFormat:@"%@%@",self.fileName,@"TableViewModel"];
    [self writeHeadFile:tableViewModelHeaderFileString headfileName:tableViewModelFileName];
    
    NSString *tableViewModelMFileString = self.plistDic[@"tableViewModelMFileString"];
    
    tableViewModelMFileString  = [tableViewModelMFileString  stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                         withString:self.modelName];
   [self writeMFile:tableViewModelMFileString headfileName:tableViewModelFileName];
}

- (void)createCellViewFile{
    
    NSString *cellViewHeaderFileString = self.plistDic[@"cellViewHeaderFileString"];
    NSString * cellViewFileName = [NSString stringWithFormat:@"%@%@",self.fileName,@"CellView"];
    
    NSDictionary * data = [self getCellModelPlist];
    
    
    // 替换头文件属性
    NSString *propetiesString = @"";
    
    NSArray * keys = [data allKeys];
    for (int i=0; i<keys.count; i++) {
        
        NSString *value = [keys objectAtIndex:i];
        NSString *type = [data objectForKey:value];
        
        NSString *tmpSting = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;\n", type,value];
        propetiesString = [propetiesString stringByAppendingString:tmpSting];
        
    }
    
    cellViewHeaderFileString = [cellViewHeaderFileString stringByReplacingOccurrencesOfString:@"[PropertiesList-WaitForReplaced]"
                                                                                       withString:propetiesString];

    [self writeHeadFile:cellViewHeaderFileString headfileName:cellViewFileName];
    
    
    NSString *cellViewMFileString = self.plistDic[@"cellViewMFileString"];
    propetiesString = @"";
    for (int i=0; i<keys.count; i++) {
        
        NSString *value = [keys objectAtIndex:i];
        NSString *type = [data objectForKey:value];
        NSString * bValue = [value capitalizedString];
        
        NSString *tmpSting = [NSString stringWithFormat:@"- (void)set%@:(%@ *)%@ {\n    _%@ = %@;\n}\n\n",bValue, type,value,value,value];
        propetiesString = [propetiesString stringByAppendingString:tmpSting];
        
    }
    
    cellViewMFileString = [cellViewMFileString stringByReplacingOccurrencesOfString:@"[PropertiesList-WaitForReplaced]"
                                                                                   withString:propetiesString];
    
    [self writeMFile:cellViewMFileString headfileName:cellViewFileName];
    
    
}

- (NSString *)filePathWithFileName:(NSString *)name {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@", name]];
}

- (NSDictionary*)getCellModelPlist{
    NSString     *path = [[NSBundle mainBundle] pathForResource:@"cellModel.plist" ofType:nil];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path];
    return data;
}
@end
