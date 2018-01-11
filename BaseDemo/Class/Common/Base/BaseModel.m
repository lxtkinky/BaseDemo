//
//  BaseModel.m
//  BaseDemo
//
//  Created by test on 2018/1/10.
//  Copyright © 2018年 lixt. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>

@implementation BaseModel

- (void)encodeWithCoder:(NSCoder *)coder
{
    u_int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *properName = property_getName(properties[i]);
        NSString *key = [NSString stringWithCString:properName encoding:NSUTF8StringEncoding];
        NSObject *value = [self valueForKey:key];
        [coder encodeObject:value forKey:key];
    }
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        u_int count = 0;
        objc_property_t *properties = class_copyPropertyList([self class], &count);
        for (int i = 0 ; i < count; i++) {
            const char *properName = property_getName(properties[i]);
            NSString *key = [NSString stringWithCString:properName encoding:NSUTF8StringEncoding];
            NSObject *value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
    }
    return self;
}

@end
