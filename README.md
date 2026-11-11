# POS Retail Pro

An offline-first Flutter point-of-sale app for Android and iOS.

## Features
- Splash/welcome, login (hashed passwords, remember me, sign-up, lock-out after 5 failed tries)
- Dashboard: today's sales, low-stock alert, quick actions, recent transactions
- Sales: product search, category filter, cart with +/- quantities, stock checks
- Checkout: choose or add a customer, editable cart, tax from settings
- Payments: Cash (amount received + change), Card, Mobile Money, Bank Transfer
- Receipts: shown after every sale, reopenable from history, copy as text
- Inventory: add / edit / delete products, low-stock warnings, stock value
- Customers: add / edit / delete, purchase count and total spent
- Reports: Today / 7 days / 30 days / All time, 7-day bar chart, payment-method split,
  top products, sales list, copy as CSV
- Settings: business profile, currency, tax rate, enabled payment methods, default
  reorder level, user management (Owner / Cashier), dark mode, change password,
  erase-all-data
- Works fully offline; data is saved on the device (SharedPreferences)

## First-time setup
1. Install Flutter (https://docs.flutter.dev/get-started/install) and run `flutter doctor`.
2. In this folder run the setup script:
   - Windows: `setup.bat`
   - macOS / Linux: `./setup.sh`

   It runs `flutter create` (generates the `android/` and `ios/` folders), then
   `flutter pub get`, `flutter analyze` and `flutter test`.
3. Start an emulator or plug in a phone, then: `flutter run`

(Manual equivalent: `flutter create --platforms=android,ios --org com.posretailpro --project-name pos_retail_pro .`
then `flutter pub get` and `flutter run`.)

## Demo login
Email: `admin@posretailpro.com`  Password: `admin123` (Owner).
The fields are pre-filled in debug builds only. Change the password under
More → Security & Privacy.

## Roles
- **Owner**: everything, including business/payment/inventory settings and user management.
- **Cashier**: selling, customers, inventory edits and reports. New accounts created through
  *Sign Up* are Cashiers; owners can add Owners or Cashiers in User Management.

## Project structure
```
lib/
  main.dart                 app entry, theme mode
  models/                   Product, Customer, Sale, AppUser, BusinessSettings
  providers/app_store.dart  state: auth, cart, sales, stock, reports (ChangeNotifier)
  services/                 storage_service (local persistence), auth_service (hashing)
  screens/                  all screens
  widgets/                  app_shell (bottom navigation), dialogs
  utils/format.dart         money / date formatting
test/widget_test.dart       unit + widget tests
```

## Notes for production
This is an academic/demo build. A production system should add a backend and server-side
authentication, encrypted storage (e.g. flutter_secure_storage / SQLCipher), audit logs,
receipt printing, barcode scanning and real payment-provider integrations (card terminal,
MTN/Airtel Mobile Money APIs).
