# 📊 SmartPay Fraud Monitor (Web Dashboard)

A Flutter Web dashboard for monitoring and analyzing fraudulent credit card transactions.

---

# ✨ Key Features

- Real-time transaction monitoring
- Fraud vs. legitimate transaction visualization
- Transaction history table
- REST API integration with Flask backend
- Responsive dashboard UI

---

# 🛠️ Tech Stack

- Flutter Web
- Dart
- Cubit / Provider
- Dio Package
- Flask Backend
- Retrofit Package

---

# 🤖 AI & Backend Integration

This dashboard is connected to a Flask backend integrated with a Machine Learning fraud detection model.

The AI model was originally developed as part of a university Machine Learning project and later integrated into this monitoring dashboard system.

---

# 📡 API Endpoint

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/transactions` | GET | Fetches all processed transactions |

---

# 🔧 Setup

Update the `baseUrl` inside:

```dart
api_service.dart
```

with your backend server IP.

---

# ▶️ Run the Dashboard

```bash
flutter pub get
flutter run -d chrome --web-browser-flag "--disable-web-security"
```

