//
//  TabBarItemModel.m
//  BaseDemo
//
//  Created by test on 2018/1/10.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "TabBarItemModel.h"

@implementation TabBarItemModel

+ (TabBarItemModel *)modelWithTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
    TabBarItemModel *model = [[TabBarItemModel alloc] init];
    model.image = image;
    model.title = title;
    model.selectImage = selectImage;
    return model;
}

+ (TabBarItemModel *)modelWithTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage color:(UIColor *)color selectColor:(UIColor *)selectColor{
    TabBarItemModel *model = [[TabBarItemModel alloc] init];
    model.image = image;
    model.title = title;
    model.selectImage = selectImage;
    model.color = color;
    model.selectColor = selectColor;
    return model;
}

@end
