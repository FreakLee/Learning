//
//  BinarySearch.m
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/14.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import "BinarySearch.h"

@implementation BinarySearch

+ (NSInteger)searchNumber:(NSNumber *)aNumber inArray:(NSArray <NSNumber *> *)numberArray {
    
    if (!aNumber || !numberArray) return -1;
    
    NSUInteger low = 0;
    NSUInteger high = numberArray.count - 1;
    
    while (low <= high) {
        
        NSUInteger mid = (low + high)/2;
        NSNumber *guess = nil;
        
        if (numberArray.count > mid + 1) {
            guess = numberArray[mid];
        }
        
        if (aNumber == guess) {
            NSLog(@"aNumber = %@,index of array = %zd\n",aNumber,mid);
            return mid;
        } else if (aNumber < guess) {
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }
  
    
    return -1;
}

@end
