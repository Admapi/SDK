*********************** English **************************

This SDK is implementing the **V1 API** version of Admapi (Android Only)

Usage:

1- Open Config.as file in com/admapi folder and change the PUBLISHERID & GAMEID constants with the unique values provided in Admapi Control Panel for you.
2- import com.admapi.api.Admapi where you want the Ad's be published.
3- Create an instance of Admapi.
	e.g.

	var newAd:Admapi = new Admapi(stage);
	addChild(newAd);

4- Make sure you have given these permissions below in your XML file.

	<uses-permission android:name="android.permission.INTERNET"/>

	<uses-permission android:name="android.permission.READ_PHONE_STATE"/>

	<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>

	<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>


*********************** Türkçe **************************

Bu SDK Admapi'nin **V1 API** versiyonunu çalýþtýrmanýz içindir. (Sadece Android için)

Kullanýmý:

1- com/admapi klasörü içerisindeki Config.as dosyasýný açýp içindeki PUBLISHERID & GAMEID sabitlerini, Admapi kontrol panelinde size temin edilmiþ özgün deðerleri ile deðiþtiriniz.
2- Reklamý çaðýracaðýnýz yerde "import com.admapi.api.Admapi;" satýrýný kullanýnýz.
3- Yeni bir Admapi deðiþkeni tanýmlayýnýz.

	Örn:
	var yeniReklam:Admapi = new Admapi(stage);
	addChild(yeniReklam);

4- Oyununuzun XML dosyasýnda aþaðýdaki izinlerin verilmiþ olduðuna emin olunuz.

	<uses-permission android:name="android.permission.INTERNET"/>

	<uses-permission android:name="android.permission.READ_PHONE_STATE"/>

	<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>

	<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>