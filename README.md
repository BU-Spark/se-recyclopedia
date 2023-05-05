# recyclopedia
>This repository contains the app recyclopedia

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
As Boston University strives to become a more sustainable campus, we see a disconnect between the university’s Zero Waste goals and student understanding regarding what is recyclable and what is not.  The main reason for this disconnect is the lack of easily accessible resources to help students sort their waste accurately and confidently. Sustainability@BU has already incorporated the Recyclopedia Resource, which can be found on the Sustainability@BU website, into their list of resources available to students. This resource addresses that disconnect by allowing users to type in an item and telling them whether the item is recyclable or not, as well as what must be done to the item to prepare it for recycling like rinsing out a food container. 
We believe that converting the existing Recyclopedia Resource into an application for waste sorting would be a straightforward way to increase the accuracy of student recycling and help students feel more confident in the decisions they make when sorting waste.

### Flutter documentation
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Technical Detail

### Flutter project folder
[src/recyclopedia](src/recyclopedia)

## Getting Started

### Environment Setup
#### prerequisites
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
This section identifies foreseeable harms and misunderstandings...

## More Information
...

# Add Users
To add yourself to the repository, open a Pull Request modifying `COLLABORATORS`, entering your GitHub username in a newline.

All Pull Requests must follow the Pull Request Template, with a title formatted like such `[Project Name]: <Descriptive Title>`
