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


*********************** T�rk�e **************************

Bu SDK Admapi'nin **V1 API** versiyonunu �al��t�rman�z i�indir. (Sadece Android i�in)

Kullan�m�:

1- com/admapi klas�r� i�erisindeki Config.as dosyas�n� a��p i�indeki PUBLISHERID & GAMEID sabitlerini, Admapi kontrol panelinde size temin edilmi� �zg�n de�erleri ile de�i�tiriniz.
2- Reklam� �a��raca��n�z yerde "import com.admapi.api.Admapi;" sat�r�n� kullan�n�z.
3- Yeni bir Admapi de�i�keni tan�mlay�n�z.

	�rn:
	var yeniReklam:Admapi = new Admapi(stage);
	addChild(yeniReklam);

4- Oyununuzun XML dosyas�nda a�a��daki izinlerin verilmi� oldu�una emin olunuz.

	<uses-permission android:name="android.permission.INTERNET"/>

	<uses-permission android:name="android.permission.READ_PHONE_STATE"/>

	<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>

	<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>