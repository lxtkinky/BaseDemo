//
//  LoginViewController.m
//  BaseDemo
//
//  Created by test on 2018/1/9.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIView *customTitleView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationItem.titleView = self.customTitleView;
    [self setNavigationTitle:@"登录"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
