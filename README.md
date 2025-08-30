# MedB Task - Flutter Application  

This is my mission task project built using **Flutter**.  
The application demonstrates **UI building, API integration, state management, Hive, and secure storage**.  

---

## 🚀 Features
- User **Registration & Login**  
- **Token-based Authentication** with Refresh Token  
- **Logout** with Cookie & Secure Storage handling  
- **Dynamic Menu** (Modules loaded from API: `moduleId`, `moduleName`, `sortOrder`, `moduleIcon`)  
- Clean project structure:
  - `models/` → Data Models & JSON Parsing  
  - `services/` → API Clients / Networking Layer  
  - `providers/ or bloc/` → State Management  
  - `screens/` → UI Pages  
  - `widgets/` → Reusable UI Components  

---

## 🛠️ Tech Stack
- **Flutter** (Dart)  
- **Dio** for API calls  
- **Flutter Secure Storage** for access token
- **Hive** for local database storage (response)
- **Dio Cookie Manager + Cookie Jar** for handling refresh tokens (cookies)  
- **Bloc** (state management – based on requirement)  

---


