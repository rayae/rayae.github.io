---
title: "《数据结构与算法》之计数排序"
categories: [ "数据结构" ]
tags: [ "C","排序","数据结构","算法" ]
draft: false
slug: "213"
date: "2020-03-20T10:35:00.000000"
---

# 算法描述
计数排序(Counting sort) 是一种稳定的排序算法。计数排序使用一个额外的数组C，其中第i个元素是待排序数组A中值等于i的元素的个数。然后根据数组C来将A中的元素排到正确的位置。它只能对整数进行排序。
时间复杂度：O(n+k)
空间复杂度：O(k)


# 排序过程
1. 找出待排序的数组中最大和最小的元素；
2. 统计数组中每个值为i的元素出现的次数，存入数组C的第i项；
3. 对所有的计数累加（从C中的第一个元素开始，每一项和前一项相加）；
4. 还原有序数组：将每个元素i放在新数组的第C(i)项，每放回一个元素就将C(i)减去1。

# C语言实现
```C
#include <stdio.h>
#include <stdlib.h>
#define ARRSIZE(arr) (sizeof(arr) / sizeof(arr[0]))

void CountingSort(int elements[], int len)
{
    int max, min, i, j;
    //寻找最大值和最小值
    max = elements[0];
    min = elements[0];
    for (i = 0; i < len; i++)
    {
        if (max < elements[i])
            max = elements[i];
        if (min > elements[i])
            min = elements[i];
    }
    //base的作用是节省内存,假设最小值min为1000，最大值为3000，所以我们最多只需要2001个大小的数组，而不用去用0-3000个空间浪费内存
    int base = 0 - min;
    int space = max - min + 1;
    int *bucket = (int *)malloc(sizeof(int) * space);
    //初始化容器中的数值
    for (i = 0; i < space; i++)
        bucket[i] = 0;
    //以elements[i]作为bucket的下标存放数据
    for (i = 0; i < len; i++)
        bucket[elements[i]]++;
    //将有序的数值还原
    j = 0, i = 0;
    while (j < len)
    {
        //当i大于0时，可能有多个数需要还原，所以只当他为0时++
        if (bucket[i] != 0)
        {
            elements[j++] = i - base;
            bucket[i]--;
        }
        else
            i++;
    }
	free(bucket);
}

int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    CountingSort(elems, len);
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

