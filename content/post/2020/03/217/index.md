---
title: "《数据结构与算法》之静态查找(顺序查找、二分查找(折半查找)、分块查找(索引顺序查找))"
categories: [ "数据结构" ]
tags: [ "搜索","算法","C","查找","数据结构" ]
draft: false
slug: "217"
date: "2020-03-21T12:58:00.000000"
---

# 静态查找
静态查找算法的特点：数据集合稳定，不需要添加删除元素的查找操作。

有如下查找算法：
1. 顺序查找(Sequential Search)，时间复杂度为O(n)
2. 二分查找(Binary Search)又叫折半查找，时间复杂度为O(logn)
3. 分块查找(Index Search)又叫索引查找，时间复杂度为O(logn)

## 顺序查找
又叫线性查找，是最基本的查找技术，它的查找过程是：
从表中第一个（或最后一个）记录开始，逐个进行记录的关键字和给定值比较，若某个记录的关键字和给定值相等，则查找成功；如果直到最后一个（或第一个）记录，其关键字和给定值比较都不等时，则表中没有所查的记录，查找不成功。

## 折半查找
折半查找的思想：
将表中间位置记录的关键字与查找关键字比较，如果两者相等，则查找成功；否则利用中间位置记录将表分成前、后两个子表， 如果中间位置记录的关键字大于查找关键字，则进一步查找前一子表，否则进一步查找后一子表。重复以上过程，直到找到满足条件的记录，使查找成功，或直到子表不存在为止，此时查找不成功。
要求待查找的表必须是按关键字大小有序排列的顺序表。

## 分块查找
分块查找法是一种性能介于顺序查找和折半查找之间的查找方法。
索引顺序查找的思想：
将表 [1…n] 均分为 b 块，前 b - 1 块中记录个数为 s = n/b，最后一块即第 b 块的记录数小于等于 s。
表是“分块有序”的，即这些 b 块组成一个索引表，这个索引表是按照每一块的最大值对块进行递增排序，是一个递增有序表。

# C语言实现
```C
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define ARRSIZE(arr) (sizeof(arr) / sizeof(arr[0]))
#define SEGMENT_COUNT 5 //划分成多少段

typedef struct Segment
{
    int start; //当前段在序列中的起始位置
    int end;   //结束位置
    int max;   //当前段的最大值,这个也是排序关键字
} Segment;

//获取区间中的最大值
int getMaxInRange(int elements[], int start, int end)
{
    int max = elements[start];
    for (int i = start; i < end; i++)
    {
        if (max < elements[i])
            max = elements[i];
    }
    return max;
}
//顺序查找
int SequentialSearch(int elements[], int len, int key)
{
    for (int i = 0; i < len; i++)
        if (key == elements[i])
        {
            return i;
        }
    return -1;
}
//折半查找(二分查找)
int BinarySearch(int elements[], int len, int key)
{
    int mid = -1;       //中间值
    int low = 0;        //下界
    int high = len - 1; //上界

    while (low <= high)
    {
        mid = (high + low) / 2;
        if (elements[mid] == key)
        {
            return mid;
        }
        else if (elements[mid] < key)
            low = mid + 1;
        else
            high = mid - 1;
    }
    return -1;
}
//分块查找
int SegmentSearch(int elements[], int len, int key)
{
    int i, j, index = -1;
    //生成SEGMENT_COUNT个段
    Segment *segments = (Segment *)malloc(sizeof(Segment) * SEGMENT_COUNT);
    int num = len / SEGMENT_COUNT; //每段多少个元素
    for (i = 0; i < SEGMENT_COUNT; i++)
    {
        segments[i].start = i * num;
        segments[i].end = segments[i].start + num;
        segments[i].max = getMaxInRange(elements, segments[i].start, segments[i].end);
    }
    //插入排序，根据max对段进行排序
    for (i = 1; i < SEGMENT_COUNT; i++)
    {
        Segment tmp = segments[i];
        for (j = i; j > 0 && segments[j - 1].max > tmp.max; j--)
        {
            segments[j].max = segments[j - 1].max;
            segments[j].start = segments[j - 1].start;
            segments[j].end = segments[j - 1].end;
        }
        segments[j].max = tmp.max;
        segments[j].start = tmp.start;
        segments[j].end = tmp.end;
    }
    //查找key在哪个段中(查找max比key大的段)
    for (i = 0; segments[i].max < key && i < SEGMENT_COUNT; i++)
    {
    }
    //i不能越界，越界表示各个段中都不存在key
    if (i < SEGMENT_COUNT)
    {
        //对目标段中的元素进行顺序查找
        for (j = segments[i].start; j < segments[i].end; j++)
        {
            if (key == elements[j])
            {
                index = j;
                break;
            }
        }
    }
    return index;
}
int main(int argc, char const *argv[])
{
    int len = 100;
    int elems[len];
    int i, j;

    //产生len个有序的数
    for (i = 0; i < len; i++)
    {
        elems[i] = 10 + i * 3;
    }

    //随机选中一个数进行查找
    srand((unsigned)time(NULL));
    i = rand() % 100;
    int v = elems[i];
    printf("三种静态查找 : elements[%d]=%d 的元素\n", i, v);
    j = SequentialSearch(elems, len, v);
    printf("顺序查找 : elements[%d]=%d\n", j, elems[j]);
    j = BinarySearch(elems, len, v);
    printf("二分查找 : elements[%d]=%d\n", j, elems[j]);
    j = SegmentSearch(elems, len, v);
    printf("分块查找 : elements[%d]=%d\n", j, elems[j]);
    return 0;
}

```
## 程序输出
```
三种静态查找 : elements[8]=34 的元素
顺序查找 : elements[8]=34
二分查找 : elements[8]=34
分段查找 : elements[8]=34
```
