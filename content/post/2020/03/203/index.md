---
title: "《数据结构与算法》之选择排序"
categories: [ "数据结构" ]
tags: [ "C","排序","数据结构","算法" ]
draft: false
slug: "203"
date: "2020-03-18T11:05:00.000000"
---

# 算法描述
插入排序（Insertion-Sort） 的算法描述是一种简单直观的排序算法。它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。插入排序在实现上，通常采用in-place排序（即只需用到O(1)的额外空间的排序），因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。
时间复杂度：O(n²)
空间复杂度：O(1)


# 排序过程
假设有n个元素：`6、9、4、5、3、8`
排序的规则：依次遍历i...n，找到其中最小(大)的元素，再把它与i下标进行交换。
第一趟结果：`6、9、4、5、3、8`
第一趟结果：`3、4、9、5、6、8`
第一趟结果：`3、4、5、9、6、8`
第一趟结果：`3、4、5、6、9、8`
第一趟结果：`3、4、5、6、8、9`
每一趟排序都在找第i个最小元素，找到好放到下标位置上。

# 伪代码实现
```
void SelectionSort(elements, length){
	for(i = 0; i < length; i++){
		min = i
		for(j = i; j < length -i - 1; j++){
			if(elements[min] > elements[j])
				min = j
		}
		Swap(&elements[i], &elements[min])
	}
}
```

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

void SelectionSort(int elements[], int length)
{
    for (int i = 0; i < length; i++)
    {
        int min = i; //默认最小的下标为i
        for (int j = i; j < length; j++)
        {
            if (elements[j] < elements[min])
                min = j;//找到更小的则更新min
        }
        //已找到第i个最小元素，进行交换
        Swap(&elements[min], &elements[i]);
    }
}

int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    SelectionSort(elems, len);
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

