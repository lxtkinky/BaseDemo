//
//  CustomTabBarManager.h
//  BaseDemo
//
//  Created by test on 2018/1/10.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomTabBarManager : NSObject

@property (nonatomic) NSInteger index;  //tabBar选中索引

+ (instancetype)sharedInstance;

@end
