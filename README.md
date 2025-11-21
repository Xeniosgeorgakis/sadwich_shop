# Sadwich Shop (Sandwich Shop) App

A compact Flutter demo that simulates a sandwich counter/order UI. Recent changes add pricing display and a "toasted" option on the main screen. The app keeps state in simple repository classes and is intended as a small example for UI state management and testing.

## Key features

- Add or remove sandwich items with quantity limits (configurable).
- Toggle between six-inch and footlong sandwich sizes (switch with key `size_switch`).
- Toggle toasted / untoasted using the `toasted_switch`.
- Choose a bread type from a dropdown (white, wheat, wholemeal).
- Add a free-text order note (keyed `notes_textfield`).
- Live total price calculation shown on the screen (uses `PricingRepository`).

## Quick demo

The main screen shows the current quantity, the selected sandwich type and bread, whether it's toasted, the order note, and the total price in whole pounds.

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

- Flutter SDK (this project targets Dart SDK constraint >=2.17.0 <4.0.0). See https://flutter.dev for install instructions.
- Android SDK (or Xcode on macOS) for device/emulator support.
- A device or emulator (Android, iOS, desktop or web).

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

```powershell
flutter run
```

Run on a specific device

```powershell
flutter run -d windows
flutter run -d chrome
```

## Usage

Main flow

1. The app launches `OrderScreen` from `lib/main.dart`. The example entry uses `OrderScreen(maxQuantity: 6)` — change this value in `main.dart` to alter the maximum allowed quantity.
2. Use the Add / Remove buttons to change quantity. `OrderRepository` enforces `0 <= quantity <= maxQuantity`.
3. Toggle the sandwich size using the switch with key `size_switch`.
4. Toggle toasted/untoasted using the switch with key `toasted_switch`.
5. Select bread from the dropdown and add a note using the text field (key `notes_textfield`).
6. The total price is calculated by `PricingRepository` and displayed on screen as a whole-pound integer (e.g. `Total: £11`). Default prices are six-inch = 7, footlong = 11.

Important UI controls & keys

- `notes_textfield` — TextField key for order notes.
- `size_switch` — switch controlling six-inch / footlong.
- `toasted_switch` — switch controlling toasted state.

Pricing details

- `PricingRepository` is implemented in `lib/repositories/order_repository.dart`. By default it uses integer prices (sixInchPrice = 7, footlongPrice = 11).
- Price calculation is simple multiplication: unit price * quantity. No VAT or decimals are used currently.

## Project structure & key files

- `lib/main.dart` — app entry point. Contains `OrderScreen`, UI components, and wiring to repositories.
- `lib/repositories/order_repository.dart` — contains `OrderRepository` (quantity logic) and `PricingRepository` (pricing logic).
- `lib/views/app_styles.dart` — shared text styles (`normalText`, `heading1`).
- `pubspec.yaml` — project manifest.
- `assets/screenshots/` — suggested place for screenshots (README placeholders added).

## Running tests

There are unit tests for repository logic. Run all tests with:

```powershell
flutter test
```

Run only the repository tests:

```powershell
flutter test test/repositories/order_repository_test.dart -r expanded
```

## Known issues & roadmap

Current limitations

- Prices are stored as integers (whole pounds) — no fractional currency handling or formatting.
- No persistence or backend: all state is in-memory.
- Minimal accessibility and localization.

Planned improvements

- Add proper currency formatting, support decimals and locale-aware display.
- Add persistent storage or remote order submission.
- Expand the UI into a product catalog and add checkout.

## Contributing

1. Fork and create a feature branch: `git checkout -b feat/my-change`.
2. Format code: `flutter format .` and run `flutter analyze`.
3. Add tests where appropriate and run `flutter test`.
4. Open a pull request.

## Contact

Repository owner: Xeniosgeorgakis

- GitHub: https://github.com/Xeniosgeorgakis



