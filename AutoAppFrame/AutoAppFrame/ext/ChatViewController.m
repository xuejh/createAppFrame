//
//  ChatViewController.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatTableViewCoordinator.h"
#import "UIResponder+Router.h"
#import "UIView+Context.h"
#import "ChatContext.h"

@interface ChatViewController ()
@property (nonatomic, strong) ChatTableViewCoordinator *tableViewCD;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.context = [[ChatContext alloc] initWithViewController:self];
    
    // Do any additional setup after loading the view.
    [self installSubModule];
    
    
}

- (void)installSubModule {
    [self installTableViewModule];
}

- (void)installTableViewModule {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    self.tableViewCD = [[ChatTableViewCoordinator alloc] initWithTableView:tableView];
}



- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    //拦截事件
    
}
@end
