# Admapi for Flash

Proje Anasayfa: https://github.com/Admapi/SDK
İndirme Linki: 

Adobe Air uygulamaları için admapi reklam platformu.
* Portrait ve Landscape oryantasyonunu destekler.
* Android'i destekler.
* Air sdk 16yı destekler.
* Air sdk 16.0 veya üstü gereklidir.

Çok kolay kullanılabilir. Basit kullanım için sadece iki satır kod yazmak yeterlidir.

## Versiyon
1.0.0

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

### Detaylı anlatım

* com klasörünü .fla dosyanızın bulunduğu klasöre atınız.
* Config.as dosyasını açıp içindeki PUBLISHERID & GAMEID sabitlerini, Admapi kontrol panelinde size temin edilmiş özgün değerleri ile değiştiriniz.
* Reklam çağırmak için gerekli dosyamızı şu şekilde import ediyoruz: ```sh import com..admapi.api.Admapi; ```
* Reklamı istediğiniz yerde alttaki kod satırlarını ekleyiniz
```sh
var yeniReklam:Admapi = new Admapi(stage);
addChild(yeniReklam);
```
* Yukarıda belirtilen izinleri application-app.xml dosyasına ekleyiniz
