---
title: "Android sqlite数据库限定最大记录数"
categories: [ "Android" ]
tags: [ None ]
draft: false
slug: "46"
date: "2019-03-20T11:03:00.000000"
---

网上没有找到合适的案例，最后自己实现
实现原理：在每次往数据库里写入记录时，判断里面的记录数为多少，倘若大于或等于最大记录数，则删除首行记录数

```java
    //计算数据库的记录数量
    private int getCount() {
        Cursor cursor = getCursor();
        if (cursor != null) {
            int count = cursor.getCount();
            cursor.close();
            return count;
        }
        return 0;
    }

    //根据读取到的第一个主键来删除第一条记录
    private void deleteFirst() {
        Cursor cursor = getCursor();
        if (cursor != null) {
            //把cursor移动到第一条记录
            if (cursor.moveToFirst()) {
                //读出id
                int id = cursor.getInt(cursor.getColumnIndex("id"));
                myDB.getWritableDatabase().execSQL("DELETE FROM " + TABLE_NAME + " WHERE id=" + id);
            }
            cursor.close();
        }
    }

    //获取Cursor
    private Cursor getCursor() {
        return myDB.getReadableDatabase().query(TABLE_NAME, null, null, null, null, null, null, null);
    }
	 //保存bean到数据库
    public void save(EnvironmentBean bean) {
        //记录超过20条，先删除第一行
        if (getCount() >= 20)
            deleteFirst();
        ContentValues cv = new ContentValues();
		myDB.getWritableDatabase().insert(TABLE_NAME, null, cv);
    }
```
