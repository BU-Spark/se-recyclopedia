# recyclopedia

## Dataflow

current dummy data inside [lib/global_configuration.dart](lib/global_configuration.dart)

[lib/providers](lib/providers) get dummy data. they should get data from Strapi API

components gets data from and listens to providers for data updates

## Table of Contents
1. [Introduction](#introduction)
2. [Risks and Limitations](#risks-and-limitations)
3. [More Information](#more-information)
7. [...](#?)

## Introduction
This repository contains the app recyclopedia...
### Flutter documentation
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Technical Detail

### Flutter project folder
[src/recyclopedia](src/recyclopedia)

## Getting Started

### Environment Setup
Flutter 3.7.3 [installation guide](https://docs.flutter.dev/get-started/install)
```
cd src/recyclopedia/
flutter pub get
flutter run
```

### Important: To run this sample app, you will need an API key.

Get an API key at <https://cloud.google.com/maps-platform/>.

#### Android
Specify your API key in the application manifest
`android/app/src/main/AndroidManifest.xml`:

```xml
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```

#### iOS
Specify your API key in `AppDelegate.swift`:

```swift
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR API KEY HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

#### Web
Add your API key to `web/index.html` in the `<head>` tag:

```
<script src="https://maps.googleapis.com/maps/api/js?key=<YOUR_API_KEY_HERE>"></script>
```

For additional help setting up the plugin, see the plugin's
[README](https://pub.dev/packages/google_maps_flutter)
page.

### Running Project In Differnet IDE

#### Running Project Using VSCode

#### Running Project Using Android Studio



## Risks and Limitations
>This section identifies foreseeable harms and misunderstandings...
This app should not be used to locate the user, it currently lacks the ability to access the location of the user while using the app.

This app is currently in beta, contents displayed are solely for testing purposes. Please regard with caution.

## More Information
...

# Add Users
To add yourself to the repository, open a Pull Request modifying `COLLABORATORS`, entering your GitHub username in a newline.

All Pull Requests must follow the Pull Request Template, with a title formatted like such `[Project Name]: <Descriptive Title>`
