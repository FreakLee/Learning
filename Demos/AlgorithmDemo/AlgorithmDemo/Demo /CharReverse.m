//
//  CharReverse.m
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/12.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import "CharReverse.h"

@implementation CharReverse

void charReverse (char *aChar) {
    // 第一个字符
    char *begin = aChar;
    
    // 最后一个字符
    char *end = aChar + strlen(aChar) - 1;
    
    while (begin < end) {
        char temp = *begin;
        *(begin++) = *end;
        *(end--) = temp;
    }
}

@end
