# Citrus App Mobile

***
Citrus App Mobile is a job finder mobile app developed using Flutter. 

### Built with

* [Flutter](https://flutter.dev/docs)
* [Android Studio](https://developer.android.com/studio)


## Getting Started

Please make sure to have all the mentioned technologies properly installed. 

* [Install Flutter](https://flutter.dev/docs/get-started/install)
* [Install Android Studio](https://developer.android.com/studio/install)

## Installation

1. Run the folllowing command to check the status of Flutter in your system:
```
flutter doctor
```
2. Clone the repository in your computer. 
3. Run the following command to install all the project's dependencies:
```
flutter pub get
```
4. Run the following command to run the project:
```
flutter run
```
## Build

In order to build an Android APK, run the following command from the command line.

```
flutter build apk
```

## Testing

In order to run unit and acceptance tests, execute the following command from the root of the project:

```
flutter test test/<test_file>.dart
```

For more options regarding unit tests, you can execute this command:
```
flutter test --help
```

The process of running the integration tests varies depending on the platform you are testing against. You can test against a mobile platform or the web.

- Testing on Mobile
To test on iOS or Android, launch an Android Emulator, iOS Simulator, or connect your computer to a real iOS / Android device.

Then, run the following command from the root of the project:

```
flutter drive --target=test_driver/app.dart
```

## Contributing

Everyone is welcome to contribute code via pull requests, to file issues on GitHub, to fix bugs that people have filed, to add to our documentation, or to help out in any other way.

## References

(...)
