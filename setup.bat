@echo off
REM One-time setup for Windows: generates the android/ and ios/ platform
REM folders, installs packages and checks the code.
cd /d "%~dp0"

where flutter >nul 2>nul
if errorlevel 1 (
  echo Flutter was not found. Install it from https://docs.flutter.dev/get-started/install
  exit /b 1
)

call flutter create --platforms=android,ios --org com.posretailpro --project-name pos_retail_pro .
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "$f='android\app\src\main\AndroidManifest.xml'; if (Test-Path $f) { (Get-Content $f) -replace 'android:label=\"[^\"]*\"','android:label=\"POS Retail Pro\"' | Set-Content $f }"

call flutter pub get
call flutter analyze
call flutter test
echo.
echo Setup complete. Start the app with:  flutter run
