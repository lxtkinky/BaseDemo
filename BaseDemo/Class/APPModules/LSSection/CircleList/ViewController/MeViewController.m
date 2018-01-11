//
//  MeViewController.m
//  BaseDemo
//
//  Created by test on 2018/1/9.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "MeViewController.h"
#import "BaseViewController.h"
#import "CustomButton.h"
#import "UserCenterController.h"


@interface MeViewController ()

@property (nonatomic) NSInteger index;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationTitle:@"我的"];
    
    self.index = 100;
    
    
    CustomButton *button = [[CustomButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [button setImage:[UIImage imageNamed:@"alipay"] forState:UIControlStateNormal];
    [button setTitle:@"支付宝" forState:UIControlStateNormal];
    button.backgroundColor = RGBCOLOR(22, 55, 66);
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(60, 80));
    }];
    
    button.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        UserCenterController *baseVC = [[UserCenterController alloc] initWithNibName:NSStringFromClass([UserCenterController class]) bundle:nil];
        [self.navigationController pushViewController:baseVC animated:YES];
        return [RACSignal empty];
    }];
    
    NSObject *value = [self valueForKey:@"index"];
    NSLog(@"%@", value);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
