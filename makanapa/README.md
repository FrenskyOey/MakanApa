# Makan Apa 🍳

## Smart Meal Planning & Automated Shopping List Generator

**Makan Apa** is a Flutter-based meal planning application designed to simplify weekly grocery shopping and meal preparation. This project serves as both a practical solution to a real-world problem and a demonstration of Flutter clean architecture patterns.

---

## ⚡ Quick Start (TL;DR)

```bash
# Clone repo and install dependencies
git clone https://github.com/FrenskyOey/MakanApa.git
cd MakanApa/makanapa
flutter pub get

# Configure environment variables (.env files)
# Run the app (example for staging)
flutter run --flavor staging -t lib/main_staging.dart
```

> Full setup instructions, including Supabase and Firebase setup, are detailed in the Setup section below.

---

## 🤖 AI-Assisted Development

- SQL functions, triggers, and Edge Functions were generated using AI.
- All schema design, architecture, and decision-making were manually created and reviewed.
- Demonstrates a modern workflow: leveraging AI for efficiency while maintaining control and ownership.

---

## 1. Overview

Weekly grocery trips without a plan often lead to confusion about what to buy and which meals to prepare. **Makan Apa** solves this by allowing users to select their meals for the week, then automatically generating a comprehensive shopping list with all required ingredients.

### The Problem
- Manual meal planning is time-consuming
- Tracking ingredients mentally is error-prone
- Shopping without a plan leads to missed items or impulse purchases

### The Solution
Choose desired dishes for the week, and the app handles the rest — from recipe details to ingredient quantities, complete with cooking instructions.

### Target Users
- Homemakers managing household meals
- Working professionals who cook at home
- Anyone looking to streamline weekly meal preparation and grocery shopping

### Core Value Proposition
- 📖 **Recipe Library** – Curated collection of recipes with detailed instructions
- 🛒 **Auto-Generated Shopping Lists** – Instant ingredient lists based on selected meals
- 👨‍🍳 **Step-by-Step Cooking Guides** – Clear instructions for meal preparation

---

## 2. Features

### 📅 Weekly Meal Planning
- Smart Dashboard for daily meals
- 4-Week Planning Horizon
- Flexible Meal Scheduling (lunch/dinner)
- Week-by-Week Navigation
- Quick Recipe Access
- External Recipe Links (Cookpad, YouTube)

### 🍽️ Recipe Library
- Browse all recipes
- Advanced Filtering
- Favorites System
- Smart Search
- Optimized Performance (pull-to-refresh & pagination)
- Detailed Recipe View
- Multi-Platform Cooking Guides

### 🛒 Smart Shopping List
- Auto-Generated Lists
- Future Planning Preview
- Ingredients organized by category

### 👤 User Profile & Settings
- Personalized Profile (avatar & display name)
- Profile Customization
- Security Management (password change)
- Help Center
- Session Management

### 🔐 Authentication System
- Interactive Onboarding
- Multiple Login Options (email/password, Google Sign-In)
- Streamlined Registration

### ⚡ Additional Features
- Offline-First Architecture (read-only mode)
- Smart Token Management
- Adaptive Theming (Light/Dark mode)
- Secure Authentication

<details>
<summary>📱 Screenshots & Video Demos</summary>

| Onboarding & Profile | Recipe Features | Dashboard & Planning |
|:---:|:---:|:---:|
| [▶️ Demo](https://github.com/FrenskyOey/MakanApa/raw/main/makanapa/document/video/progress-1.mp4) | [▶️ Demo](https://github.com/FrenskyOey/MakanApa/raw/main/makanapa/document/video/progress-2.mp4) | [▶️ Demo](https://github.com/FrenskyOey/MakanApa/raw/main/makanapa/document/video/progress-31.mp4) |
| Authentication & Profile | Browse & manage recipes | Weekly meal planning |

<p align="center">
<img src="document/picture/1.png" width="30%" />
<img src="document/picture/2.png" width="30%" />
<img src="document/picture/3.png" width="30%" />
</p>

<p align="center">
<img src="document/picture/4.png" width="30%" />
<img src="document/picture/5.png" width="30%" />
<img src="document/picture/6.png" width="30%" />
</p>

<p align="center">
<img src="document/picture/7.png" width="30%" />
<img src="document/picture/8.png" width="30%" />
</p>

<p align="center">
<img src="document/picture/9.png" width="30%" />
<img src="document/picture/10.png" width="30%" />
<img src="document/picture/11.png" width="30%" />
</p>

<p align="center">
<img src="document/picture/12.png" width="30%" />
<img src="document/picture/13.png" width="30%" />
</p>

<p align="center">
<img src="document/picture/14.png" width="30%" />
<img src="document/picture/15.png" width="30%" />
<img src="document/picture/16.png" width="30%" />
</p>

<p align="center">
<img src="document/picture/17.png" width="30%" />
<img src="document/picture/18.png" width="30%" />
<img src="document/picture/19.png" width="30%" />
</p>

> **Note:** Shopping List feature is currently under development.

</details>

---

## 3. Tech Stack

### 📱 Core Framework
- Flutter 3.35.6
- Dart 3.9.2
- DevTools 2.48.0

### 🏗️ State Management
- **Riverpod** (Authentication, Profile, Dashboard)
- **Bloc** (Recipe features)

> Hybrid approach demonstrates proficiency in multiple state management patterns.

### 🗄️ Backend & Database
- **Supabase**
  - PostgreSQL with RLS
  - Edge Functions (AI-assisted)
  - Auth (JWT-based)
  - Storage (images & assets)

### 💾 Local Storage
- **Isar Community** – reactive offline-first database

### 🌐 Networking
- **Dio** (with interceptors & logging)
- **Chucker** (disabled for now)

### 🔧 Dependency Injection
- **Riverpod** (type-safe DI)

### 🤖 AI Integration & Data Seeding
- **n8n workflows** for recipe generation, ingredient lists, and food images

### 📦 Key Packages & Tools
- go_router, cached_network_image, flutter_hooks, hooks_riverpod
- freezed, build_runner, json_serializable
- dartz, equatable
- flutter_dotenv, firebase_auth, mockito

---

## 4. Architecture Overview

**Clean Architecture** with Feature-First structure:

```text
lib/
├── core/      # configs, constants, helpers, theme, widgets
├── features/  # feature modules (data, domain, presentation, provider)
└── shared/    # shared logic/widgets
```

**Layer Separation**
- **Domain** – pure Dart, core business logic
- **Data** – repositories, DTOs, remote & local sources
- **Presentation** – UI screens, controllers, providers

**Data Flow (Offline-First)**
`UI -> Controller -> Repository -> Remote API -> Isar DB -> Stream -> UI`

---

## 5. Setup

<details>
<summary>Show Detailed Setup</summary>

### 🛠 Prerequisites
- Flutter SDK 3.35.6
- Dart SDK 3.9.2
- Make (for code generation)

### 📥 Installation
```bash
git clone https://github.com/FrenskyOey/MakanApa.git
cd MakanApa/makanapa
flutter pub get
```

### 🔐 Environment Configuration
- Copy `environment.env.example` → `environment_staging.env` & `environment_production.env`
- Fill required keys (Supabase URL/Anon Key, Firebase credentials)

### ⚡ Supabase Setup
1. Create a Supabase project
2. Apply SQL schema from `/master/`
3. Deploy Edge Functions from `/master/`
4. Add `SUPABASE_URL` & `SUPABASE_ANON_KEY` to `.env`

### 🔥 Firebase Setup
- Add `google-services.json` (Android) & `GoogleService-Info.plist` (iOS)

### 🏗 Code Generation
```bash
make build_runner
```

### 🚀 Run App
**Staging:** `flutter run --flavor staging -t lib/main_staging.dart`  
**Production:** `flutter run --flavor production -t lib/main_prod.dart`

</details>

---

## 6. Design Decisions

- **Clean Architecture** – scalable, testable, maintainable
- **Hybrid State Management** – Riverpod (MVVM) + Bloc (MVI)
- **Isar Database** – reactive streams & developer-friendly inspector

---

## 7. Limitations

- Offline insert/update not supported yet
- Android/iOS only (no web)
- Currently supports only Indonesian language
- Forgot password (Deep Links) disabled
- Plan editing/deleting not implemented
- Push notifications not yet integrated
- Firebase Crashlytics & Analytics not configured

---

## 8. Future Improvements

- Full CRUD for plans
- Enhanced recipe selection UI
- Push notifications
- Complete forgot password flow
- CI/CD pipelines
- Expand unit/widget tests

---

## 9. Contact & License

**Email:** [frensky.lee@gmail.com](mailto:frensky.lee@gmail.com)  
**LinkedIn:** [Frensky Oey](https://www.linkedin.com/in/frensky-oey-8aaa3926/)  

**License:** MIT License
