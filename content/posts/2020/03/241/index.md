---
title: "《数据结构与算法》之二叉搜索树(二叉查找树、二叉排序树)"
categories: [ "数据结构" ]
tags: [ "算法","C","查找","数据结构" ]
draft: false
slug: "241"
date: "2020-03-23T13:58:00.000000"
---

# 什么是二叉查找树：
二叉排序树（Binary Sort Tree），又称二叉查找树（Binary Search Tree），也称二叉搜索树。查找删除插入的时间复杂度都为O(n)。二叉排序树或者是一棵空树，或者是具有下列性质的二叉树：

1. 若左子树不空，则左子树上所有结点的值均小于它的根结点的值；
2. 若右子树不空，则右子树上所有结点的值均大于它的根结点的值；
3. 左、右子树也分别为二叉排序树；

# 构建二叉查找树
采用递归的形式，若节点为空，则在这个节点插入元素；若不为空且根节点的值大于待插入值，则递归右子树，否则递归左子树。
### 插入代码
```C
void InsertNode(BSNode **node, int value)
{
    if ((*node) == NULL)
    {
        (*node) = (BSNode *)malloc(sizeof(BSNode));
        (*node)->value = value;
        (*node)->lChild = NULL;
        (*node)->rChild = NULL;
    }
    else if ((*node)->value == value)
    {
        printf("树中已存在 : %d\n", value);
    }
    else if ((*node)->value > value)
    {
        //小于根结点，递归放入左子树
        InsertNode(&(*node)->lChild, value);
    }
    else
    {
        InsertNode(&(*node)->rChild, value);
    }
}
```

# 二叉搜索树的查找操作
查找与插入类似，根结点大于待查元素则递归左子树，反之递归右子树，若最后为空则无此元素在序列中。

### 查找代码
```C
BSNode *Search(BSNode *node, int key)
{
    //Search结束或者找到则退出
    if (node == NULL || node->value == key)
    {
        return node;
    }
    else if (node->value > key)
    {
        //根结点大于key，则递归查找左子树
        return Search(node->lChild, key);
    }
    else
    {
        return Search(node->rChild, key);
    }
}
```

# 二叉搜索树的删除操作
首先修改查找函数，让查找函数每次递归都保留当前节点为parent，因为我们后面删除需要用到parent重新指向其他节点，来完成节点的删除。

删除分三种情况：
1. 待删除节点为叶子节点，没有左右节点，直接将parent指向NULL。
2. 待删除节点有一个叶子结点，使用叶子结点替换待删除节点，使parent指向待删除节点的叶子节点。
3. 拥有左子树和右子树。使parent指向右子树(待删除节点的后驱)或者使其指向左子树的最大值(待删除节点的前驱)。推荐直接指向右子树。

### 删除代码
```C
//删除节点
void Delete(BSNode **node, int value)
{
    BSNode *delNode = Search(*node, value); //查找待删除节点
    if (delNode == NULL)
    {
        printf("没有找到待删除节点 : %d\n", value);
    }
    else if (delNode->lChild == NULL && delNode->rChild == NULL)
    {
        //若左右节点都为空，则直接删除
        parent->rChild = NULL;
        parent->lChild = NULL;
        free(delNode);
        printf("(1) : 已删除节点：%d\n", value);
    }
    else if (delNode->lChild == NULL || delNode->rChild == NULL)
    {
        //存在左节点或右节点，子承父业
        BSNode *newNode = delNode->lChild == NULL ? delNode->rChild : delNode->lChild;
        //若待删除节点是父节点的左子树
        if (parent->lChild == delNode)
        {
            parent->lChild = newNode;
        }
        else
        {
            parent->rChild = newNode;
        }
        free(delNode);
        printf("(2) : 已删除节点：%d\n", value);
    }
    else
    {
        //左右节点都不为空
        BSNode *newNode = delNode->rChild;
        if (parent->lChild == delNode)
        {
            parent->lChild = newNode;
        }
        else
        {
            parent->rChild = newNode;
        }
        free(delNode);
        printf("(3) : 已删除节点：%d\n", value);
    }
}
```

# 完整C语言实现
```C
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct BSNode
{
    int value;
    struct BSNode *lChild;
    struct BSNode *rChild;
} BSNode;

BSNode *parent; //记录搜索时的父节点

//插入节点
void InsertNode(BSNode **node, int value)
{
    if ((*node) == NULL)
    {
        (*node) = (BSNode *)malloc(sizeof(BSNode));
        (*node)->value = value;
        (*node)->lChild = NULL;
        (*node)->rChild = NULL;
    }
    else if ((*node)->value == value)
    {
        printf("树中已存在 : %d\n", value);
    }
    else if ((*node)->value > value)
    {
        //小于根结点，递归放入左子树
        InsertNode(&(*node)->lChild, value);
    }
    else
    {
        InsertNode(&(*node)->rChild, value);
    }
}
//在树中查找key
BSNode *Search(BSNode *node, int key)
{
    //Search结束或者找到则退出
    if (node == NULL || node->value == key)
    {
        return node;
    }
    else if (node->value > key)
    {
        parent = node;
        //根结点大于key，则递归查找左子树
        return Search(node->lChild, key);
    }
    else
    {
        parent = node;
        return Search(node->rChild, key);
    }
}
//删除节点
void Delete(BSNode **node, int value)
{
    BSNode *delNode = Search(*node, value); //查找待删除节点
    if (delNode == NULL)
    {
        printf("没有找到待删除节点 : %d\n", value);
    }
    else if (delNode->lChild == NULL && delNode->rChild == NULL)
    {
        //若左右节点都为空，则直接删除
        parent->rChild = NULL;
        parent->lChild = NULL;
        free(delNode);
        printf("(1) : 已删除节点：%d\n", value);
    }
    else if (delNode->lChild == NULL || delNode->rChild == NULL)
    {
        //存在左节点或右节点，子承父业
        BSNode *newNode = delNode->lChild == NULL ? delNode->rChild : delNode->lChild;
        //若待删除节点是父节点的左子树
        if (parent->lChild == delNode)
        {
            parent->lChild = newNode;
        }
        else
        {
            parent->rChild = newNode;
        }
        free(delNode);
        printf("(2) : 已删除节点：%d\n", value);
    }
    else
    {
        //左右节点都不为空
        BSNode *newNode = delNode->rChild;
        if (parent->lChild == delNode)
        {
            parent->lChild = newNode;
        }
        else
        {
            parent->rChild = newNode;
        }
        free(delNode);
        printf("(3) : 已删除节点：%d\n", value);
    }
}

//中序遍历打印
void middleOrderPrint(BSNode *node)
{
    if (node != NULL)
    {
        middleOrderPrint(node->lChild);
        printf("%d ", node->value);
        middleOrderPrint(node->rChild);
    }
}

void printTree(BSNode *node)
{
    printf("Tree : ");
    middleOrderPrint(node);
    printf("\n");
}

int main(int argc, char const *argv[])
{
    BSNode *node;
    srand(time(0));
    int len = 30;
    int randomIndex = rand() % (len - 1); //产生0-len中间的随机数
    int value = -1;
    int n;
    for (int i = 0; i < len; i++)
    {
        n = rand() % 1000 + 50;
        InsertNode(&node, n);
        if (randomIndex == i)
            value = n;
    }
    printTree(node);
    printf("查找%d : %s\n", value, Search(node, value) == NULL ? "false" : "true");
    Delete(&node, value);
    printf("重新查找%d : %s\n", value, Search(node, value) == NULL ? "false" : "true");
    printTree(node);
    return 0;
}

```

## 程序输出
```
 Tree : 192 225 231 277 292 322 391 416 462 512 523 532 545 561 576 586 623 627 658 714 722 770 813 839 862 869 893 899 998 1005 
查找292 : true
(2) : 已删除节点：292
重新查找292 : false
Tree : 192 225 231 277 322 391 416 462 512 523 532 545 561 576 586 623 627 658 714 722 770 813 839 862 869 893 899 998 1005
```

