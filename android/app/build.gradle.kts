plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.uts"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.3.13750724"; 
    

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8 // <-- DIUBAH dari VERSION_11
        targetCompatibility = JavaVersion.VERSION_1_8 // <-- DIUBAH dari VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_1_8.toString() // <-- DIUBAH dari VERSION_11
    }

    defaultConfig {
        // ... (bagian lain tetap)
        applicationId = "com.example.uts"
        // ...
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        // Tambahkan ini untuk kompatibilitas yang lebih baik jika ada banyak package
        multiDexEnabled = true 
    }

    buildTypes {
        release {
            // ...
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}