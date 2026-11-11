#!/usr/bin/env bash
# One-time setup for macOS / Linux: generates the android/ and ios/ platform
# folders, installs packages and checks the code.
set -e
cd "$(dirname "$0")"

if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter was not found. Install it from https://docs.flutter.dev/get-started/install"
  exit 1
fi

flutter create --platforms=android,ios --org com.posretailpro --project-name pos_retail_pro .

# Friendly app name on the home screen
if [ -f android/app/src/main/AndroidManifest.xml ]; then
  sed -i.bak 's/android:label="[^"]*"/android:label="POS Retail Pro"/' android/app/src/main/AndroidManifest.xml
  rm -f android/app/src/main/AndroidManifest.xml.bak
fi

flutter pub get
flutter analyze
flutter test
echo
echo "Setup complete. Start the app with:  flutter run"
