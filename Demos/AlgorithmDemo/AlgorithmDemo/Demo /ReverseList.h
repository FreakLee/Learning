//
//  ReverseList.h
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/12.
//  Copyright © 2018年 Lyman. All rights reserved.
//  反转链表

#import <Foundation/Foundation.h>

// 定义一个链表
struct Node {
    int data;
    struct Node *next;
};

@interface ReverseList : NSObject

// 反转链表
struct Node *reverseList(struct Node *head);

// 构造链表
struct Node *constructList(int listLen);

// 打印链表数据
void printList(struct Node *head);

@end
