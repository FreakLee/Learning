//
//  ReverseList.m
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/12.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import "ReverseList.h"

@implementation ReverseList

struct Node *reverseList(struct Node *head) {
    
    // 定义遍历指针，初始化为头结点
    struct Node *p = head;
    // 反转后的链表头部
    struct Node *newHead = NULL;
    
    // 遍历链表
    while (p != NULL) {
        
        // 记录下一个结点
        struct Node *temp = p->next;
        // 当前结点的next指向新链表的头部
        p->next = newHead;
        // 更改新链表头部为当前结点
        newHead = p;
        // 移动p指针
        p = temp;
    }
    
    return newHead;
}

struct Node *constructList(int listLen) {
    // 定义头结点
    struct Node *head = NULL;
    // 记录当前尾结点
    struct Node *current = NULL;
    
    for (int i = 0; i < listLen; i++) {
        struct Node *node = malloc(sizeof(struct Node));
        
        node->data = i;
        
        // 头结点为空，新结点即为头结点
        if (head == NULL) {
            head = node;
        } else {
            current->next = node; // 当前结点的next为新结点
        }
        
        // 设置当前结点为新结点
        current = node;
    }
    
    return head;
}

void printList (struct Node* head) {
    struct Node *temp = head;
    while (temp != NULL) {
        printf("currrent node is %d\n",temp->data);
        temp = temp->next;
    }
}

@end
