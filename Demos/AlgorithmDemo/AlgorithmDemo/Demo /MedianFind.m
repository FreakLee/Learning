//
//  MedianFind.m
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/17.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import "MedianFind.h"

@implementation MedianFind

int partSort (int a[], int start, int end);

int findMedian (int a[], int aLen) {
    
    int low = 0;
    int high = aLen - 1;
    
    int mid = (aLen - 1)/2;
    int div = partSort(a, low, high);
    
    while (div != mid) {
        
        if (mid < div) {
            // 左半区间找
            div = partSort(a, low, div - 1);
        } else {
            div = partSort(a, div + 1, high);
        }
    }
    
    return a[mid];
}

int partSort (int a[], int start, int end) {
    int low = start;
    int high = end;
    
    // 选取关键字
    int key = a[end];
    
    while (low < high) {
        // 左边找比key大的值
        while (low < high && a[low] <= key) {
            low++;
        }
        
        // 右边找比key小的值
        while (low < high && a[high] >= key) {
            high--;
        }
        
        if (low < high) {
            int temp = a[low];
            a[low] = a[high];
            a[high] = temp;
        }
    }
    
    int temp = a[high];
    a[high] = a[end];
    a[end] = temp;
    
    return low;
}

@end
