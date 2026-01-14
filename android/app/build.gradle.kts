plugins {
    id("com.android.application")
    id("kotlin-android")

    // 🔥 Firebase Google Services
    id("com.google.gms.google-services")

    // Flutter plugin HARUS PALING BAWAH
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.situmbuh_application"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.example.situmbuh_application"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Firebase BoM (VERSI AMAN)
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))

    // Firebase Core & Firestore
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-firestore")
}
