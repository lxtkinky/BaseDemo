//
//  BaseViewController.m
//  BaseDemo
//
//  Created by test on 2018/1/9.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomNavigationController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIView *navBarBackView;
@property (nonatomic, strong) UIView *customNavBar;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UILabel *backTitleLabel;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation BaseViewController

+ (void)load{
    [SVProgressHUD setBackgroundColor:COLOR(255, 255, 255, 1)];
    NSLog(@"====%@ load=====", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBCOLOR(255, 255, 255);
    NSLog(@"*******************%@ viewDidLoad*********************", self);
    
    
    [self.view addSubview:self.navBarBackView];
    [self.navBarBackView addSubview:self.customNavBar];
    
    [self.customNavBar addSubview:self.backImageView];
    [self.customNavBar addSubview:self.titleLabel];
    
    [self.customNavBar addSubview:self.backTitleLabel];
    
    [self.customNavBar addSubview:self.backButton];
    
    [self.customNavBar addSubview:self.line];
    
    [self lxt_addConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    NSLog(@"*******************%@ dealloc*********************", self);
}


- (void)lxt_addConstraints{
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    
    [self.navBarBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(statusBarFrame.size.height + 44);
    }];
    
    [self.customNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navBarBackView).with.offset(statusBarFrame.size.height);
        make.left.equalTo(self.navBarBackView);
        make.right.equalTo(self.navBarBackView);
        make.height.mas_equalTo(44);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.customNavBar);
    }];
    
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.customNavBar).with.offset(8);
        make.centerY.equalTo(self.customNavBar);
    }];
    
    [self.backTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImageView.mas_right).with.offset(4);
        make.centerY.equalTo(self.backImageView);
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.customNavBar);
        make.top.equalTo(self.customNavBar);
        make.bottom.equalTo(self.customNavBar);
        make.width.mas_equalTo(100);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.customNavBar);
        make.right.equalTo(self.customNavBar);
        make.bottom.equalTo(self.customNavBar);
        make.height.mas_equalTo(0.5);
    }];
}

//隐藏返回按钮
- (void)hideLeftItem{
    self.backButton.hidden = YES;
    self.backImageView.hidden = YES;
    self.backTitleLabel.hidden = YES;
}

#pragma mark - getter setter

- (void)setNavigationTitle:(NSString *)title{
    self.titleLabel.text = title;
}

- (UIView *)navBarBackView{
    if (!_navBarBackView) {
        _navBarBackView = [[UIView alloc] init];
        _navBarBackView.backgroundColor = RGBCOLOR(112, 158, 25);
    }
    return _navBarBackView;
}

- (UIView *)customNavBar{
    if (!_customNavBar) {
        _customNavBar = [[UIView alloc] init];
    }
    return _customNavBar;
}

- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}

- (UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] init];
        _backImageView.image = [UIImage imageNamed:@"back"];
    }
    return _backImageView;
}

- (UILabel *)backTitleLabel{
    if (!_backTitleLabel) {
        _backTitleLabel = [[UILabel alloc] init];
        _backTitleLabel.font = [UIFont fontWithName:PingFang_SC_Medium size:14.0];
        _backTitleLabel.textColor = [UIColor whiteColor];
        _backTitleLabel.text = @"返回";
    }
    return _backTitleLabel;
}

- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        WeakSelf
        _backButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            if (weakSelf.navigationController) {
                [UIView animateWithDuration:0.3 animations:^{
                    weakSelf.customNavBar.alpha = 0;
                }];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
            else{
                [weakSelf dismissViewControllerAnimated:YES completion:nil];
            }
            
            return [RACSignal empty];
        }];
    }
    return _backButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:PingFang_SC_Medium size:17];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (void)showNetworkError{
    [SVProgressHUD showErrorWithStatus:@"请检查您的网络，或稍后再试！"];
}

@end
