//
//  AppDelegate.m
//  BaseDemo
//
//  Created by test on 2018/1/9.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTabBarController.h"
#import "RootViewController.h"
#import "TabBarItemModel.h"
#import "CustomNavigationController.h"
#import "MeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIColor *color = [UIColor grayColor];
    UIColor *selectColor = RGBCOLOR(222, 123, 234);
    TabBarItemModel *model1 =  [TabBarItemModel modelWithTitle:@"关爱老人" image:@"careManNormal" selectImage:@"careMan" color:color selectColor:selectColor];
    TabBarItemModel *model2 = [TabBarItemModel modelWithTitle:@"照护计划" image:@"planNormal" selectImage:@"plan" color:color selectColor:selectColor];
    TabBarItemModel *model3 = [TabBarItemModel modelWithTitle:@"我的" image:@"meNormal" selectImage:@"me" color:color selectColor:selectColor];
    NSArray *array = @[model1, model2, model3];
    
    
    
    MeViewController *rootVC1 = [[MeViewController alloc] init];
    rootVC1.tabBarItemModels = array;
    RootViewController *rootVC2 = [[RootViewController alloc] init];
    rootVC2.tabBarItemModels = array;
    RootViewController *rootVC3 = [[RootViewController alloc] init];
    rootVC3.tabBarItemModels = array;
    
     CustomNavigationController *customNavVC1 = [[CustomNavigationController alloc] initWithRootViewController:rootVC1];
    
    CustomTabBarController *customTabBarVC = [[CustomTabBarController alloc] init];
    customTabBarVC.viewControllers = @[customNavVC1, rootVC2, rootVC3];
    
//    [self.window addSubview:customTabBarVC.view];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = customTabBarVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
