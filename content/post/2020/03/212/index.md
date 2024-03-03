---
title: "《数据结构与算法》之堆排序"
categories: [ "数据结构" ]
tags: [ "算法","C","排序","数据结构" ]
draft: false
slug: "212"
date: "2020-03-20T10:03:00.000000"
---

# 算法描述
堆排序（Heapsort） 是指利用堆这种数据结构所设计的一种排序算法。堆积是一个近似完全二叉树的结构，并同时满足堆积的性质：即子结点的键值或索引总是小于（或者大于）它的父节点。
时间复杂度：O(nlogn)
空间复杂度：O(1)


# 排序过程
1. 将初始待排序关键字序列(R1,R2….Rn)构建成大顶堆(最大堆)，此堆为初始的无序区；
2. 将堆顶元素R[1]与最后一个元素R[n]交换，此时得到新的无序区(R1,R2,……Rn-1)和新的有序区(Rn),且满足R[1,2…n-1]<=R[n]；
3. 由于交换后新的堆顶R[1]可能违反堆的性质，因此需要对当前无序区(R1,R2,……Rn-1)调整为新堆，然后再次将R[1]与无序区最后一个元素交换，得到新的无序区(R1,R2….Rn-2)和新的有序区(Rn-1,Rn)。不断重复此过程直到有序区的元素个数为n-1，则整个排序过程完成。
4. 排序规则为：每次将一个最大值堆顶与堆低(节点数减1)交换，节点数减1，直到只剩下堆顶则是序列是有序的。

# C语言实现
```C
#include <stdio.h>
#define ARRSIZE(arr) (sizeof(arr) / sizeof(arr[0]))

void Swap(int *a, int *b)
{
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

//将第i个节点的左子树(i*2)右子树(i*2+1)调整为最大堆
void AdjustHeap(int elements[], int i, int len)
{
    //默认根结点为最大值
    int max = i;
    //若存在左节点且右节点的值大于根结点
    if (i * 2 < len && elements[i] < elements[i * 2])
        max = i * 2;
    //若存在右节点且右节点的值大于根结点
    if (i * 2 + 1 < len && elements[max] < elements[i * 2 + 1])
        max = i * 2 + 1;
    //将更大的值作为根结点
    if (elements[i] < elements[max])
    {
        Swap(&elements[i], &elements[max]);
        AdjustHeap(elements, max, len);
    }
}

void HeapSort(int elements[], int len)
{
    //构建最大堆
    for (int i = len / 2; i >= 0; i--)
        AdjustHeap(elements, i, len);
    //每次将一个最大值堆顶与堆低(节点数减1)交换，节点数减1，直到只剩下堆顶则是序列是有序的。
    for (int i = len - 1; i > 0; i--)
    {
        Swap(&elements[0], &elements[i]);
        AdjustHeap(elements, 0, i);
    }
}
int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    HeapSort(elems, len);
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

