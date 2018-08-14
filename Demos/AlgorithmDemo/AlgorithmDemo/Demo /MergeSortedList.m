//
//  MergeSortedList.m
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/15.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import "MergeSortedList.h"

@implementation MergeSortedList

void mergeList (int a[], int aLen, int b[], int bLen, int result[]) {
    
    int i = 0; // 记录数组a当前位置
    int j = 0; // 记录数组b当前位置
    int k = 0; // 记录数组result当前位置
    
    // 任意数组没有遍历完
    while (i < aLen && j < bLen) {
        if (a[i] <= b[j]) {
            result[k] = a[i];
            i++;
        } else {
            result[k] = b[j];
            j++;
        }
        
        k++;
    }
    
    // 数组a有剩余，则将数组a中剩余部分追加到result数组中
    while (i < aLen) {
        result[k] = a[i++];
        k++;
    }
    
    // 同理，数组b有剩余，则将数组b中剩余部分追加到result数组中
    while (j < bLen) {
        result[k] = b[j++];
        k++;
    }
    
}

@end
