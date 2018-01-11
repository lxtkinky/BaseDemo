//
//  CustomTabBar.m
//  BaseDemo
//
//  Created by test on 2018/1/10.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "CustomTabBar.h"
#import "TabBarItemModel.h"
#import "CustomTabBarItem.h"
#import "CustomTabBarManager.h"

static CustomTabBarManager *manager;

@interface CustomTabBar()

@property (nonatomic, strong) NSMutableArray *tabBarItems;

@end

@implementation CustomTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        manager = [CustomTabBarManager sharedInstance];
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectTabBarItemNotification:) name:SelectItemNotification object:nil];
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)initTabBarItems{
    NSMutableArray *array = [NSMutableArray array];
    self.tabBarItems = array;
    for (int i = 0; i < _itemModels.count; i++) {
        TabBarItemModel *model = [_itemModels objectAtIndex:i];
        CustomTabBarItem *item = [[CustomTabBarItem alloc] init];
        WeakSelf
        item.itemSelectBock = ^(CustomTabBarItem *item) {
            [weakSelf selectItem:item];
        };
        item.model = model;
        if (manager.index == i) {
            [item updateItemSelected:YES];
        }
        [self addSubview:item];
        [array addObject:item];
    }
    
    for (int i = 0; i < array.count; i++) {
        CustomTabBarItem *item = [array objectAtIndex:i];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(self);
            }
            else{
                CustomTabBarItem *preItem = [array objectAtIndex:i - 1];
                make.left.equalTo(preItem.mas_right);
                make.width.equalTo(preItem);
            }
            
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            
            if (i == array.count - 1) {
                make.right.equalTo(self);
            }
            
        }];
    }
}

- (void)selectItem:(CustomTabBarItem *)item{
    NSInteger index = [self.tabBarItems indexOfObject:item];
    [[NSNotificationCenter defaultCenter] postNotificationName:SelectItemNotification object:@(index)];
    if (self.tabBarSelectBlock) {
        self.tabBarSelectBlock(index);
    }
}

- (void)selectTabBarItemNotification:(NSNotification *)notification{
    NSInteger index = [notification.object integerValue];
    manager.index = index;
    for (int i = 0; i < self.tabBarItems.count; i++) {
        CustomTabBarItem *item = [self.tabBarItems objectAtIndex:i];
        if (index == i) {
            [item updateItemSelected:YES];
        }
        else{
            [item updateItemSelected:NO];
        }
    }
}


- (void)setItemModels:(NSArray *)itemModels{
    _itemModels = itemModels;
    [self initTabBarItems];
}



@end
