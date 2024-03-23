---
title: "《数据结构与算法》之基数排序"
categories: [ "数据结构" ]
tags: [ "C","排序","数据结构","算法" ]
draft: false
slug: "216"
date: "2020-03-20T16:33:00.000000"
---

# 算法描述
基数排序是按照低位先排序，然后收集；再按照高位排序，然后再收集；依次类推，直到最高位。有时候有些属性是有优先级顺序的，先按低优先级排序，再按高优先级排序。最后的次序就是高优先级高的在前，高优先级相同的低优先级高的在前。基数排序基于分别排序，分别收集，所以是稳定的。
时间复杂度：O(kn)
空间复杂度：O(n+k)


# 排序过程
1. 算出序列中的最大数，并取得位数
2. 从最低位(LDS)开始，计算出每个数的基数(比如个位数时计算每个数的个位数，百位数时计算百位数的值)
3. 根据基数将数值放入对应的桶，然后在放回原序列
4. 当最高位数运行完成，则序列为有序

## 基数排序有两种方法：
- MSD 从高位开始进行排序
- LSD 从低位开始进行排序

## 基数排序 vs 计数排序 vs 桶排序

这三种排序算法都利用了桶的概念，但对桶的使用方法上有明显差异：

基数排序： 根据键值的每位数字来分配桶
计数排序： 每个桶只存储单一键值
桶排序： 每个桶存储一定范围的数值


# C语言实现
```C
#include <stdio.h>
#include <stdlib.h>
#define ARRSIZE(arr) (sizeof(arr) / sizeof(arr[0]))
#define BUCKET_CAPACITY 30 //单个桶的容量,根据情况进行修改
#define BUCKET_COUNT 10    //桶的数量(0-9)我们只需要10个桶
typedef struct Bucket
{
    int values[BUCKET_CAPACITY];
    int size;
} Bucket, *PBucket;

void RadixSort(int elements[], int len)
{
    int max = elements[0];
    int i, j, k;
    //寻找序列中的最大值
    for (i = 0; i < len; i++)
    {
        if (max < elements[i])
            max = elements[i];
    }
    //计算位数
    int maxDigits = 0;
    while (max != 0)
    {
        max /= 10;
        maxDigits++;
    }
    //生成桶
    PBucket buckets = (PBucket)malloc(sizeof(Bucket) * BUCKET_COUNT);

    int radix = 10; //每次模的基数
    for (i = 0; i < maxDigits; i++, radix *= 10)
    {
        //先清空桶
        for (j = 0; j < BUCKET_COUNT; j++)
            buckets[j].size = 0;
        //进桶
        for (j = 0; j < len; j++)
        {
            //以位数为基数，放入相应的桶
            int n = (elements[j] % radix) / (radix / 10);
            buckets[n].values[buckets[n].size++] = elements[j];
        }

        //从桶里放回排序过的数
        int index = 0;
        for (j = 0; j < BUCKET_COUNT; j++)
        {
            if (buckets[j].size < 1)
                continue;
            for (k = 0; k < buckets[j].size; k++)
            {
                elements[index++] = buckets[j].values[k];
            }
        }
    }
    free(buckets);
}

int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    RadixSort(elems, len);
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

