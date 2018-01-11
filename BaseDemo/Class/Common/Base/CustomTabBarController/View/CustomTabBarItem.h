//
//  CustomTabBarItem.h
//  BaseDemo
//
//  Created by test on 2018/1/10.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarItemModel.h"

@class CustomTabBarItem;
typedef void(^ItemSelectBock)(CustomTabBarItem *item);

@interface CustomTabBarItem : UIView

@property (nonatomic, weak) TabBarItemModel *model;

@property (nonatomic, copy) ItemSelectBock itemSelectBock;

- (void)updateItemSelected:(BOOL)selected;

@end
