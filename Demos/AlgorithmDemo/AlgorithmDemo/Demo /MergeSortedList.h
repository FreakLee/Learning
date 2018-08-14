//
//  MergeSortedList.h
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/15.
//  Copyright © 2018年 Lyman. All rights reserved.
//  合并有序数组

#import <Foundation/Foundation.h>

@interface MergeSortedList : NSObject

// 将有序数组a和b的值合并到一个数组result中，且任然保持有序
void mergeList (int a[], int aLen, int b[], int bLen, int result[]);

@end
