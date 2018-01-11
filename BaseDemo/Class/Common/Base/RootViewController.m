//
//  RootViewController.m
//  BaseDemo
//
//  Created by test on 2018/1/9.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "RootViewController.h"
#import "CustomTabBar.h"
#import "TabBarItemModel.h"

@interface RootViewController ()

//@property (nonatomic, strong) UIView *customTabBar;

@property (nonatomic, strong) CustomTabBar *customTabBar;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //隐藏返回 NavigationController的跟控制器不需要返回 
    [self hideLeftItem];
    
    
    [self.view addSubview:self.customTabBar];
    self.customTabBar.itemModels = self.tabBarItemModels;
    WeakSelf
    self.customTabBar.tabBarSelectBlock = ^(NSInteger selectIndex) {
        [weakSelf.tabBarController setSelectedIndex:selectIndex];
    };
    [self.customTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(60);
    }];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter setter

- (CustomTabBar *)customTabBar{
    if (!_customTabBar) {
        _customTabBar = [[CustomTabBar alloc] init];
        _customTabBar.backgroundColor = RGBCOLOR(123, 234, 212);
    }
    
    return _customTabBar;
}

//- (UIView *)customTabBar{
//    if (!_customTabBar) {
//        _customTabBar = [[UIView alloc] init];
//        UIView *line = [[UIView alloc] init];
//        [_customTabBar addSubview:line];
//        [line mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(_customTabBar);
//            make.right.equalTo(_customTabBar);
//            make.top.equalTo(_customTabBar);
//            make.height.mas_equalTo(0.5);
//        }];
//
//        for (int i = 0; i < self.tabBarController.viewControllers.count; i++) {
//            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0 + 100 * i, 0, 100, 44)];
//            button.tag = i + 1;
//            button.backgroundColor = [UIColor redColor];
//            [button setTitle:@"首页" forState:UIControlStateNormal];
//            [_customTabBar addSubview:button];
//            WeakSelf
//            button.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(UIButton *button) {
//                [weakSelf.tabBarController setSelectedIndex:button.tag -1];
//                return [RACSignal empty];
//            }];
//        }
//    }
//
//    return _customTabBar;
//}


@end
