//
//  ViewController.m
//  KVOImplementation
//
//  Created by Li Ming  on 2018/10/28.
//  Copyright © 2018 Li Ming . All rights reserved.
//

#import "ViewController.h"
#import "LMCar.h"
#import "LMChild.h"

#import <objc/message.h>

@interface ViewController ()

@property (nonatomic, strong) LMPerson *p1;
@property (nonatomic, strong) LMPerson *p2;

@end

@implementation ViewController

- (void)dealloc {
    [self removeObserver];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.p1 = [[LMPerson alloc] init];
    //self.p1.age = 14;
    //self.p2 = [[LMPerson alloc] init];
    //self.p2.age = 16;
    
    //NSLog(@"self.p1添加KVO之前：%@---%@",object_getClass(self.p1),object_getClass(self.p2));
    //NSLog(@"self.p1添加KVO之前：%p---%p",object_getClass(self.p1),object_getClass(self.p2));
    //NSLog(@"self.p1添加KVO之前：%p---%p",[self.p1 methodForSelector:@selector(setAge:)],[self.p2 methodForSelector:@selector(setAge:)]);
    //NSLog(@"self.p1添加KVO之前：\n");
    //[self printMethodForClass:object_getClass(self.p1)];
    //[self printMethodForClass:object_getClass(self.p2)];
    [self addObserver];
    
    self.p1.age = 20;
    //self.p2.age = 22;
    
    //NSLog(@"self.p1添加KVO之后：%@---%@",object_getClass(self.p1),object_getClass(self.p2));
    //NSLog(@"self.p1添加KVO之后：%p---%p",object_getClass(self.p1),object_getClass(self.p2));
    //NSLog(@"self.p1添加KVO之后：%p---%p",[self.p1 methodForSelector:@selector(setAge:)],[self.p2 methodForSelector:@selector(setAge:)]);
    //NSLog(@"self.p1添加KVO之后：\n");
    //[self printMethodForClass:object_getClass(self.p1)];
    //[self printMethodForClass:object_getClass(self.p2)];
}


- (void)printMethodForClass:(Class)cls {
    
    unsigned int count;
    Method *methodList = class_copyMethodList(cls, &count);
    
    NSMutableString *methodNames = [NSMutableString new];
    [methodNames appendFormat:@"%@---",cls];
    
    for (int index = 0; index < count; index++) {
        Method method = methodList[index];
        
        NSString *tempMethodName = NSStringFromSelector(method_getName(method));
        [methodNames appendString:tempMethodName];
        [methodNames appendString:@"|"];
    }
    
    NSLog(@"%@",methodNames);
    
    free(methodList);
}

/*
 2018-10-29 21:22:11.030413+0800 KVOImplementation[1695:61261] self.p1添加KVO之前：0x10f6fa3b0---0x10f6fa3b0
 (lldb) p (IMP)0x10f6fa3b0
 (IMP) $0 = 0x000000010f6fa3b0 (KVOImplementation`-[LMPerson setAge:] at LMPerson.m:14)
 (lldb) p (IMP)0x10f6fa3b0
 (IMP) $1 = 0x000000010f6fa3b0 (KVOImplementation`-[LMPerson setAge:] at LMPerson.m:14)
 2018-10-29 21:22:56.268508+0800 KVOImplementation[1695:61261] self.p1添加KVO之后：0x10fa54552---0x10f6fa3b0
 (lldb) p (IMP)0x10fa54552
 (IMP) $2 = 0x000000010fa54552 (Foundation`_NSSetUnsignedLongLongValueAndNotify)
 (lldb) p (IMP)0x10f6fa3b0
 (IMP) $3 = 0x000000010f6fa3b0 (KVOImplementation`-[LMPerson setAge:] at LMPerson.m:14)
 (lldb)
 */

/*
 
 2018-10-29 21:41:52.607197+0800 KVOImplementation[1884:72703] self.p1添加KVO之前：
 
 2018-10-29 21:41:52.607453+0800 KVOImplementation[1884:72703] LMPerson---setAge:|age|
 2018-10-29 21:41:52.607600+0800 KVOImplementation[1884:72703] LMPerson---setAge:|age|
 2018-10-29 21:41:52.608275+0800 KVOImplementation[1884:72703] self.p1添加KVO之后：
 
 2018-10-29 21:41:52.608459+0800 KVOImplementation[1884:72703] NSKVONotifying_LMPerson---setAge:|class|dealloc|_isKVOA|
 2018-10-29 21:41:52.608598+0800 KVOImplementation[1884:72703] LMPerson---setAge:|age|
 */

#pragma mark - KVO

- (void)addObserver {
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.p1 addObserver:self forKeyPath:@"age" options:options context:NULL];
}

- (void)removeObserver {
    [self.p1 removeObserver:self forKeyPath:@"age"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (object == self.p1 && [keyPath isEqualToString:@"age"]) {
        NSLog(@"keyPath = %@,object = %@,change = %@,context = %@",keyPath,object,change,context);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}

@end
