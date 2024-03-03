---
title: "《数据结构与算法》之冒泡排序"
categories: [ "数据结构" ]
tags: [ "算法","C","排序","数据结构" ]
draft: false
slug: "201"
date: "2020-03-18T10:53:00.000000"
---

# 算法描述
比较相邻的元素，如果前一个比后一个大，则进行交换。
时间复杂度：O(n²)
空间复杂度：O(1)


# 排序过程
假设有n个元素：`6、9、4、5、3、8`
排序的规则：依次比较两个数，如果前者大于后者，则交换。经过一趟排序，第一大的数会被置于底部。
第一趟结果：`6、9、4、5、3、8`
第一趟结果：`6、4、9、5、3、8`
第一趟结果：`6、4、5、9、3、8`
第一趟结果：`6、4、5、6、9、8`
第一趟结果：`6、4、5、6、8、9`
可以看到最大数经过一趟排序已被找到并在所有元素后面，第一趟我们需要比较n-1次才能找出第一大的数，i代表第几趟，所以下方嵌套循环中使用`length -i - 1`，所以经过n-1趟排序后。

# 伪代码实现
```
void BubbleSort(elements, length){
	for(i = 0; i < length; i++){
		for(j = 0; j < length -i - 1; j++){
			if(elements[j] > elements[j + 1])
				Swap(&elements[j], &elements[j + 1])
		}
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

void BubbleSort(int elements[], int length)
{
    int flag = 0; //记录排序是否完成
    for (int i = 0; i < length; i++)
    {
        flag = 0;
        for (int j = 0; j < length - i - 1; j++)
        {
            if (elements[j] > elements[j + 1])
            {
                flag = 1; //这趟循环进行了元素交换
                Swap(&elements[j], &elements[j + 1]);
            }
        }
        if (!flag)//如果没有进行元素交换则代表集合已经是有序的，退出循环
            break;
    }
}
int main(int argc, char const *argv[])
{
    int elems[] = {3, 4, 2, 1, 5, 9, 2, 1, 0, 22, 33, 5, 112, 11, 22, 55, 22, 61, 97};
    int len = ARRSIZE(elems);
    BubbleSort(elems, len);
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

