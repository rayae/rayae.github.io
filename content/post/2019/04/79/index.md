---
title: "zxing二维码中文乱码问题"
categories: [ "Android" ]
tags: [ None ]
draft: false
slug: "79"
date: "2019-04-10T18:52:52.000000"
---

使用**`zxing`**生成二维码后，如果文本里面有中文，再次解析二维码图片时会造成中文乱码，需要把生成二维码的方法换一下。
使用**`MultiFormatWriter`**替换**`QrCodeWriter`**并且指定**`CHARACTER_SET`**为**`UTF-8`**
```java
private Bitmap createQRCode(String text) {
        MultiFormatWriter writer = new MultiFormatWriter();
        ViewGroup.LayoutParams params = imageView.getLayoutParams();
        int width = params.width;
        int height = params.height;
        Log.d("TAG", "createQRCode: width=" + width + "  height=" + height);
        try {
            //使用hints解决中文乱码问题
            Hashtable<EncodeHintType, String> hints = new Hashtable<>();
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
            BitMatrix matrix = writer.encode(text, BarcodeFormat.QR_CODE, width, height, hints);
            int[] pixels = new int[width * height];
            for (int i = 0; i < height; i++) {
                for (int j = 0; j < width; j++) {
                    pixels[i * width + j] += matrix.get(i, j) ? 0x000000 : 0xffffff;
                }
            }
            return Bitmap.createBitmap(pixels, 0, width, width, height, Bitmap.Config.RGB_565);
        } catch (WriterException e) {
            e.printStackTrace();
        }

        return null;
    }
```

