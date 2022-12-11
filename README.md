# android_tv_test_app

A test app for android tv.

# To run project locally
- Run **flutter pub get**
- Run **flutter run**

# To change placeholder app icon
- Replace **asssets/images/app_icon.png** with new image (keep the name same)
- Run **flutter pub run flutter_launcher_icons** to generate new icons

# To rename app
- Update **title** passed to *MaterialApp* in **lib/app.dart**
- Update **android:label** value in **android/app/src/main/AndroidManifest.xml** inside <application> tag
