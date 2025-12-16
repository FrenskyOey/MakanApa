# Makan Apa 🍳

## Smart Meal Planning & Automated Shopping List Generator

**Makan Apa** is a Flutter-based meal planning application designed to simplify weekly grocery shopping and meal preparation. This project serves as both a practical solution to a real-world problem and a deep dive into Flutter clean architecture patterns.

### 🤖 AI-Powered Features
This application leverages artificial intelligence to enhance the user experience:
- **AI-Generated Food Images** - Automatically creates appealing visuals for recipes
- **Smart Ingredient Lists** - AI helps generate comprehensive ingredient requirements for each dish
- **Recipe Assistance** - AI-powered food list generator

---

## Overview

Going to the market weekly without a plan often leads to confusion about what to buy and what meals to prepare. **Makan Apa** solves this by allowing users to select their meals for the week, then automatically generating a comprehensive shopping list with all required ingredients.

### The Problem
- Manual meal planning is time-consuming and often forgotten
- Creating shopping lists from scratch requires mentally tracking all ingredients
- Grocery shopping without a plan leads to impulse purchases or missing items

### The Solution
Simply choose your desired dishes for the week, and the app handles the rest - from recipe details to ingredient quantities, complete with cooking instructions.

### Target Users
- Homemakers managing household meals
- Working professionals who cook at home
- Anyone looking to streamline their weekly meal preparation and grocery shopping

### Core Value Proposition
- 📖 **Recipe Library** - Curated collection of recipes with detailed instructions
- 🛒 **Auto-Generated Shopping Lists** - Ingredient lists created instantly based on selected meals
- 👨‍🍳 **Step-by-Step Cooking Guides** - Clear instructions for meal preparation

This project also demonstrates proficiency in Flutter clean architecture, state management, and scalable app design patterns.

## Features

### 📅 Weekly Meal Planning
- **Smart Dashboard** - View today's planned meals with quick access to yesterday's and tomorrow's menus
- **4-Week Planning Horizon** - Create meal plans up to 4 weeks in advance
- **Flexible Meal Scheduling** - Set lunch and dinner for each day, with the option to leave days unplanned
- **Week-by-Week Navigation** - Browse upcoming weeks to review and adjust your meal plans
- **Quick Recipe Access** - Tap any meal to view detailed ingredients and cooking instructions
- **External Recipe Links** - Direct integration with Cookpad and YouTube for video tutorials

### 🍽️ Recipe Library
- **Comprehensive Recipe Database** - Browse all available recipes in the Makan Apa collection
- **Advanced Filtering** - Filter recipes by food category for easier discovery
- **Favorites System** - Save and quickly access your most-loved recipes
- **Smart Search** - Find specific dishes quickly with the built-in search functionality
- **Optimized Performance** - Pull-to-refresh and pagination for smooth browsing experience
- **Detailed Recipe View** - Access complete ingredient lists and preparation steps
- **Multi-Platform Cooking Guides** - Links to Cookpad and YouTube for visual cooking instructions

### 🛒 Smart Shopping List
- **Auto-Generated Lists** - Automatically compiled shopping list based on the current week's meal plan
- **Future Planning** - Preview next week's ingredient requirements
- **Organized by Category** - Ingredients grouped into Meat, Vegetables, and Spices/Others for efficient shopping

### 👤 User Profile & Settings
- **Personalized Profile** - Custom avatar and display name
- **Profile Customization** - Edit name and avatar through the dedicated settings menu
- **Security Management** - Change password functionality for account security
- **Help Center** - Built-in FAQ section for app guidance
- **Session Management** - Secure logout functionality

### 🔐 Authentication System
- **Interactive Onboarding** - Engaging intro screens showcasing app capabilities
- **Multiple Login Options** - Traditional email/password or convenient Google Sign-In
- **Streamlined Registration** - Quick sign-up process with automatic account creation

### ⚡ Additional Features
- **Offline-First Architecture** - Access recipes and meal plans without internet connection (read-only mode)
- **Smart Token Management** - Automatic refresh token handling with graceful session expiration
- **Adaptive Theming** - Light and Dark mode support that follows system preferences
- **Secure Authentication** - Token-based authentication with automatic session management

## Screenshots

### 📱 Video Demos

Get a complete walkthrough of the app's features:

<div align="center">

| Onboarding & Profile | Recipe Features | Dashboard & Planning |
|:---:|:---:|:---:|
| [▶️ Watch Demo](https://github.com/FrenskyOey/MakanApa/raw/main/makanapa/document/video/progress-1.mp4) | [▶️ Watch Demo](https://github.com/FrenskyOey/MakanApa/raw/main/makanapa/document/video/progress-2.mp4) | [▶️ Watch Demo](https://github.com/FrenskyOey/MakanApa/raw/main/makanapa/document/video/progress-31.mp4) |
| User authentication flow and profile management | Browse, search, and manage recipe collection | Weekly meal planning and dashboard overview |

</div>

---

### 🎯 Onboarding Experience

<p align="center">
  <img src="document/picture/1.png" width="30%" />
  <img src="document/picture/2.png" width="30%" />
  <img src="document/picture/3.png" width="30%" />
</p>

---

### 📊 Dashboard & Meal Planning

<p align="center">
  <img src="document/picture/4.png" width="30%" />
  <img src="document/picture/5.png" width="30%" />
  <img src="document/picture/6.png" width="30%" />
</p>

<p align="center">
  <img src="document/picture/7.png" width="30%" />
  <img src="document/picture/8.png" width="30%" />
</p>

---

### 🍳 Recipe Library

<p align="center">
  <img src="document/picture/9.png" width="30%" />
  <img src="document/picture/10.png" width="30%" />
  <img src="document/picture/11.png" width="30%" />
</p>

<p align="center">
  <img src="document/picture/12.png" width="30%" />
  <img src="document/picture/13.png" width="30%" />
</p>

---

### 👤 Profile & Settings

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

---

> **Note:** Shopping List feature is currently under development and will be updated soon.

## Tech Stack

### 📱 Core Framework
- **Flutter** 3.35.6 (Stable Channel)
- **Dart** 3.9.2
- **DevTools** 2.48.0

### 🏗️ State Management
A hybrid approach combining two powerful state management solutions:

- **Riverpod** - Used for Authentication, Profile, and Dashboard features
- **Bloc** - Implemented for Recipe features with Riverpod handling dependency injection
  
> **Why Hybrid?** This architecture demonstrates proficiency in multiple state management patterns, making the codebase accessible to developers familiar with either approach while showcasing advanced Flutter skills.

### 🗄️ Backend & Database
- **Supabase** - Complete backend solution
  - **PostgreSQL Database** - Robust relational database with built-in RLS (Row Level Security)
  - **Edge Functions** - Serverless REST API endpoints with AI-assisted code generation
  - **Supabase Authentication** - JWT-based authentication with automatic hourly token refresh
  - **Supabase Storage** - Image and asset storage with CDN delivery

> **Why Supabase?** Easy maintenance with PostgreSQL, powerful Edge Functions as REST API alternative, superior security through RLS policies, and excellent AI code generation compatibility.

### 💾 Local Storage
- **Isar Community** - High-performance NoSQL database
  - Real-time Stream support for reactive offline-first architecture
  - Built-in Web UI for easy debugging and data inspection
  - Enables seamless offline data synchronization

### 🌐 Networking
- **Dio** - HTTP client with interceptor support
  - **LogInterceptor** - Request/response logging for debugging
  - **Custom Token Interceptor** - Automatic token refresh and expiration handling
  - **Custom Header Interceptor** - App version and device info tracking for backend logging
- **Chucker** - Network inspection tool (currently disabled)

### 🔧 Dependency Injection
- **Riverpod** - Type-safe dependency injection and service locator

### 🤖 AI Integration & Data Seeding
Powered by **n8n** workflow automation for intelligent data generation:

- **Recipe Generation** - Gemini AI generates authentic recipe names based on cuisine type
- **Ingredient Lists** - ChatGPT creates detailed ingredient lists for 2-serving portions
- **Food Photography** - Flux Pro Nano Banana generates Ghibli-style food imagery
- **Automated Seeding** - Complete pipeline from AI generation to Supabase storage

### 📦 Key Packages & Tools

**UI & Navigation**
- `go_router` - Declarative routing and navigation
- `cached_network_image` - Efficient image loading and caching
- `flutter_hooks` + `hooks_riverpod` - Lifecycle management and automatic disposal

**Code Generation**
- `freezed` - Immutable model classes and union types
- `build_runner` - Code generation for Isar and Riverpod
- `json_serializable` - JSON serialization/deserialization

**Architecture & Patterns**
- `dartz` - Functional programming with Either type for error handling
- `equatable` - Value equality for models and state classes

**Security & Configuration**
- `flutter_dotenv` - Secure environment variable management
- `firebase_auth` - Google Sign-In integration

**Testing**
- `mockito` - Mock generation for unit testing
- `build_runner` - Test mock generation

### 🎯 Architecture Highlights
- **Offline-First Design** - Full read access without internet connectivity
- **Clean Architecture** - Separation of concerns with clear layer boundaries
- **Repository Pattern** - Abstracted data sources for testability
- **Functional Error Handling** - Type-safe error propagation with Either
- **Reactive Programming** - Stream-based data flow with Isar and Riverpod

# 6. Architecture Overview

This project adheres to **Clean Architecture** principles, organized using a **Feature-First** (Screaming Architecture) directory structure. This ensures that the codebase is scalable, maintainable, and testable, with a clear separation of concerns between the UI, business logic, and data handling.

## 📂 Directory Structure

The project structure is designed to reveal "what the app does" at a glance. Common utilities reside in `core`, while specific business capabilities are encapsulated within `features`.

```text
lib/
├── core/                  # Global configurations and utilities
│   ├── configs/           # Routes, environment configs
│   ├── constant/          # App constants, enums, extensions
│   ├── handler/           # Error handling, logging
│   ├── helper/            # UI helpers (Dialogs, Snackbars)
│   ├── theme/             # App theme (Colors, Typography, Dimensions)
│   └── widget/            # Reusable core widgets (Buttons, Inputs, etc.)
│
├── features/              # Feature-based modules (e.g., Home, Basket, Profile)
│   ├── [feature_name]/
│   │   ├── data/          # Data Layer (Impl details)
│   │   │   ├── data_source/
│   │   │   │   ├── remote/   # API calls
│   │   │   │   └── local/    # Database access (Isar)
│   │   │   ├── models/       # DTOs and Entity conversions
│   │   │   └── repositories/ # Repository Implementations
│   │   │
│   │   ├── domain/        # Domain Layer (Pure Dart)
│   │   │   ├── models/       # Business Objects
│   │   │   └── repositories/ # Repository Interfaces
│   │   │
│   │   ├── presentation/  # Presentation Layer (UI & Logic)
│   │   │   ├── components/   # Feature-specific widgets
│   │   │   ├── controllers/  # State Management (Riverpod)
│   │   │   └── screens/      # Full page views
│   │   │
│   │   └── provider/      # Dependency Injection (Riverpod providers)
│
└── shared/                # Logic/Widgets shared across multiple features
    ├── data/
    ├── domain/
    └── provider/

## 🏗 Layer Separation

The application is divided into three distinct layers:

### 1. Domain Layer (Inner Layer)
*   The core of the application logic. It is purely written in Dart and has no dependencies on external libraries (like Flutter, HTTP, or Databases).
*   **Contents:** Abstract Repository definitions and pure Domain Models.

### 2. Data Layer (Outer Layer)
*   Responsible for coordinating data from different sources.
*   **Contents:**
    *   **Data Sources:** Abstract and concrete implementations for Remote (API) and Local (Isar DB).
    *   **DTOs (Data Transfer Objects):** Handles serialization/deserialization for APIs (`ResponseApi`) and Database Tables (`EntityLocal`).
    *   **Repository Implementation:** The bridge that connects the Domain repositories to the actual Data Sources.

### 3. Presentation Layer (UI Layer)
*   Responsible for painting the screen and handling user interaction.
*   **Contents:**
    *   **Screens & Components:** Flutter Widgets.
    *   **Controllers:** Manages `UI State`, side effects (`UI Effect`), and business logic using **Riverpod**.
    *   **Providers:** Dependency injection definitions.

## 🔄 Data Flow & Caching Strategy

The app implements a **Reactive / Offline-First** repository pattern using **Isar Database** as the single source of truth for the UI.

1.  **Trigger:** The UI triggers an action via the **Controller** (Riverpod).
2.  **Fetch & Store:** The **Repository** fetches fresh data from the **Remote DataSource**.
3.  **Persist:** Instead of returning data directly to the UI, the Repository saves the result into the **Local DataSource** (Isar DB).
4.  **Reactive Stream:** The Local Database emits a stream of updated data.
5.  **Update UI:** The **Controller** listens to this stream and updates the `UI State`.

**Flow Visualization:**
`UI -> Controller -> Repository -> Remote API -> Save to Isar DB -> Stream Update -> Controller -> UI Render`
