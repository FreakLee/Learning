//
//  CommonSuperFind.m
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/16.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import "CommonSuperFind.h"

@implementation CommonSuperFind

+ (NSArray <UIView *>*)findCommonSuperForView:(UIView *)aView withAntherView:(UIView *)antherView {
    NSMutableArray *result = [NSMutableArray new];
    
    NSArray *arrayOne = [self findSuperViews:aView];
    NSArray *arrayAnther = [self findSuperViews:antherView];
    
    NSUInteger index = 0;
    while (index < MIN(arrayOne.count, arrayAnther.count)) {
        UIView *superOne = [arrayOne objectAtIndex:arrayOne.count - index - 1];
        UIView *superOther = [arrayAnther objectAtIndex:arrayAnther.count - index - 1];
        
        if (superOne == superOther) {
            index++;
            [result addObject:superOne];
        } else {
            break;
        }
    }
    
    return result;
}

+ (NSArray <UIView *>*)findSuperViews:(UIView *)aView {
    NSMutableArray *mArray = [NSMutableArray new];
    
    UIView *tempView = [aView superview];
    while (tempView) {
        [mArray addObject:tempView];
        
        tempView = [tempView superview];
    }
    
    return mArray;
}

@end
