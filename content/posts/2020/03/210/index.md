---
title: "《数据结构与算法》之快速排序"
categories: [ "数据结构" ]
tags: [ "C","排序","数据结构","算法" ]
draft: false
slug: "210"
date: "2020-03-19T20:12:00.000000"
---

# 算法描述
快速排序 通过一趟排序将待排记录分隔成独立的两部分，其中一部分记录的关键字均比另一部分的关键字小，则可分别对这两部分记录继续进行排序，以达到整个序列有序。
时间复杂度：O(logn)
空间复杂度：O(logn)


# 排序过程
快速排序使用分治法来把一个串（list）分为两个子串（sub-lists）。具体算法描述如下：
步骤1：从数列中挑出一个元素，称为 “基准”（pivot ）；
步骤2：重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作；
步骤3：递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。

# 伪代码实现
```
int Partition(elements, low, high)
{
    pivot = elements[low] //取基准数
    //当上界下界不重合
    while (low < high)
    {
        //往回寻找小于基准数的值
        while (low < high && elements[high] >= pivot)
            high--
        Swap(low, high)
        //向后寻找大于基准数的值
        while (low < high && elements[low] <= pivot)
            low++
        Swap(low, high)
    }
    //将基准数放回中间
    elements[low] = pivot
    return low
}

void Sort(elements, low, high)
{
    if (low < high)
    {
        int base = Partition(elements, low, high)
        Sort(elements, low, base - 1)
        Sort(elements, base + 1, high)
    }
}
```

# C语言实现
```C
#include <stdio.h>
#include <stdlib.h>

#define ARRSIZE(arr) (sizeof(arr) / sizeof(arr[0]))

void Swap(int *a, int *b)
{
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

//分而治之
int Partition(int elements[], int low, int high)
{
    int pivot = elements[low]; //取基准数
    //当上界下界不重合
    while (low < high)
    {
        //往回寻找小于基准数的值
        while (low < high && elements[high] >= pivot)
            high--;
        Swap(&elements[low], &elements[high]);
        //向后寻找大于基准数的值
        while (low < high && elements[low] <= pivot)
            low++;
        Swap(&elements[low], &elements[high]);
    }
    //将基准数放回中间
    elements[low] = pivot;
    return low;
}

void Sort(int elements[], int low, int high)
{
    if (low < high)
    {
        int base = Partition(elements, low, high);
        Sort(elements, low, base - 1);
        Sort(elements, base + 1, high);
    }
}
//统一函数接口
void QuickSort(int elements[], int length)
{
    Sort(elements, 0, length - 1);
}

int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    QuickSort(elems, len);
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

