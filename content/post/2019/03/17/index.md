---
title: "使用zxing进行二维码生成与解析"
categories: [ "Android" ]
tags: [ None ]
draft: false
slug: "17"
date: "2019-03-22T15:16:00.000000"
---

最近写Android程序需要用到 **zxing** 框架进行二维码生成和解析，记录一下使用过程。

首先，需要导包:
在 **`Project Structure`** 中点击加号, 然后在 **`Library Dependency`** 中搜索**`zxing-core`** 并安装并且重新**`sync`**


------------

将二维码图片解析为文本
```java
	//将二维码图片解析为文本
    private void parseQRCode(ImageView imageView) {
		//把ImageView中的图片转换成Bitmap
        Bitmap bitmap = ((BitmapDrawable) imageView.getDrawable()).getBitmap();
		//获取图片宽高
        int width = imageView.getWidth();
        int height = imageView.getHeight();
		//创建存放像素点的数组
        int pixels[] = new int[width * height];
		//从bitmap中获取像素点
        bitmap.getPixels(pixels, 0, width, 0, 0, width, height);
		//把bitmap转成BinaryBitmap
        BinaryBitmap bb = new BinaryBitmap(new HybridBinarizer(new RGBLuminanceSource(width, height, pixels)));
        QRCodeReader qrCodeReader = new QRCodeReader();
        try {
			//调用decode方法进行解码
            Result result = qrCodeReader.decode(bb);
            String text = result.getText();
            Toast.makeText(this, text, Toast.LENGTH_SHORT).show();
        } catch (NotFoundException e) {
            e.printStackTrace();
        } catch (ChecksumException e) {
            e.printStackTrace();
        } catch (FormatException e) {
            e.printStackTrace();
        }
    }
```

------------

将文本内容转换为Bitmap
```java
 //为指定文本生成为指定宽高的二维码Bitmap图片
    private Bitmap createQRCode(String content, int width, int height) {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        try {
            //将文本转换为二维矩阵,编码为QR_CODE
            BitMatrix matrix = qrCodeWriter.encode(content, BarcodeFormat.QR_CODE, width, height);
            //存放像素点数组
            int pixels[] = new int[width * height];
            //一列一列往数组里添加，也可以一行一行
            for (int i = 0; i < width; i++) {
                for (int j = 0; j < height; j++) {
                    //matrix.get(i, j)返回x,y位置是否是黑色
                    pixels[height * i + j] += matrix.get(j, i) ? 0x000000 : 0xffffff;
                }
            }
            //根据像素的创建Bitmap
            return Bitmap.createBitmap(pixels, width, height, Bitmap.Config.RGB_565);
        } catch (WriterException e) {
            e.printStackTrace();
        }
        return null;
    }
```
#2019-04-10更新
[中文乱码解决方法](/index.php/archives/79/ "中文乱码解决方法")


![QQ截图20190328222345.png](images/2520667132.png)

