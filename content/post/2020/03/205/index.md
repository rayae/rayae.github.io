---
title: "《数据结构与算法》之希尔排序"
categories: [ "数据结构" ]
tags: [ "C","排序","数据结构","算法" ]
draft: false
slug: "205"
date: "2020-03-18T17:14:00.000000"
---

# 算法描述
希尔排序是希尔（Donald Shell） 于1959年提出的一种排序算法。希尔排序也是一种插入排序，它是简单插入排序经过改进之后的一个更高效的版本，希尔排序是把记录按下表的一定增量分组，对每组使用直接插入排序算法排序；随着增量逐渐减少，每组包含的关键词越来越多，当增量减至1时，整个文件恰被分成一组，算法便终止。
时间复杂度：O(nlog²n)
空间复杂度：O(1)


# 排序过程
在此我们选择增量gap=length/2，缩小增量继续以gap = gap/2的方式，这种增量选择我们可以用一个序列来表示，{n/2,(n/2)/2…1}，称为增量序列。希尔排序的增量序列的选择与证明是个数学难题，我们选择的这个增量序列是比较常用的，也是希尔建议的增量，称为希尔增量，但其实这个增量序列不是最优的。此处我们做示例使用希尔增量。先将整个待排序的记录序列分割成为若干子序列分别进行直接插入排序，具体算法描述：
1. 选择一个增量序列t1，t2，…，tk，其中ti>tj，tk=1；
2. 按增量序列个数k，对序列进行k 趟排序；
3. 每趟排序，根据对应的增量ti，将待排序列分割成若干长度为m 的子序列，分别对各子表进行直接插入排序。仅增量因子为1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。

# 伪代码实现
```
void ShellSort(elements, length){
	for(gap = length / 2; gap > 0; gap /= 2){
		for(i = gap; i < length; i++){
		tmp = elements[i]
			for(j = i; j > 0; j -= gap){
				if(elements[j - gap] > tmp)
					elements[j] = elements[j - gap]
				else
					break
			}
			elements[j] = tmp
		}
	}
}
```

# C语言实现
```C
#include <stdio.h>
#define ARRSIZE(arr) (sizeof(arr) / sizeof(arr[0]))

void ShellSort(int elements[], int length)
{
    int gap; //增量
    for (gap = length / 2; gap > 0; gap /= 2)
    {
        for (int i = gap; i < length; i++)
        {
            int tmp = elements[i];
            int j;
            //这里类似于插入排序，只是把增量1变成了gap
            for (j = i; j > 0; j -= gap)
            {
                if (elements[j - gap] > tmp)
                {
                    elements[j] = elements[j - gap];
                }
                else
                    break;
            }
            elements[j] = tmp;
        }
    }
}

int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    ShellSort(elems, len);
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

