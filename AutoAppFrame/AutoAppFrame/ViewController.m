//
//  ViewController.m
//  AutoAppFrame
//
//  Created by jinhui  xue on 2018/8/26.
//  Copyright © 2018年 jinhui  xue. All rights reserved.
//

#import "ViewController.h"
#import "CommonPre.h"
#import "UIColor+ColorChange.h"
#import "CreateFile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createRightItem];
}


- (void)createRightItem{
    
    UIButton *createButton       = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    [createButton setTitle:@"生成" forState:UIControlStateNormal];
    [createButton setTitleColor:COLOR_3 forState:UIControlStateNormal];
    [createButton setTitleColor:COLOR_6 forState:UIControlStateHighlighted];
    [createButton addTarget:self action:@selector(createBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createButton];
    
}

- (void)createBtnClick{
    
    CreateFile * file = [[CreateFile alloc]init];
    file.fileName = self.filetextField.text;
    file.modelName = self.modeltextField.text;
    [file createFile];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
