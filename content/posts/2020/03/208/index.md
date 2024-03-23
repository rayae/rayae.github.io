---
title: "《数据结构与算法》之归并排序"
categories: [ "数据结构" ]
tags: [ "算法","C","排序","数据结构" ]
draft: false
slug: "208"
date: "2020-03-19T11:36:00.000000"
---

# 算法描述
归并排序 是建立在归并操作上的一种有效的排序算法。该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。归并排序是一种稳定的排序方法。将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。若将两个有序表合并成一个有序表，称为2-路归并。
时间复杂度：O(nlogn)
空间复杂度：O(n)


# 排序过程
假设有n个元素：`6、9、4、5、3、8`
归并排序过程：将集合中的n个元素一直递归对半分割，直到每个元素都单独成为一个序列(n个序列，每个序列一个元素)，此时我们认为这n个序列都是有序的。然后我们对每2个序列进行合并，使用两个指针分别指向两个序列，若左边序列第i(i<当前序列长度)个元素大(小)于右边序列第j(j同i但不同序列)，则将更小(大)的元素放入临时数组，并将更大(小)的序列的指针++指向下一个元素。比较方法就是将左右两边序列中更大(小)的元素存入临时数组，排序完成后还原。
排序过程：
1. 将n个元素分成n个序列：`6` `9` `4` `5` `3` `8`
2. 第一轮归并后结果：`6 9` `4 5` `3 8`
3. 第二轮归并后结果：`4 5 6 9` `3 8`
4. 第三轮归并后结果：`3 4 5 6 8 9`

# 伪代码实现
```
void Sort(elements, tmp, int leftStart, int rightStart, int rightEnd)
{
    leftEnd = rightStart - 1
    length = rightEnd - leftStart + 1 //元素长度
    i = leftStart
    //循环条件为左右部分的下标(leftStart rightStart)不越界
    while (leftStart <= leftEnd && rightStart <= rightEnd)
    {
        tmp[i++] = elements[leftStart] > elements[rightStart] ? elements[rightStart++] : elements[leftStart++]
    }
    //上面的while循环，左右两部分有一边下标越界了，那么剩下的另一部分可能还有元素
    //所以需要放进tmp中
    while (leftStart <= leftEnd)
    {
        tmp[i++] = elements[leftStart++]
    }
    while (rightStart <= rightEnd)
    {
        tmp[i++] = elements[rightStart++]
    }
    while (rightEnd >= 0)
    {
        //把tmp中的元素放入elements
        elements[rightEnd] = tmp[rightEnd]
        rightEnd--
    }
}
void Merge(elements, tmp, leftStart, rightEnd)
{
    //表示元素大于1
    if (leftStart < rightEnd)
    {
        int center = (rightEnd + leftStart) / 2    //切割成两份
        Merge(elements, tmp, leftStart, center)   //递归调用左边部分
        Merge(elements, tmp, center + 1, rightEnd) //递归调用右边部分
        Sort(elements, tmp, leftStart, center + 1, rightEnd)
    }
}
```

# C语言实现
```C
#include <stdio.h>
#include <stdlib.h>
#define ARRSIZE(arr) (sizeof(arr) / sizeof(arr[0]))

void Sort(int elements[], int tmp[], int leftStart, int rightStart, int rightEnd)
{
    int leftEnd = rightStart - 1;
    int length = rightEnd - leftStart + 1; //元素长度
    int i = leftStart;
    //循环条件为左右部分的下标(leftStart rightStart)不越界
    while (leftStart <= leftEnd && rightStart <= rightEnd)
    {
        tmp[i++] = elements[leftStart] > elements[rightStart] ? elements[rightStart++] : elements[leftStart++];
        //上面这行代码等效于下面的条件判断
        // if (elements[leftStart] > elements[rightStart])
        // {
        //     tmp[i++] = elements[rightStart++];
        // }
        // else
        // {
        //     tmp[i++] = elements[leftStart++];
        // }
    }
    //上面的while循环，左右两部分有一边下标越界了，那么剩下的另一部分可能还有元素
    //所以需要放进tmp中
    while (leftStart <= leftEnd)
    {
        tmp[i++] = elements[leftStart++];
    }
    while (rightStart <= rightEnd)
    {
        tmp[i++] = elements[rightStart++];
    }
    while (rightEnd >= 0)
    {
        //把tmp中的元素放入elements
        elements[rightEnd] = tmp[rightEnd];
        rightEnd--;
    }
}

void Merge(int elements[], int tmp[], int leftStart, int rightEnd)
{
    //表示元素大于1
    if (leftStart < rightEnd)
    {
        int center = (rightEnd + leftStart) / 2;    //切割成两份
        Merge(elements, tmp, leftStart, center);    //递归调用左边部分
        Merge(elements, tmp, center + 1, rightEnd); //递归调用右边部分
        Sort(elements, tmp, leftStart, center + 1, rightEnd);
    }
}
// 此方法用于统一函数接口
void MergeSort(int elements[], int length)
{
    int *tmp = (int *)malloc(sizeof(int) * length);
    Merge(elements, tmp, 0, length - 1);
    free(tmp);
}

int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    MergeSort(elems, len);
    for (int i = 0; i < len; i++)
        printf("%4d", elems[i]);
    printf("\n");
    return 0;
}


```

## 程序输出
```
  0   1   1   2   2   3   4   5   5   9  11  22  22  22  33  55  61  97 112
```

