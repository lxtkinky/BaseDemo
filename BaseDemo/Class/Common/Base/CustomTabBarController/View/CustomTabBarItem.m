//
//  CustomTabBarItem.m
//  BaseDemo
//
//  Created by test on 2018/1/10.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "CustomTabBarItem.h"

@implementation CustomTabBarItem{
    NSString *_currentImage;
    UIButton *_button;
    UILabel *_titleLabel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setModel:(TabBarItemModel *)model{
    _model = model;
    
    [self updateUI];
}

- (void)updateUI{
    if (_model) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = _model.title;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:PingFang_SC_Medium size:12.0];
        _titleLabel.textColor = _model.color;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button = button;
        [button setImage:[UIImage imageNamed:_model.image] forState:UIControlStateNormal];
        button.enabled = NO;
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(_titleLabel.mas_top);
        }];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureView:)];
        [self addGestureRecognizer:gesture];
    
    }
}

- (void)tapGestureView:(UITapGestureRecognizer *)gesture{
    if ([_currentImage isEqualToString:_model.selectImage]) {
        return;
    }
    
    if (self.itemSelectBock) {
        self.itemSelectBock(self);
    }
}

- (void)updateItemSelected:(BOOL)selected{
    if (selected) {
        [_button setImage:[UIImage imageNamed:_model.selectImage] forState:UIControlStateNormal];
        _currentImage = _model.selectImage;
        _titleLabel.textColor = _model.selectColor;
    }
    else{
        [_button setImage:[UIImage imageNamed:_model.image] forState:UIControlStateNormal];
        _currentImage = _model.image;
        _titleLabel.textColor = _model.color;
    }
}

/*
- (void)selectTabBarItemNotification:(NSNotification *)notificaion{
    NSLog(@"%@", notificaion);
    if (![[notificaion object] isEqual:self]) {
        [_button setImage:[UIImage imageNamed:_model.image] forState:UIControlStateNormal];
        _currentImage = _model.image;
//        _titleLabel.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:_model.image]];
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
 */

@end
