//
//  TabBarItemModel.h
//  BaseDemo
//
//  Created by test on 2018/1/10.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "BaseModel.h"

@interface TabBarItemModel : BaseModel

@property (nonatomic, copy) NSString *title;        //标题
@property (nonatomic, copy) NSString *image;        //未选中图片
@property (nonatomic, copy) NSString *selectImage;  //选中图片
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *selectColor;

+ (TabBarItemModel *)modelWithTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage;

+ (TabBarItemModel *)modelWithTitle:(NSString *)title
                              image:(NSString *)image
                        selectImage:(NSString *)selectImage
                              color:(UIColor *)color
                        selectColor:(UIColor *)selectColor;

@end
