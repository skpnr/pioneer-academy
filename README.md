# 🏆 PIONEER ACADEMY (पायनियर एकेडमी)
> **JSSC • CGL • JPSC राज्य स्तरीय प्रतियोगी परीक्षा मास्टर ऐप एवं वेब पोर्टल**
> *Android App (APK v5.5.0) & Live Cloud Database Integration (Supabase Free Tier)*

[![Android Version](https://img.shields.io/badge/Release-v5.5.0_(Build_10)-success.svg)](web/PIONEER.apk)
[![MCQ Bank](https://img.shields.io/badge/Questions-5,000_MCQs_(50_Sets)-blue.svg)](#-50-टेस्ट-सीरीज़-5000-mcqs)
[![Database](https://img.shields.io/badge/Database-Supabase_Free_Tier-emerald.svg)](https://supabase.com)
[![Offline](https://img.shields.io/badge/Offline_Engine-100%25_Supported-amber.svg)](#-ऑफ़लाइन-एवं-क्लाउड-आर्किटेक्चर)

---

## 📲 Android APK डाउनलोड (Direct Download)
- **APK फाइल:** [`web/PIONEER.apk`](web/PIONEER.apk) (साइज: ~21 MB)
- **संस्करण:** v5.5.0 (Build 10)
- **हस्ताक्षर (Signature):** v1 (JAR Signature) + v2 (Full APK Signature) सत्यापित
- **ऑफ़लाइन सपोर्ट:** 100% इंटरनेट रहित भी सभी 50 सेट्स और नोट्स तुरंत लोड होते हैं।

---

## 🌟 मुख्य विशेषताएं (Key Highlights)

### 1. 50 टेस्ट सीरीज़ (5,000 MCQs)
- कुल 50 उच्च स्तरीय टेस्ट सेट्स, प्रत्येक में 100 प्रश्न।
- तुरंत हरा (सही) एवं लाल (गलत) रंग से विकल्प सत्यापन।
- हर प्रश्न के लिए सन्नी सर की प्रामाणिक संदर्भ व्याख्या।
- -0.33 नेगेटिव मार्किंग, लाइव स्कोर टैली एवं विस्तृत परिणाम कार्ड।

### 2. संपूर्ण अध्ययन सामग्री एवं नोट्स
- **झारखंड सामान्य ज्ञान:** 94 व्यापक अध्याय (इतिहास, भूगोल, राजव्यवस्था, कला-संस्कृति, योजनाएं, खान एवं खनिज)।
- **खोरठा भाषा एवं साहित्य:** 12 प्रामाणिक अध्याय (79 पृष्ठ)।
- **सामान्य हिन्दी व्याकरण:** 3 विस्तृत अध्याय (27 पृष्ठ)।
- **हिन्दी टाइपिंग एवं कंप्यूटर ज्ञान:** कृति देव 010 आल्ट कोड्स, शॉर्टकट कुंजियां (18 पृष्ठ)।

### 3. रोल-आधारित प्रमाणीकरण (Role-Based Authentication)
- **मास्टर एडमिन:** 
  - मोबाइल नंबर: `9155933842`
  - पासवर्ड: `000000`
  - सुविधाएं: नए छात्रों को जोड़ना/हटाना, छात्रों की सक्रियता देखना, नोट्स एवं टेस्ट प्रबंधन।
- **10 अधिकृत पंजीकृत छात्र:**
  - डिफ़ॉल्ट पासवर्ड: `070719`
  - पंजीकृत नंबर: `7903539200`, `8603199361`, `6207570594`, `6201862281`, `9229735570`, `8252234919`, `9142666255`, `9525511525`, `9470712197`, `9572850513`

---

## 🗄️ Supabase क्लाउड डेटाबेस (Free Tier)

ऐप Supabase PostgREST API के साथ सीधे सिंक्रोनाइज़ होता है:
- **प्रोजेक्ट आईडी:** `qjfgimwmfypjsrwwkvld`
- **तालिकाएं (Tables):**
  - `students`: अधिकृत छात्रों का विवरण, सक्रियता और एक्टिवेशन की।
  - `admins`: मास्टर एडमिन क्रेडेंशियल्स।
  - `test_submissions`: छात्रों द्वारा सबमिट किए गए टेस्ट स्कोर, एक्यूरेसी और समय।
- **डेटाबेस स्कीमा:** [`supabase/schema.sql`](supabase/schema.sql)

---

## 🚀 लाइव वेब पोर्टल परिनियोजन (Deployment Guide)

### विकल्प A: GitHub Pages (अनुशंसित - 100% नि:शुल्क)
1. GitHub पर `Settings` > `Pages` में जाएं।
2. `Source` में `Deploy from a branch` चुनें।
3. Branch में `main` और फोल्डर में `/web` (या `/root`) चुनकर Save करें।
4. आपकी लाइव वेबसाइट **`https://skpnr.github.io/pioneer-academy/`** पर सक्रिय हो जाएगी!

### विकल्प B: Vercel / Netlify
1. Vercel या Netlify में `skpnr/pioneer-academy` रिपॉजिटरी को इम्पोर्ट करें।
2. Root Directory में `web` सेट करें।
3. Deploy पर क्लिक करें। 30 सेकंड में लाइव URL तैयार हो जाएगा।

---

## 🛠️ रिपॉजिटरी संरचना (Repository Layout)

```
pioneer-academy/
├── android/          # Android Studio Native App (Gradle 8.2, JDK 17)
├── web/              # वेब पोर्टल (index.html, PIONEER.apk, PDFs, JS libraries)
│   ├── PIONEER.apk   # डाउनलोड हेतु हस्ताक्षरित Android APK (v5.5.0)
│   ├── index.html    # लाइव सिंगल-पेज वेब एप्लिकेशन
│   ├── books/        # खोरठा एवं झारखंड संदर्भ पुस्तकें (PDF)
│   └── vendor/       # Tailwind, Chart.js, Leaflet, React, PDF.js
├── sets/             # सभी 50 सत्यापित टेस्ट सेट्स (set_01.json से set_50.json)
├── supabase/         # Supabase PostgreSQL DDL एवं RLS नीतियां (schema.sql)
└── README.md         # संपूर्ण प्रलेखन
```

---
*© 2026 पायनियर एकेडमी (PIONEER Academy). All rights reserved.*
