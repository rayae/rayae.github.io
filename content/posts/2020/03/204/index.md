---
title: "《数据结构与算法》之插入排序"
categories: [ "数据结构" ]
tags: [ "算法","C","排序","数据结构" ]
draft: false
slug: "204"
date: "2020-03-18T13:25:00.000000"
---

# 算法描述
选择排序(Selection-sort) 是一种简单直观的排序算法。它的工作原理：首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。最好和最坏时间复杂度皆为O(n²)。
时间复杂度：O(n²)
空间复杂度：O(1)


# 排序过程
1. 从第一个元素开始，该元素可以认为已经被排序；
2. 取出下一个元素，在已经排序的元素序列中从后向前扫描；
3. 如果该元素（已排序）大于新元素，将该元素移到下一位置；
4. 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
5. 将新元素插入到该位置后；
6. 重复步骤2~5。


# 伪代码实现
```
void InsertionSort(elements, length){
	for(i = 1; i < length; i++){
		tmp = elements[i]
		for(j = i; j > 0; j--){
			if(elements[j - 1] > tmp)
				elements[j] = elements[j - 1]
			else
				break
		}
		elements[j] = tmp
	}
}
```

# C语言实现
```C
#include <stdio.h>
#define ARRSIZE(arr) (sizeof(arr) / sizeof(arr[0]))

void InsertionSort(int elements[], int length)
{
    //假设第0个元素已经是排好后的序列的元素
    for (int i = 1; i < length; i++)
    {
        //往回扫描，找到比elements[i]小的下标
        //并把比elements[i]大的元素后移一位
        int j;
        int tmp = elements[i];
        for (j = i; j > 0; j--)
        {
            //往回扫描，j代表从i递减到0的下标，就是已经排好的序列
            if (elements[j - 1] > tmp)
            {
                //如果比我大就把他往后挪，挪出一个空位
                //这里会占用掉elements[i]，所以前面要先给他存起来
                elements[j] = elements[j - 1];
            }
            else
                break;//找到的插入位置就跳出
        }
        elements[j] = tmp;//插入元素
    }

}

int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    InsertionSort(elems, len);
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

