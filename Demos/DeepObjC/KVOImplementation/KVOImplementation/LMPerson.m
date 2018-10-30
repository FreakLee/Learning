//
//  LMPerson.m
//  KVOImplementation
//
//  Created by Li Ming  on 2018/10/28.
//  Copyright © 2018 Li Ming . All rights reserved.
//

#import "LMPerson.h"

@implementation LMPerson

- (void)setAge:(NSUInteger)age {
    NSLog(@"%s--%zd",__func__,age);
    _age = age;
}

- (void)willChangeValueForKey:(NSString *)key {
    NSLog(@"%s--%@开始了",__func__,key);
    [super willChangeValueForKey:key];
    NSLog(@"%s--%@结束了",__func__,key);
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"%s--%@开始了",__func__,key);
    [super didChangeValueForKey:key];
    NSLog(@"%s--%@结束了",__func__,key);
}

@end
