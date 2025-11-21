# Sadwich Shop (Sandwich Shop) App

A small Flutter demo app that simulates a sandwich counter/order UI. It demonstrates a simple ordering flow where a user can choose sandwich length (six-inch or footlong), select a bread type, add notes, and increment/decrement quantity with enforced limits.

The app is intentionally compact and focused on UI state management and small business ordering UX — a great starter project or teaching example.

## Key features

- Add or remove sandwich items with quantity limits (configurable).
- Toggle between six-inch and footlong sandwich sizes.
- Choose a bread type from a dropdown (white, wheat, wholemeal).
- Add a free-text order note (example: "no onions").
- Simple, reusable UI components (styled button, order display).

## Quick demo

The main screen shows the current quantity, the selected sandwich type and bread, and the order note. Use the Add / Remove buttons to change quantity and the controls to update sandwich options.

_(Add screenshots or GIFs to `assets/screenshots/` and update the examples below.)_

## Table of contents

- [Installation and setup](#installation-and-setup)
- [Usage](#usage)
- [Project structure & key files](#project-structure--key-files)
- [Running tests](#running-tests)
- [Known issues & roadmap](#known-issues--roadmap)
- [Contributing](#contributing)
- [Contact](#contact)

## Installation and setup

Prerequisites

- Flutter SDK (this project targets Dart SDK constraint >=2.17.0 <4.0.0). Use a stable Flutter release compatible with a Dart SDK in that range. See https://flutter.dev for install instructions.
- Android SDK + platform tools (for Android emulators/devices) or Xcode (for iOS development on macOS).
- A device or emulator (Android emulator, iOS simulator, Windows/macOS/Linux desktop, or web browser).

Clone the repository

```powershell
git clone https://github.com/Xeniosgeorgakis/sadwich_shop.git
cd sadwich_shop
```

Install dependencies

```powershell
flutter pub get
```

Run the app

Start an emulator or connect a device, then:

```powershell
flutter run
```

To run on a specific target (example: Windows desktop or Chrome web):

```powershell
flutter run -d windows
flutter run -d chrome
```

Notes

- If you see an SDK constraint error, upgrade/downgrade your Flutter SDK to a channel that provides a Dart SDK in the supported range.
- If you want to build release artifacts, use `flutter build` (e.g., `flutter build apk`).

## Usage

Main flow

1. The app launches `OrderScreen` from `lib/main.dart`. The `maxQuantity` passed by default in the app entry is `6` (you can change this by editing the `OrderScreen(maxQuantity: 6)` call).
2. Use the Add / Remove buttons to change the order quantity. The repository logic in `lib/repositories/order_repository.dart` enforces `0 <= quantity <= maxQuantity`.
3. Toggle the sandwich length between six-inch and footlong using the switch.
4. Pick a bread type from the dropdown (options are taken from the `BreadType` enum defined in `lib/main.dart`).
5. Add any order notes via the text field (the TextField has a key `notes_textfield` useful for widget tests).

Important UI controls & keys

- `notes_textfield` — the TextField key used for order notes.
- `OrderRepository` — located at `lib/repositories/order_repository.dart`, encapsulates quantity and limits.

Customizing behavior

- Change the maximum allowed quantity by editing the `maxQuantity` parameter where `OrderScreen` is created (`lib/main.dart`). The repository uses this value to allow/disallow increments.
- Styling constants are in `lib/views/app_styles.dart` (`normalText`, `heading1`).

Screenshots

Add screenshots to `assets/screenshots/` and reference them here. Recommended sizes:
- PNG or JPG, 1280×720 (landscape) or 1080×1920 (portrait) for phone screenshots.
- GIFs for short flows (2–6 seconds, looped).

Example Markdown for an image (after you add files):

```markdown
![Home screen](assets/screenshots/home.png)
```

## Project structure & key files

High-level overview (relevant files):

- `lib/main.dart` — the main app UI, `OrderScreen`, and small widgets (`StyledButton`, `OrderItemDisplay`).
- `lib/repositories/order_repository.dart` — simple state holder for quantity and limits.
- `lib/views/app_styles.dart` — shared text styles.
- `pubspec.yaml` — project manifest; declares dependencies (`flutter`, `cupertino_icons`).
- `test/` — place for widget/unit tests (some skeleton folders exist under `test/repositories` and `test/views`).

Technologies & packages

- Flutter (framework)
- Dart (language)
- `cupertino_icons` (icons)

Development tools

- Flutter CLI (`flutter pub get`, `flutter run`, `flutter test`, `flutter analyze`)
- Your IDE of choice (VS Code, Android Studio, IntelliJ, etc.)

## Running tests

This project includes `flutter_test` as a dev dependency. To run tests:

```powershell
flutter test
```

If you add widget tests, you can target files or test names using the usual `flutter test` options.

## Known issues & roadmap

Current limitations

- No backend or persistence: orders are only kept in memory during the app session.
- No product catalog or multiple sandwich types beyond the simple enum.
- Minimal styling, accessibility, and localization.

Planned / suggested improvements

- Add persistent storage (SQLite, Hive, or remote backend) for saved orders.
- Add a product list and item details pages.
- Implement order submission to a backend (with authentication) and an admin dashboard.
- Add automated widget tests and CI (GitHub Actions) with `flutter analyze` and `flutter test`.

## Contributing

Contributions are welcome. A simple workflow:

1. Fork the repo and create a feature branch: `git checkout -b feat/my-change`.
2. Implement your change, format code: `flutter format .` and run `flutter analyze`.
3. Add tests when appropriate and run `flutter test`.
4. Open a pull request describing your change.

Coding style

- Follow Dart/Flutter idioms. Use `flutter format` and respect the existing code style.

## Contact

Repository owner: Xeniosgeorgakis

- GitHub: https://github.com/Xeniosgeorgakis

If you want to add an email or other contact method to this README, tell me what you'd like to include and I will add it.

---

If you'd like, I can also:

- Add a small CONTRIBUTING.md with a pull request template.
- Add example screenshots to `assets/screenshots/` and wire them into this README.
- Create one or two widget tests (for the add/remove behavior and the notes TextField) and run them.

Tell me which follow-up you prefer and I'll implement it.
