---
title: "《数据结构与算法》之桶排序"
categories: [ "数据结构" ]
tags: [ "算法","C","排序","数据结构" ]
draft: false
slug: "215"
date: "2020-03-20T11:29:00.000000"
---

# 算法描述
桶排序 (Bucket sort)的工作的原理：
假设输入数据服从均匀分布，将数据分到有限数量的桶里，每个桶再分别排序（有可能再使用别的排序算法或是以递归方式继续使用桶排序进行排序）。
时间复杂度：O(n²)
空间复杂度：O(n+k)


# 排序过程
1. 人为设置一个BucketSize，作为每个桶所能放置多少个不同数值（例如当BucketSize==5时，该桶可以存放｛1,2,3,4,5｝这几种数字，但是容量不限，即可以存放100个3）；
2. 遍历输入数据，并且把数据一个一个放到对应的桶里去；
3. 对每个不是空的桶进行排序，可以使用其它排序方法，也可以递归使用桶排序；
4. 从不是空的桶里把排好序的数据拼接起来。 

注意，如果递归使用桶排序为各个桶排序，则当桶数量为1时要手动减小BucketSize增加下一循环桶的数量，否则会陷入死循环，导致内存溢出。

# C语言实现
```C
#include <stdio.h>
#include <stdlib.h>
#define ARRSIZE(arr) (sizeof(arr) / sizeof(arr[0]))
#define BUCKET_CAPACITY 10 //一个桶能装多少个元素

typedef struct Bucket
{
    int values[BUCKET_CAPACITY];
    int size; //数量
} Bucket, *PBucket;

void BSort(int elements[], int len, int bucketCapacity)
{
    //寻找最大值和最小值
    int max = elements[0];
    int min = elements[0];
    int i, j, k;
    for (i = 0; i < len; i++)
    {
        if (max < elements[i])
            max = elements[i];
        if (min > elements[i])
            min = elements[i];
    }
    int bucketCount = (max - min) / bucketCapacity + 1; //所需桶的数量
    //初始化这些桶
    PBucket buckets = (PBucket)malloc(sizeof(Bucket) * bucketCount);
    for (i = 0; i < bucketCount; i++)
    {
        buckets[i].size = 0;
    }
    for (i = 0; i < len; i++)
    {
        //入桶
        int mod = (elements[i] - min) / bucketCapacity;
        buckets[mod].values[buckets[mod].size++] = elements[i];
    }
    //对每个桶进行排序
    for (i = 0; i < bucketCount; i++)
    {
        //插入排序
        for (j = 1; j < buckets[i].size; j++)
        {
            int tmp = buckets[i].values[j];
            for (k = j; k > 0; k--)
            {
                if (buckets[i].values[k - 1] > tmp)
                {
                    buckets[i].values[k] = buckets[i].values[k - 1];
                }
                else
                    break;
            }
            buckets[i].values[k] = tmp;
        }
    }
    //桶中的数据放回序列
    i = 0, j = 0, k = 0;
    for (i = 0; i < bucketCount; i++)
    {
        for (j = 0; j < buckets[i].size; j++)
        {
            elements[k++] = buckets[i].values[j];
        }
    }
    free(buckets);
}
void BucketSort(int elements[], int len)
{
    BSort(elements, len, BUCKET_CAPACITY);
}

int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    BucketSort(elems, len);
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

