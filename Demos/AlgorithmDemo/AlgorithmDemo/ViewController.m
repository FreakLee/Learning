//
//  ViewController.m
//  AlgorithmDemo
//
//  Created by Li Ming  on 2018/7/12.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import "ViewController.h"

#import "CharReverse.h"
#import "ReverseList.h"
#import "MergeSortedList.h"
#import "HashFind.h"
#import "CommonSuperFind.h"
#import "MedianFind.h"

#import "BinarySearch.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *level1View;
@property (weak, nonatomic) IBOutlet UIView *level2View;
@property (weak, nonatomic) IBOutlet UIView *level3View;
@property (weak, nonatomic) IBOutlet UIView *level4View;
@property (weak, nonatomic) IBOutlet UIView *level6View1;
@property (weak, nonatomic) IBOutlet UIView *level6View2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self charReverse];
    
    //[self reverseList];
    
    //[self mergeSortedList];
    
    //[self hashFind];
    
    [self commonSuperFind];
    
    //[self findMedian];
    
    //[self binarySearch];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - Demos

- (void)charReverse {
    
    char ch[] = "Hello,World";
    
    charReverse(ch);
    
    printf("reversed result is %s \n",ch);
}

- (void)reverseList {
    
    struct Node *node = constructList(8);
    printList(node);
    
    struct Node *newHead = reverseList(node);
    
    printf("reverse----end\n");
    printList(newHead);
}

- (void)mergeSortedList {
    
    int a[] = {1,3,5,7,9};
    int b[] = {2,4,6,8,10,12,14};
    
    int result[12];
    mergeList(a, 5, b, 7, result);
    
    for (int index = 0; index < 12; index++) {
        NSLog(@"index = %d,obj = %d\n",index,result[index]);
    }
}

- (void)hashFind {
    
    char ch[] = "Hello,World";
    
    char aChar = findFirstChar(ch);
    
    printf("aChar = %c\n",aChar);
}

- (void)commonSuperFind {
    
    NSArray *array1 = [CommonSuperFind findCommonSuperForView:self.level1View withAntherView:self.view];
    NSLog(@"array1 = %@\n",array1);
    
    NSArray *array2 = [CommonSuperFind findCommonSuperForView:self.level1View withAntherView:self.level2View];
    NSLog(@"array2 = %@\n",array2);
    
    NSArray *array3 = [CommonSuperFind findCommonSuperForView:self.level1View withAntherView:self.level4View];
    NSLog(@"array3 = %@\n",array3);
    
    NSArray *array4 = [CommonSuperFind findCommonSuperForView:self.level6View1 withAntherView:self.level6View2];
    NSLog(@"array4 = %@\n",array4);
}

- (void)findMedian {
    int a[10] = {1,2,3,4,5,6,9,7,8,10};
    
    int median = findMedian(a, 10);
    
    printf("median = %d\n",median);
}

- (void)binarySearch {
    
    NSArray *numArray = @[@1,@3,@6,@8,@12,@19];
    
    NSInteger index = [BinarySearch searchNumber:@0 inArray:numArray];
    
    NSLog(@"index = %zd",index);
}

@end
