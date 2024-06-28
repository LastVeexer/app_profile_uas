# app_profile_uas
**I. Judul dan Deksripsi Singkat** 
   Judul : Aplikasi Mobile Profile Management V1
   Deskripsi Singkat :
   Aplikasi Mobile Profile Management V1 adalah sebuah aplikasi yang dirancang untuk mengelola profil pengguna, mengakses kamera, dan menampilkan lokasi pengguna menggunakan Google Maps. Aplikasi ini juga menggunakan Firebase sebagai backend untuk menyimpan dan mengambil data profil pengguna. Laporan ini menjelaskan implementasi aplikasi, fitur-fitur yang tersedia, dan teknologi yang digunakan. Untuk Versi 1 masih banyak kekurangan yang harus ditambahkan untuk menyempurnakan aplikasi ini.

**II. Design**

![image](https://github.com/LastVeexer/app_profile_uas/assets/109842364/04c226c6-ed4f-43a3-a939-df04f2c0aa79)

**III. Pembahasan**

**a. Teknologi yang Digunakan**
Flutter: Framework open-source untuk pengembangan aplikasi mobile.
Firebase: Backend-as-a-Service yang menyediakan berbagai layanan seperti Firestore dan Firebase Authentication.
Google Maps: API untuk menampilkan peta dan lokasi.
HTTP: Untuk melakukan permintaan HTTP.
Camera: Untuk mengakses kamera perangkat.
Permission Handler: Untuk mengelola izin aplikasi.

**b. Fitur Utama**
    1. Pengelolaan Profil:
      Pengguna dapat melihat daftar profil.
      Pengguna dapat menambah, mengedit, dan menghapus profil.
    
    2. Integrasi Kamera:
      Aplikasi dapat mengakses kamera perangkat untuk mengambil gambar.
    
    3. Google Maps:
      Aplikasi menampilkan lokasi pengguna di Google Maps.
      Menggunakan izin lokasi untuk mengakses lokasi perangkat.

    4. Backend dengan Firebase:
      Menyimpan data profil di Firestore.
      Mengambil data profil dari Firestore.
      
**c. Struktur**
      Struktur Proyek
        lib/main.dart: File utama yang menginisialisasi aplikasi dan Firebase, serta mendefinisikan navigasi.
        lib/profile_list.dart: Menampilkan daftar profil yang diambil dari Firestore.
        lib/profile_card.dart: Widget untuk menampilkan kartu profil.
        lib/camera_screen.dart: Mengelola akses kamera.
        lib/map_screen.dart: Menampilkan lokasi pengguna menggunakan Google Maps.
        lib/firestore_service.dart: Mengelola operasi CRUD di Firestore.
        lib/api_service.dart: Mengelola permintaan HTTP.

**d. Implementasi Komponen**
1. Firebase Firestore
   Firebase Firestore digunakan sebagai backend untuk menyimpan dan mengambil data profil pengguna.
   Konfigurasi Firebase
   apply plugin: 'com.google.gms.google-services'

   dependencies {
        implementation platform('com.google.firebase:firebase-bom:26.3.0')
        implementation 'com.google.firebase:firebase-firestore'
    }
   - Inisialisasi Firebase: WidgetsFlutterBinding.ensureInitialized(); digunakan untuk memastikan bahwa semua binding telah diinisialisasi sebelum         menjalankan Firebase.initializeApp.
   - Firebase.initializeApp: Menginisialisasi Firebase dengan menggunakan opsi yang disediakan di firebase_options.dart.
   - runApp(MyApp()): Menjalankan aplikasi dengan MyApp sebagai widget utama.
     
   Konfigurasi Firebase di android/app/build.gradle:
   ![build gradle android app](https://github.com/LastVeexer/app_profile_uas/assets/109842364/fd886b9e-c816-487a-9004-c054b88fd256)
   Inisialisasi Firebase di main.dart:
   ![main dart](https://github.com/LastVeexer/app_profile_uas/assets/109842364/a23c0cd6-49c2-424c-bfed-8bb790a93d4b)

   Operasi CRUD di Firestore
   - FirebaseFirestore.instance: Menginisialisasi instance Firestore.
   - createPost: Menambahkan dokumen baru ke koleksi 'posts' dengan data yang diberikan.
   - getPost: Mengambil dokumen dari koleksi 'posts' berdasarkan ID yang diberikan.
   - getAllPosts: Mengambil semua dokumen dari koleksi 'posts'.
     
   Mengelola operasi CRUD dengan firestore_service.dart
   ![firestore service](https://github.com/LastVeexer/app_profile_uas/assets/109842364/09961718-dc02-4e20-9edb-996693cb1b9c)

    Firebase Option
   Firebase options diperlukan untuk menginisialisasi aplikasi Firebase dengan konfigurasi yang benar. Konfigurasi ini biasanya disediakan oleh Firebase ketik menambahkan aplikasi ke proyek Firebase. Berikut adalah penjelasan dan contoh bagaimana mengimplementasikan Firebase options dalam aplikasi Flutter.
   ![firebase options](https://github.com/LastVeexer/app_profile_uas/assets/109842364/83d52e4f-14ca-4d79-9687-d61672c3cc30)
 selain firebase option diperlukan juga untuk menlakukan konfigurasi berikut :
    1. Mengonfigurasi file build.gradle di root proyek dan modul aplikasi untuk menggunakan plugin Google services.
    2. Menambahkan dependensi Firebase yang diperlukan.
    3. Menambahkan file konfigurasi google-services.json ke dalam proyek Android
![build gradle android app](https://github.com/LastVeexer/app_profile_uas/assets/109842364/c43521ea-8b9b-443c-9ff8-b3bb0187e892)
![build gradle android](https://github.com/LastVeexer/app_profile_uas/assets/109842364/633480e3-d9da-4f68-916e-58765edba5ba)
![image](https://github.com/LastVeexer/app_profile_uas/assets/109842364/6a00cc03-e145-4530-8cad-3f046e941405)

       
3. Google Maps
   ![map screen](https://github.com/LastVeexer/app_profile_uas/assets/109842364/35822612-f166-4de9-a9db-e2d867c955eb)

   - GoogleMapController: Mengontrol peta Google Maps.
   - _currentPosition: Menyimpan posisi awal peta.
   - requestLocationPermission: Meminta izin lokasi dari pengguna.
   - _onMapCreated: Callback yang dipanggil ketika peta telah dibuat.
   - GoogleMap: Widget yang menampilkan peta Google Maps dengan posisi awal yang diberikan.
5. Kamera
   ![camera screen](https://github.com/LastVeexer/app_profile_uas/assets/109842364/f7bc9be6-cfab-4ad0-baf2-304b3e4ceb4e)
    - availableCameras: Mengambil daftar kamera yang tersedia pada perangkat.
    - CameraController: Mengontrol kamera.
    - initializeCamera: Menginisialisasi kamera dengan kamera pertama dalam daftar dan resolusi tinggi.
    - CameraPreview: Menampilkan preview kamera pada layar.
7. Akses Permission
   pada bagian google map dan kamera terdapat permission handler
   requestPermissions: Fungsi untuk meminta izin kamera dan lokasi dari pengguna.
9. Permintaan HTTP
    ![api _service](https://github.com/LastVeexer/app_profile_uas/assets/109842364/50c591da-145f-4447-bd1e-a17b6c2f2389)

    - createPost: Mengirim permintaan POST ke endpoint API untuk membuat data baru.
    - getPost: Mengirim permintaan GET ke endpoint API untuk mengambil data berdasarkan ID.
    - getAllPosts: Mengirim permintaan GET ke endpoint API untuk mengambil semua data.
11. pubspec.yml
    ![pubspec yaml](https://github.com/LastVeexer/app_profile_uas/assets/109842364/2e1eb542-8f9f-46f0-9493-78a984df9501)

    - flutter: Dependensi inti Flutter.
    - firebase_core: Untuk menginisialisasi Firebase dalam aplikasi Flutter.
    - cloud_firestore: Untuk menggunakan Firestore sebagai database.
    - firebase_analytics: Untuk menggunakan Firebase Analytics.
    - firebase_auth: Untuk menggunakan Firebase Authentication.
    - firebase_storage: Untuk menggunakan Firebase Storage.
    - camera: Untuk mengakses kamera perangkat.
    - permission_handler: Untuk mengelola izin aplikasi.
    - google_maps_flutter: Untuk menampilkan Google Maps dalam aplikasi.
    - http: Untuk melakukan permintaan HTTP.
12. Android Manifest
   ![android manifest](https://github.com/LastVeexer/app_profile_uas/assets/109842364/991580f4-c209-407a-859a-31872df71740)

   - API Key untuk Google Maps: meta-data dengan android:name="com.google.android.geo.API_KEY" dan android:value="YOUR_API_KEY" digunakan untuk menyimpan kunci API Google Maps.
   - Firebase Configuration: meta-data dengan android:name="com.google.firebase.analytics.APPLICATION_ID" dan android:value="${applicationId}" digunakan untuk konfigurasi Firebase Analytics.
   - Izin Kamera: uses-permission dengan android:name="android.permission.CAMERA" untuk meminta izin menggunakan kamera.
   - Izin Lokasi: uses-permission dengan android:name="android.permission.ACCESS_FINE_LOCATION" dan android:name="android.permission.ACCESS_COARSE_LOCATION" untuk meminta izin menggunakan lokasi.
   - Firebase Initialization: meta-data untuk Crashlytics dan Analytics, disetel ke false untuk menonaktifkan pengumpulan data otomatis.
   - Activity Utama: MainActivity dengan konfigurasi intent-filter untuk menentukan aktivitas utama aplikasi.
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
