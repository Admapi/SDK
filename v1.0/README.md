## Admapi for Flash

Proje Anasayfa: https://github.com/Admapi/SDK
İndirme Linki: 

Adobe Air uygulamaları için admapi reklam platformu.
* Portrait ve Landscape oryantasyonunu destekler.
* Android'i destekler.
* Air sdk 16yı destekler.
* Air sdk 16.0 veya üstü gereklidir.

Çok kolay kullanılabilir. Basit kullanım için sadece iki satır kod yazmak yeterlidir.

#### Interstitial (Tam sayfa) Reklam Gösterme
```sh
var yeniReklam:Admapi = new Admapi(stage);
addChild(yeniReklam);
```

#### Android için application-app.xml dosyasında eklemeniz gereken izinler şunlardır.
```sh
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
```
