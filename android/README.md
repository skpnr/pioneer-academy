# e-PDS Management Mobile Android Application (100% Offline)

A mobile-first, fully offline-capable **Public Distribution System (PDS) Management System** for Fair Price Shop (FPS) dealers and inspectors.

---

## 📱 Features & Screen Flow

### Screen 1: Login & Offline Authentication
- **Secure Offline Login**: Credentials verified via local authentication engine.
- **Pre-filled Demo Credentials**: `admin` / `1234` (or any custom dealer FPS credentials).
- **Session State**: "Remember Me" with persistent local storage.

### Screen 2: Dashboard
- **Dealer Summary Banner**: Real-time display of FPS ID, Panchayat, and active date.
- **Stock Metrics**: Live computation of Total Allotment, Total Received, and Active DSD Cycle.
- **Core Operations**: Quick navigation cards for **Dealer Details** and **Distribution & Received**.
- **Backup & Restore**: Single-click JSON database export and import for disaster recovery.

### Screen 3: Dealer Details Interface
- **Dealer Information**: Dealer Name, Panchayat, Village, FPS ID, Licence Number, Mobile Number, PDS Type (Rural / Urban / Tribal / SHG / Co-op).
- **Banking Profile**: Bank Name, Account Number, IFSC Code.
- **GPS Geo-Location Capture**: One-touch GPS coordinate capture (Latitude, Longitude, Accuracy, and Timestamp).
- **Local Save**: Persists directly into IndexedDB/LocalStorage.

### Screen 4: Distribution & Received Section
- **DSD Delivery Tracking**: Cycle selector (1st DSD, 2nd DSD, 3rd DSD, 4th DSD, Special Allotment).
- **Delivery Metadata**: DSD Done Date, Truck/Vehicle Number, Challan Number, and Quality Inspection Remarks.
- **Commodity Stock Sheet**: Structured register for:
  - *NFSA Rice* (Qtl)
  - *NFSA Wheat* (Qtl)
  - *Green Rice* (Qtl)
  - *NFSA Salt* (Pkts)
  - *Green Salt* (Pkts)
  - *Chana Daal* (Qtl)
  - *Sugar (Antyodaya)* (Qtl)
  - *Kerosene Oil* (Ltr)
- **Automatic Difference Computation**: Live recalculation of Surplus (+), Deficit (-), or Balanced (0) quantities with color coding.
- **Printable Stock Receipt**: Clean print-ready invoice layout for physical records.

---

## 🏗️ Project Structure

```
pds_android_app/
├── app/
│   ├── build.gradle                           # Android application build configuration
│   └── src/
│       └── main/
│           ├── AndroidManifest.xml            # Native permissions & activity declaration
│           ├── java/com/pds/management/
│           │   └── MainActivity.java          # Native WebView bridge with GPS support
│           ├── res/                           # Android styles, colors, and strings
│           └── assets/www/                    # Complete Offline Mobile App
│               ├── index.html                 # 4-screen Single-Page Application (SPA)
│               ├── css/style.css              # Material Design 3 mobile-first styles
│               ├── js/db.js                   # Offline IndexedDB database engine
│               ├── js/app.js                  # Application controller & calculations
│               ├── manifest.json              # PWA manifest
│               └── service-worker.js          # Service worker for offline caching
├── build.gradle                               # Top-level Gradle configuration
├── settings.gradle                            # Project settings
├── gradle.properties                          # JVM and AndroidX settings
├── build_apk.bat                              # One-click Windows APK builder
├── run_local_app.bat                          # Zero-dependency local test server
└── README.md
```

---

## 🚀 How to Run & Build

### Option 1: Instant Local Browser/Mobile Testing (Zero Setup Required)
Double-click `run_local_app.bat` or run:
```cmd
run_local_app.bat
```
This automatically launches a local offline server at `http://localhost:8080/index.html`.

### Option 2: Compile to Native Android APK (.apk)
1. Ensure Java JDK 17+ and Android SDK / Android Studio are installed on your PC.
2. Double-click `build_apk.bat` or run in Command Prompt:
   ```cmd
   build_apk.bat
   ```
3. Choose Option `1` (Release APK) or Option `2` (Debug APK).
4. The generated APK will be placed in `pds_android_app/output_apk/`.

### Option 3: Open in Android Studio
1. Open **Android Studio**.
2. Select **Open an Existing Project** and browse to `pds_android_app`.
3. Click **Build > Build Bundle(s) / APK(s) > Build APK(s)**.
