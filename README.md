# Retro Station

An Android Flutter application intended to become a hub for retro console
emulators, with cloud save synchronization. Emulation and cloud storage are
not implemented yet.

## Development

Install [Flutter 3.35.7](https://docs.flutter.dev/get-started/install) and the
Android SDK, then run:

```sh
flutter pub get
flutter analyze
flutter test
flutter run
```

Connect an Android device or start an Android emulator before running the app.

## CI and delivery

GitHub Actions checks formatting, analysis and tests on pushes and pull
requests, then builds a debug APK and uploads it as a workflow artifact.
Download the artifact from the workflow run to install it on an Android device.
This is not a production release: a release signing configuration and store
deployment must be set up separately.
