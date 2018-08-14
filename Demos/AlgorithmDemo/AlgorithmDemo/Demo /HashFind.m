//
//  HashFind.m
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/15.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import "HashFind.h"

@implementation HashFind

char findFirstChar (char *aChar) {
    
    char result = '\0';
    
    int array[256];
    for (int index = 0; index < 256; index++) {
        array[index] = 0;
    }
    
    char *p = aChar;
    
    while (*p != '\0') {
        array[*(p++)]++;
    }
    
    p = aChar;
    
    while (*p != '\0') {
        if (array[*p] == 1) {
            result = *p;
            break;
        }
        
        p++;
    }
    
    return result;
}

@end
