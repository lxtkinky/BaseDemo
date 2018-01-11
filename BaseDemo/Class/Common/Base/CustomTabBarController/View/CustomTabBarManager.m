//
//  CustomTabBarManager.m
//  BaseDemo
//
//  Created by test on 2018/1/10.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "CustomTabBarManager.h"

static id instance;

@implementation CustomTabBarManager

+ (instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CustomTabBarManager alloc] init];
    });
    
    return instance;
}

@end
