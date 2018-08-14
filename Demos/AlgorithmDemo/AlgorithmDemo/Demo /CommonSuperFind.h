//
//  CommonSuperFind.h
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/16.
//  Copyright © 2018年 Lyman. All rights reserved.
//  查找共同父视图

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonSuperFind : NSObject

+ (NSArray <UIView *>*)findCommonSuperForView:(UIView *)aView withAntherView:(UIView *)antherView;

@end
