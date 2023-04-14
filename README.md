# Flutter Structured Template

<p align="center">
<img src="https://user-images.githubusercontent.com/51419598/152648731-567997ec-ac1c-4a9c-a816-a1fb1882abbe.png" width="150">
</p>

![](https://img.shields.io/github/license/farhazalam/flutter_structured_template) ![](https://img.shields.io/badge/Flutter-3.7.11-0dc7fa) ![](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS-success) ![](https://img.shields.io/badge/Dependencies%20Updated-13%2F04%2F2023-green) ![](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Ftwitter.com%2Ffarhazalam)

---

### Purpose

This is a starter template for Flutter which uses the best practices and a uniform folder structure. Anyone can use this template to avoid the boilerplates necessary for a folder structure like this.

---

### Features

- Support for localization.
- Integrated Dark and Light mode toggle.
- Works on both iOS and Android.
- State Management (Provider/Bloc from respective branches).
- Included Dependency Injection (Get it).
- Router Management (Go Router).
- Extension for size util which provides values like device width and height.
- Firebase integrated with Messaging, Analytics and Crashlytics.
- Environment Variables support for Local/Dev/Prod.
- Alerts snackbar modules for info, success and error that can be accessed from anywhere.

---

### Firebase Configuration

1. Install the FlutterFire CLI from Command Prompt/Terminal using the below commands:
   `dart pub global activate flutterfire_cli`
2. Select the firebase project and platforms using:
   `flutterfire configure`

**Or you can also refer to the Official FlutterFire documentation for more help using the link [FlutterFire Documentation](https://firebase.flutter.dev/docs/overview/)**

---

## Using this Starter Template

The best way to use this template is by following the steps below:

1. Create a new Flutter project.
2. Copy lib folder, .env, enviroment folder, l10n.yaml and assets folders to your newly created Flutter project.
3. Copy the pubspec.yaml file for all the packages.
4. Configure firebase by following the above mentioned commands.
5. Change minSdkVersion from android/app/build.gradle to 21.
6. Look for changes in android/app/src/main/AndroidManifest.xml and paste accordingly.
7. Configure notification icon and notification icon background color by copying and modifying from below:
   a. android/app/src/main/res/drawable/notification_logo.png.
   b. android/app/src/main/res/values/color.xml.

After following the above steps you are good to go.

### Notes:

After following the steps from above, you will still recieve some errors from IDE in the locale folders. Ignore that and run the app anyway. After the first run, it will be gone.

---

##### In case of any Query, you can always contact me on :

[Facebook](https://www.facebook.com/farhazalam786) [Twitter](https://twitter.com/farhazalam) [Linkedin](https://www.linkedin.com/in/farhazalam/) [Email](mailto:farhazalam@gmail.com)

---
