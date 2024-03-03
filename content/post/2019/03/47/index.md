---
title: "Android手势识别API GestureDectector"
categories: [ "Android" ]
tags: [ None ]
draft: false
slug: "47"
date: "2019-03-21T11:09:00.000000"
---

需要实现图片双击放大，再次双击还原，放大后可拖动

主要就是实现**`GestureDetector.SimpleOnGestureListener`**接口里的方法

实现接口中的如下方法
- **`onDown(MotionEvent e)`**
手指按下事件，需要返回true，不返回true不会处理其他事件
- **`onDoubleTap(MotionEvent e)`**
手指双击事件(两次间隔大约在500ms)
- **`onSingleTapConfirmed(MotionEvent e)`**
单次点击事件，在没有双击事件等其他事件发生时回调
- **`onSingleTapUp(MotionEvent e)`**
单击事件，无论是否产生其他事件都回调
- **`onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY)`**
拖动事件，实现放大后拖动

代码如下：
```java
    private final static String TAG = "TAG";

    private boolean isZoomed = false;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final ImageView imageView = findViewById(R.id.imageView);
        GestureDetector.SimpleOnGestureListener simpleOnGestureListener = new GestureDetector.SimpleOnGestureListener() {

            @Override
            public boolean onDown(MotionEvent e) {
				//不返回true的话不会处理其他事件
                return true;
            }

            @Override
            public boolean onDoubleTap(MotionEvent e) {
				//没有放大，则放大图片
                if (!isZoomed) {
                    Log.d(TAG, "onDoubleTap: ");
                    //放大到原来的1.5倍
					imageView.getImageMatrix()
                            .postScale(5f, 5f, e.getX(), e.getY());
                    imageView.invalidate();
                    isZoomed = true;
                    return false;
                }
                return true;
            }

            @Override
            public boolean onSingleTapConfirmed(MotionEvent e) {
                Log.d(TAG, "onSingleTapConfirmed: ");
                if (isZoomed) {
					//进行过放大之后，单机还原图片
                    imageView.setImageMatrix(new Matrix());
                    imageView.invalidate();
                    isZoomed = false;
                }
                return true;            }

                //
            @Override
            public boolean onSingleTapUp(MotionEvent e) {
                Log.d(TAG, "onSingleTapUp: ");
                return true;
            }

            @Override
            public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
                Log.d(TAG, "onScroll: " + distanceX + " " + distanceY);
                if (isZoomed) {
					//根据滑动的距离给matrix设置矩阵平移变换
                    imageView.getImageMatrix()
                            .postTranslate(-distanceX, -distanceY);
                    imageView.invalidate();
                }
                return true;
            }
        };
		//设置手势监听器
        final GestureDetector gestureDetector = new GestureDetector(this, simpleOnGestureListener);
        imageView.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                return gestureDetector.onTouchEvent(event);
            }
        });

    }
```
