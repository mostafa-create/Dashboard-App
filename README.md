# 🌌 Enterprise Admin Console (Android & Cross-Platform)

A high-performance, responsive administrative dashboard built as a **Practical Examination Project** for the **Android Development Course**. Leveraging Flutter and Dart, this system showcases how a single codebase can cleanly target Android mobile devices while dynamically scaling up to corporate desktop environments.

---

## 📱 Android-Focused Responsive Features
While designed as a spacious console, the architecture explicitly handles mobile constraints native to the Android ecosystem:
* **Dynamic Grid Scaling (`lib/screens/dashboard_screen.dart`):** Uses a native `LayoutBuilder` to read the device's physical viewport width. On an Android mobile device, it drops the column layout count down to **1 column**, auto-stacking elements. On a tablet or desktop browser, it automatically expands up to **4 columns**.
* **Responsive Layout Protection (`lib/widgets/data_widgets.dart`):** Employs **`Expanded`** constraints on critical row elements. This guarantees that varying Android screen resolutions and aspect ratios will never trigger horizontal pixel overflow rendering bugs (`A RenderFlex overflowed...`).
* **Mobile-Optimized Assets (`lib/widgets/sidebar.dart`):** The side navigation bar tracks a reactive boolean flag `_isCollapsed`. On narrower screens, it collapses into a minimalist 80px visual icon track to preserve precious rendering real estate on standard mobile devices.

---

## 🚀 Practical Exam Tech Stack
* **Language:** Dart
* **Framework Core:** Flutter (Cross-Platform Android Target Optimization)
* **UI Foundation:** Material Design 3 (Google's native Android design framework)
* **Typography:** Inter (via Google Fonts)
* **Data Visualization Library:** `fl_chart` for hardware-accelerated animations

---

## 🏗️ Architecture & Structural Philosophy
This project strictly enforces a **Separation of Concerns (SoC)**, separating the immutable data blueprint layer from the fluid visual presentation layer:

1. **The Data Layer (`lib/models/dashboard_data.dart`):** Acts as the system brain, establishing type-safe entities (`StatCardData`, `TransactionData`, `ActivityData`) and mocking live database models.
2. **The Presentation UI Layer (`lib/widgets/`):** Consists of functional, declarative `StatelessWidget` and `StatefulWidget` layouts that consume the data layer to render structural grid interfaces natively.

---

## 👥 Practical Exam Project Team & Ownership
To ensure a balanced distribution of workloads and engineering responsibility, components are modularized and assigned across the system layers:

* **Yehia Mohammed Dakhly** (`lib/widgets/sidebar.dart`, `lib/main.dart`)
  * Layout sidebars, system initialization settings, and global theme configurations.
* **Mohamed Azoz Mahmoud** (`lib/widgets/sidebar.dart`)
  * Navigation UI implementation and `_isCollapsed` state logic.
* **Mostafa Yassin Abdellatif** (`lib/widgets/data_widgets.dart`)
  * Implementation of dynamic `TransactionsList` with conditional color formatting, alongside the vertical timeline canvas logic for the `ActivityFeed`.
* **Shahd Elaref** (`lib/screens/dashboard_screen.dart`)
  * Structural layout conductor, orchestrating `LayoutBuilder` grid logic for adaptive viewports across multiple screen scales.
* **Mariam Fathy Khalaf** (`lib/widgets/charts.dart`)
  * Analytical visualization manager executing data interpolation for rendering line trend curves and source donut charts.
* **Kareem Ahmed Hiba** (`lib/widgets/stat_card.dart`)
  * Interactive UI components specialist establishing scale-transitions and active mouse hover glow triggers on KPI nodes.
* **Omar Elsayed Mohammed** (`lib/models/dashboard_data.dart`)
  * Database model architect designing data entity blueprints, typing structures, and core data arrays.
* **Somaya Asaad Fawzy** (`lib/theme/app_colors.dart`)
  * Visual identity lead establishing global hexadecimal palettes, alpha transparency gradients, and color contrast boundaries.

---

## 🔧 Android Deployment & Build Instructions

Ensure you have the Flutter SDK and Android Studio (with the Android SDK toolchain) installed.

1. **Clone the project repository:**
   ```bash
   git clone [https://github.com/your-username/enterprise-admin-dashboard.git](https://github.com/your-username/enterprise-admin-dashboard.git)
   cd enterprise-admin-dashboard
