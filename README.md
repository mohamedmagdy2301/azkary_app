<br clear="both">
<a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com?font=Protest+Guerrilla&weight=900&size=45&pause=1000&color=F78918&width=835&height=100&lines=فَاذْكُرُونِي+أَذْكُرْكُمْ+%F0%9F%98%8A%E2%9C%8C%EF%B8%8F" alt="Typing SVG" /></a>
<br clear="both">

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.0-blue.svg)](https://flutter.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Azkary** is a comprehensive Flutter-based application designed to enhance the spiritual experience of users by providing features such as prayer times, azkar, and a user-friendly interface. With a focus on usability and aesthetics, Azkary integrates customizable themes and notification settings to offer a personalized experience for all users.

---

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Usage](#usage)
- [Setup Awesome Notifications](#setup-awesome-notifications)
- [API for Prayer Times](#api-for-prayer-times)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **User Authentication**: Secure login and registration to manage user accounts.
- **Prayer Times**: Display accurate prayer times based on the user's location.
- **Azkar Access**: Quick access to daily prayers and the ability to manage reminders.
- **Customizable Themes**: Light and dark themes to enhance user experience.
- **Local Storage**: Persistent storage of user preferences using Shared Preferences.
- **Notification System**: Utilize Awesome Notifications for timely reminders and alerts.

## Getting Started

To run the Azkary app locally, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/azkary_app.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd azkary_app
   ```

3. **Install Required Dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the Application**:
   ```bash
   flutter run
   ```

## Installation

Ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine, along with a compatible IDE (such as Android Studio or Visual Studio Code). Follow the installation guide provided by Flutter for a comprehensive setup.

## Usage

Upon launching the application, users will find an intuitive interface with a bottom navigation bar for seamless navigation among different sections:

- **Home Screen**: View prayer times and relevant religious information.
- **Azkar Screen**: Access daily prayers and manage notification settings.
- **Sabha Screen**: Keep track of tasbeeh counters.
- **Settings Screen**: Customize themes and configure application settings.

## Setup Awesome Notifications

To set up Awesome Notifications in your Flutter project, follow these steps:

1. **Add Dependency**: Open your `pubspec.yaml` file and add the Awesome Notifications package:
   ```yaml
   dependencies:
     awesome_notifications: ^0.0.0  # Replace with the latest version
   ```

2. **Initialize Notifications**: Ensure you initialize Awesome Notifications in your `main.dart` file:
   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await AwesomeNotifications().initialize(
       'resourceKey',
       [
         NotificationChannel(
           channelKey: 'basic_channel',
           channelName: 'Basic notifications',
           channelDescription: 'Notification channel for basic tests',
           defaultColor: Color(0xFF9D50b6),
           ledColor: Colors.white,
         )
       ],
     );
     runApp(MyApp());
   }
   ```

3. **Request Permissions**: Ensure you request the necessary permissions for notifications:
   ```dart
   AwesomeNotifications().createNotification(
     content: NotificationContent(
       channelKey: 'basic_channel',
       title: 'Hello Awesome Notifications!',
       body: 'This is a notification example.',
     ),
   );
   ```

4. **Use Notifications**: Utilize the notification manager to send reminders for azkar and prayer times.

## API for Prayer Times

To fetch prayer times from an external API, follow these steps:

1. **Add HTTP Package**: Add the HTTP package to your `pubspec.yaml` file:
   ```yaml
   dependencies:
     http: ^0.13.3  # Replace with the latest version
   ```

2. **API Implementation**: Create a service class to handle API calls. Below is an example of fetching prayer times:
   ```dart
   import 'package:http/http.dart' as http;
   import 'dart:convert';

   class PrayerTimeService {
     static const String apiUrl = 'https://api.aladhan.com/v1/timings';

     Future<Map<String, dynamic>> fetchPrayerTimes(double latitude, double longitude) async {
       final response = await http.get(Uri.parse('$apiUrl?latitude=$latitude&longitude=$longitude'));
       
       if (response.statusCode == 200) {
         return json.decode(response.body);
       } else {
         throw Exception('Failed to load prayer times');
       }
     }
   }
   ```

3. **Use the Service**: Call this service in your `PrayerTimesCubit` or wherever you handle state management to retrieve and display prayer times.

## Theming Mode

The Azkary app includes a theming mode that allows users to switch between light and dark themes. The implementation utilizes the `ThemeCubit` class for managing theme states.

### Implementation Steps:

1. **ThemeCubit Class**: The `ThemeCubit` manages the theme mode using the BLoC pattern. It saves the user's theme preference using Shared Preferences.

   ```dart
   import 'package:azkary_app/core/local_storage/shared_preferences_manager.dart';
   import 'package:flutter/material.dart';
   import 'package:flutter_bloc/flutter_bloc.dart';

   enum AppTheme { light, dark }

   class ThemeCubit extends Cubit<ThemeMode> {
     static const String _themeKey = "theme_mode";

     ThemeCubit() : super(ThemeMode.light);

     Future<void> loadTheme() async {
       final themeIndex = await SharedPreferencesManager.getData(key: _themeKey);
       if (themeIndex != null) {
         emit(ThemeMode.values[themeIndex]);
       } else {
         emit(ThemeMode.light);
       }
     }

     Future<void> toggleTheme(AppTheme theme) async {
       if (theme == AppTheme.dark) {
         emit(ThemeMode.dark);
         await SharedPreferencesManager.setData(
           key: _themeKey,
           value: ThemeMode.dark.index,
         );
       } else {
         emit(ThemeMode.light);
         await SharedPreferencesManager.setData(
           key: _themeKey,
           value: ThemeMode.light.index,
         );
       }
     }
   }
   ```

2. **Load and Toggle Theme**: Integrate the `loadTheme` and `toggleTheme` methods in your settings screen to allow users to switch themes.

3. **Update UI**: Use the `BlocBuilder` to rebuild the UI based on the current theme mode.
## Folder Structure

The project is organized as follows:

```
azkary_app/
├── lib/
│   ├── core/
│   │   ├── local_storage/
│   │   ├── notification_helper/
│   │   └── theming/
│   ├── features/
│   │   ├── azkar/
│   │   ├── home/
│   │   ├── sabha/
│   │   └── settings/
│   └── main.dart
└── assets/
```

## Contributing

Contributions are highly encouraged! If you would like to contribute to `فَاذْكُرُونِي أَذْكُرْكُمْ`, please follow these steps:

1. **Fork the Repository**.
2. **Create a New Branch**:
   ```bash
   git checkout -b feature/YourFeature
   ```
3. **Commit Your Changes**:
   ```bash
   git commit -m "Add your message"
   ```
4. **Push to the Branch**:
   ```bash
   git push origin feature/YourFeature
   ```
5. **Open a Pull Request**.

## Congratulations

You’ve successfully integrated `"فَاذْكُرُونِي أَذْكُرْكُمْ"` App into your Flutter app! For more advanced features and customization options.

If you found this guide helpful, don’t forget to ⭐ star this repository on GitHub to show your support!

Thank you for reading!
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or inquiries, feel free to reach out:

- **GitHub:** [mohamedmagdy2301](https://github.com/mohamedmagdy2301)
- **Email:** [mohammedmego15@gmail.com](mohammedmego15@gmail.com)


