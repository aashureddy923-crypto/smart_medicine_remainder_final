# Smart Medicine Reminder App (Flutter UI Design Lab Project)

A mobile application developed in Flutter and Dart to help patients track daily prescriptions, log dosages, monitor adherence rates, and receive health guidelines. 

This project was built step-by-step to implement all **10 Experiments** prescribed in the **Flutter UI Design Lab Manual** (JNTU / Autonomous Engineering College syllabus).

---

## 👨‍💻 Student & Project Details

- **Project Name:** Smart Medicine Reminder (`smart_medicine_remainder_final`)
- **Framework:** Flutter SDK (Dart with sound null-safety)
- **Architecture:** Provider State Management + Modular Reusable Widgets
- **Target Platforms:** Android, iOS, Web, Tablet/Desktop (Responsive)

---

## 🎯 Project Overview & Problem Statement

Forgetting medications or taking wrong dosages at improper times is a common issue among elderly patients and individuals managing chronic health conditions. 

**Smart Medicine Reminder** solves this problem by offering:
1. Daily dosage schedule tracking with one-tap completion checkboxes.
2. Immediate urgent medication warnings with slide-in animated banners.
3. Responsive design that adjusts smoothly between mobile phones and tablets.
4. Input form with validation for adding new prescriptions, dosages, and meal timings.
5. Live health advice and drug safety guidelines retrieved via REST API integration.
6. Adherence rate score calculation based on taken vs. pending doses.

---

## 🧪 Detailed Experiment-wise Implementation

### Experiment 1: Dart Programming, Data Types & Functions
- **Lab Concept:** Dart basics, null-safety, variables, functions, arithmetic operations, and conditional logic.
- **What I Implemented:**
  - Defined the core data model `Medicine` in [`lib/models/medicine.dart`](lib/models/medicine.dart) using strongly typed attributes (`id`, `name`, `dosage`, `type`, `time`, `isTaken`).
  - Added JSON serialization methods (`toMap()` and `factory Medicine.fromMap()`).
  - Created [`lib/utils/reminder_helper.dart`](lib/utils/reminder_helper.dart) containing user-defined functions:
    - `calculateNextDose()`: Calculates the next dose time using arithmetic modulo operators on a 24-hour clock.
    - `calculateAdherenceRate()`: Determines patient compliance percentage.
    - `getAdherenceGrade()`: Categorizes patient health consistency using `if-else` conditionals.
    - <img width="1600" height="999" alt="WhatsApp Image 2026-11-10 at 22 31 31" src="https://github.com/user-attachments/assets/e5791a79-909f-4063-bc62-a3a919eb829e" />


---

### Experiment 2: Basic Flutter Layout Widgets (Row, Column, Stack)
- **Lab Concept:** Organizing UI components with `Scaffold`, `Column`, `Row`, `Container`, `Icon`, and `ElevatedButton`.
- **What I Implemented:**
  - Built [`lib/screens/basic_home_view.dart`](lib/screens/basic_home_view.dart) with structured UI nesting:
    - `Column` widget to arrange headers and prescription cards vertically.
    - `Row` widgets with `MainAxisAlignment.spaceBetween` to align medicine names, dosage details, and status icons horizontally.
    - `Container` with rounded borders, padding, and subtle background colors.
    - `Stack` widget with `Positioned` to overlay an "URGENT" warning badge on top of high-priority insulin doses.
    - `ElevatedButton` for confirming dose intakes.

---<img width="1600" height="991" alt="image" src="https://github.com/user-attachments/assets/67ae7520-5f20-4fdf-bba8-dc33d5b75dc2" />



### Experiment 3: Responsive UI Using MediaQuery and LayoutBuilder
- **Lab Concept:** Multi-screen responsiveness, device dimensions, `Orientation`, `LayoutBuilder`, and `Expanded`.
- **What I Implemented:**
  - Created [`lib/screens/responsive_dashboard.dart`](lib/screens/responsive_dashboard.dart):
    - Used `MediaQuery.of(context).size` to scale dashboard cards proportionally across screen widths.
    - Detected device orientation (`Orientation.portrait` vs. `Orientation.landscape`) to prevent layout distortion.
    - Implemented `LayoutBuilder` with a 600px breakpoint:
      - **On Mobile Phones:** Summaries display in a single-column `Column`.
      - **On Tablets / Landscape Mode:** Summaries adapt into a multi-column `Row` wrapped in `Expanded` widgets to avoid `RenderFlex` overflow errors.
      - <img width="1600" height="999" alt="image" src="https://github.com/user-attachments/assets/7172dcc9-cb5b-469d-a627-537c112073c2" />


---

### Experiment 4: Navigation and Named Routes
- **Lab Concept:** Screen routing with `Navigator.push`, `Navigator.pop`, `pushNamed`, `Drawer`, and parameter passing.
- **What I Implemented:**
  - Configured centralized named routes in `main.dart` (`'/'`, `'/add'`, `'/details'`, `'/responsive'`, `'/tips'`).
  - Built [`lib/screens/medicine_details_screen.dart`](lib/screens/medicine_details_screen.dart), extracting the `Medicine` argument via `ModalRoute.of(context)!.settings.arguments` and returning to the previous screen using `Navigator.pop(context)`.
  - Built [`lib/widgets/app_drawer.dart`](lib/widgets/app_drawer.dart) featuring a branded header and quick links to all application screens using `Navigator.pushReplacementNamed` and `Navigator.pushNamed`.
  - <img width="1600" height="999" alt="image" src="https://github.com/user-attachments/assets/62b30f9b-97dc-4058-9a2d-9a517f02f136" />


---

### Experiment 5: State Management (setState vs. Provider)
- **Lab Concept:** Understanding ephemeral (local) state vs. app-wide (global) state, `StatefulWidget`, and `ChangeNotifier`.
- **What I Implemented:**
  - **Local State:** Implemented [`lib/widgets/interactive_pill_item.dart`](lib/widgets/interactive_pill_item.dart) using a `StatefulWidget` and `setState()` to immediately toggle local pill intake checkboxes.
  - **Global State:** Implemented [`lib/providers/medicine_provider.dart`](lib/providers/medicine_provider.dart) extending `ChangeNotifier`:
    - Stores the active list of scheduled medications.
    - Provides methods `addMedicine()`, `toggleStatus()`, and `removeMedicine()`.
    - Automatically notifies UI listeners using `notifyListeners()` so badge counts and adherence bars update across every screen without needing manual state passing.
    - <img width="1600" height="792" alt="image" src="https://github.com/user-attachments/assets/89bfb7e6-7fe2-4609-9d53-0d0627c99345" />
    
<img width="1600" height="769" alt="image" src="https://github.com/user-attachments/assets/bf2747b9-f1b3-4bc4-8efe-bb1c360d4f43" />


---

### Experiment 6: Custom Reusable Widgets & Theming
- **Lab Concept:** Modular programming, code reusability, custom widget composition, and `ThemeData`.
- **What I Implemented:**
  - Created reusable custom UI widgets:
    - [`lib/widgets/medicine_card.dart`](lib/widgets/medicine_card.dart): A custom card containing pill avatars, typography styling, strike-through text upon completion, and action icons.
    - [`lib/widgets/primary_button.dart`](lib/widgets/primary_button.dart): A reusable styled action button.
  - Created [`lib/theme/app_theme.dart`](lib/theme/app_theme.dart):
    - Configured a clean medical color palette using Material 3 (`seedColor: Color(0xFF00796B)`).
    - Defined custom `AppBarTheme`, `CardTheme`, and `ElevatedButtonThemeData`.
    - Added support for both **Light Mode** and **Dark Mode**.
    - 
<img width="1600" height="851" alt="image" src="https://github.com/user-attachments/assets/9c1d7882-d86e-45f2-ab6c-170e7dfe096d" />

---

### Experiment 7: Form Design, Input Fields & Form Validation
- **Lab Concept:** `Form` widget, `GlobalKey<FormState>`, `TextFormField`, validators, `DropdownButtonFormField`, `RadioListTile`, `CheckboxListTile`, and `SnackBar`.
- **What I Implemented:**
  - Created [`lib/screens/add_medicine_screen.dart`](lib/screens/add_medicine_screen.dart):
    - Attached `final _formKey = GlobalKey<FormState>()` to validate the form before submission.
    - Added `TextFormField` fields with validation rules: medicine name must be non-empty and at least 3 characters; dosage must be specified.
    - Added `DropdownButtonFormField` for form factors (Tablet, Capsule, Syrup, Injection, Drops).
    - Added `RadioListTile` options for dosage frequencies (Once Daily, Twice Daily).
    - Added `CheckboxListTile` for specifying meal timing (before or after meals).
    - Displayed confirmation and error feedback using `ScaffoldMessenger.of(context).showSnackBar()`.
    - <img width="1600" height="533" alt="image" src="https://github.com/user-attachments/assets/d0ba80a0-319c-4148-9694-c3086bac1c6f" />


---

### Experiment 8: Flutter UI Animations
- **Lab Concept:** Implicit and explicit animations, `AnimatedContainer`, `AnimatedOpacity`, `AnimatedPositioned`, `Curves`, and `Duration`.
- **What I Implemented:**
  - Created [`lib/widgets/intake_celebration.dart`](lib/widgets/intake_celebration.dart):
    - `AnimatedContainer` that smoothly transitions its width, border color, and border-radius when a dose is logged.
    - `AnimatedOpacity` that fades in completion badges over 500ms.
  - Created [`lib/widgets/slide_alert_banner.dart`](lib/widgets/slide_alert_banner.dart):
    - Used `AnimatedPositioned` with `Curves.elasticOut` to slide a urgent dosage alert banner down from the top of the screen (`top: 16` vs `top: -120`).

---

### Experiment 9: REST API Integration & FutureBuilder
- **Lab Concept:** HTTP client, `jsonDecode`, handling asynchronous operations, loading indicators, and error handling.
- **What I Implemented:**
  - Created [`lib/utils/api_service.dart`](lib/utils/api_service.dart):
    - Used the `http` package to send asynchronous HTTP GET requests to fetch clinical health articles.
    - Parsed the JSON response string into typed `HealthTip` Dart objects using `jsonDecode()`.
  - Created [`lib/screens/health_tips_screen.dart`](lib/screens/health_tips_screen.dart):
    - Wrapped the API call inside a `FutureBuilder<List<HealthTip>>`.
    - Added a `CircularProgressIndicator` during `ConnectionState.waiting`.
    - Added an error handling view with a "Try Again" retry button if connectivity fails.
    - Rendered fetched data in a scrollable `ListView.builder` using `Card` and `ListTile`.

---

### Experiment 10: Unit Testing, Widget Testing & Debugging
- **Lab Concept:** `flutter_test`, `test()`, `testWidgets()`, `expect()`, matchers, `WidgetTester`, `pumpWidget`, and resolving layout errors.
- **What I Implemented:**
  - **Unit Testing:** Created [`test/reminder_unit_test.dart`](test/reminder_unit_test.dart):
    - Tested `ReminderHelper.calculateNextDose()` across standard and midnight transitions.
    - Tested adherence percentage calculations including zero-dose edge cases.
    - Tested `Medicine.toMap()` and `Medicine.fromMap()` serialization.
  - **Widget Testing:** Created [`test/medicine_card_widget_test.dart`](test/medicine_card_widget_test.dart):
    - Tested UI rendering of `MedicineCard` using `WidgetTester` and `tester.pumpWidget()`.
    - Verified element presence using `find.text('Atorvastatin')` and `findsOneWidget`.
    - Simulated user tap interactions on icon buttons using `tester.tap()`.
  - **Debugging:** Verified that no `RenderFlex` overflows occur by utilizing
  - `Expanded`, `Flexible`, and `SingleChildScrollView`.

<img width="1366" height="492" alt="image" src="https://github.com/user-attachments/assets/39b4766f-e886-4e7e-9050-67fa4c7c66b1" />
<img width="1260" height="640" alt="image" src="https://github.com/user-attachments/assets/5637dea6-014f-46ee-b50a-a03cf07ab499" />



---

## 🗂️ Project Directory Structure

```text
smart_medicine_remainder_final/
├── android/
├── ios/
├── lib/
│   ├── main.dart                       # App entrypoint, MultiProvider & Route map
│   ├── models/
│   │   └── medicine.dart               # Exp 1: Data model with null safety
│   ├── utils/
│   │   ├── reminder_helper.dart        # Exp 1: Dosage calculations & adherence logic
│   │   └── api_service.dart            # Exp 9: REST API HTTP client & JSON parser
│   ├── widgets/
│   │   ├── app_drawer.dart             # Exp 4: Navigation drawer with named routes
│   │   ├── interactive_pill_item.dart  # Exp 5: StatefulWidget local state toggle
│   │   ├── medicine_card.dart          # Exp 6: Reusable custom prescription card
│   │   ├── primary_button.dart         # Exp 6: Custom reusable action button
│   │   ├── intake_celebration.dart     # Exp 8: AnimatedContainer & AnimatedOpacity
│   │   └── slide_alert_banner.dart     # Exp 8: AnimatedPositioned slide banner
│   ├── screens/
│   │   ├── basic_home_view.dart        # Exp 2: Row, Column, Container, Stack
│   │   ├── responsive_dashboard.dart   # Exp 3: MediaQuery & LayoutBuilder
│   │   ├── medicine_details_screen.dart# Exp 4: Screen arguments & Navigator.pop
│   │   ├── add_medicine_screen.dart    # Exp 7: Form, TextFormField & validation
│   │   └── health_tips_screen.dart     # Exp 9: FutureBuilder with REST API
│   ├── providers/
│   │   └── medicine_provider.dart      # Exp 5: Global ChangeNotifier state
│   └── theme/
│       └── app_theme.dart              # Exp 6: Medical light & dark ThemeData
├── test/
│   ├── reminder_unit_test.dart         # Exp 10: Pure Dart unit test suite
│   └── medicine_card_widget_test.dart  # Exp 10: Flutter UI widget test suite
├── pubspec.yaml                        # Dependencies: provider, http, flutter_test
└── README.md                           # Lab manual project documentation
```

---

## 💻 How to Run the Project Locally

### 1. Prerequisites
- Flutter SDK installed and added to your system `PATH`.
- Android Studio or VS Code with Flutter & Dart extensions.
- An Android emulator, physical phone (via USB debugging), or Chrome browser.

### 2. Installation & Run
```bash
# 1. Clone repository
git clone https://github.com/aashureddy923-crypto/smart_medicine_remainder_final.git
cd smart_medicine_remainder_final

# 2. Get dependencies
flutter pub get

# 3. Verify Flutter setup
flutter doctor

# 4. Run application
flutter run
```

### 3. Running Test Cases (Experiment 10)
```bash
flutter test
```
**Expected Test Output:**
```text
00:02 +4: All tests passed!
```
