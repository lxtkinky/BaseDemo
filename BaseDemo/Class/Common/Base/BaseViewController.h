//
//  BaseViewController.h
//  BaseDemo
//
//  Created by test on 2018/1/9.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController



/**
 网络连接错误
 */
- (void)showNetworkError;

- (void)setNavigationTitle:(NSString *)title;

/**隐藏返回按钮*/
- (void)hideLeftItem;

@end
