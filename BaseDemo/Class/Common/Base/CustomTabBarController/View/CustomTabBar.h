//
//  CustomTabBar.h
//  BaseDemo
//
//  Created by test on 2018/1/10.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TabBarSelectBlock)(NSInteger selectIndex);

@interface CustomTabBar : UIView

@property (nonatomic, strong) NSArray *itemModels;

@property (nonatomic, copy) TabBarSelectBlock tabBarSelectBlock;

@end
