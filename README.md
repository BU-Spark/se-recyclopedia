# Recyclopedia

Recyclopedia is a muti-platform mobile application that helps people to understand recycling information. 

This app is aiming to addresses the issue of 
1. Hard to locate the recycle trash bins in school  
2. Not being able to identify the categories of the trash   

 and provide solutions that promote better waste management practices in Boston University’s area.

## Table of Contents
1. [Introduction](#introduction)
2. [Technical Detail](#technical-detail)
3. [Getting Started](#getting-started)
4. [Run The Project](#run-the-project)
5. [Known bugs](#known-bugs)
6. [Risks and Limitations](#risks-and-limitations)
7. [More Information](#more-information)

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

### Dataflow
current dummy data inside [lib/global_configuration.dart](lib/global_configuration.dart)

[lib/providers](lib/providers) get dummy data. they should get data from Strapi API

components gets data from and listens to providers for data updates

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

## Run The Project

First, make sure the environment is set up as instructed from the getting started section. 
To be more specific, make sure that the dianostic from **Flutter Doctor** are resolved properly. 

### Running Project Using VSCode

1. Make sure the vscode extension for [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) and [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) is installed. 

![alt text](./readme_assets/install%20dart%20extension.png)
![alt text](./readme_assets/flutter%20extension.png)

2. Direct to the root directory (if you have not already done so) of the project by running  
`cd src/recyclopedia`

3. Select your environment to run. e.g. If you want to use Android phone to run the project, select an Android phone enmulator. 

4. Click on the top-right trangle to start.

![alt text](./readme_assets/vscode.png)

### Running Project Using Android Studio

1. Direct to the root directory (if you have not already done so) of the project by running  
`cd src/recyclopedia`

2. Add configeration if you haven't done so.
![alt text](./readme_assets/Step%201.png)
![alt text](./readme_assets/Step%202.jpg)

3. Select your environment to run. e.g. If you want to use Android phone to run the project, select an Android phone enmulator. 
![alt text](./readme_assets/Step%203.jpg)

4. Click on the top-right trangle to start.
![alt text](./readme_assets/Step%204.png)

## Known bugs
1. On the navigation rail, quickly switching between the map section and other sections may cause a bug
2. After selecting an trash item, there is a "find bin" button at the bottom of the screen. Clicking that button will redirect the user to the map page, but there is no backward button or navigation rail if the map page is reached in such a way, meaning the user is stuck on the map page.
3. On the home page, for alphabetical categorizing the trash items. Sections will take at least two rows of space even if there are at most one row of contents to display, resulting in extra spaces between sections.

## Risks and Limitations
>This section identifies foreseeable harms and misunderstandings...

This app should not be used to locate the user, it currently lacks the ability to access the location of the user while using the app.

This app is currently in beta, contents displayed are solely for testing purposes. Please regard with caution.

## More Information
More about his project, contact [BU sustainbility](https://www.bu.edu/sustainability/) or [BU Spark!](https://www.bu.edu/spark/)

# build and test locally
```
cd src/recyclopedia
flutter pub get
flutter build web
python3 -m http.server 8000 --directory build/web/
# visit http://localhost:8000/ 
```

# Add Users
To add yourself to the repository, open a Pull Request modifying `COLLABORATORS`, entering your GitHub username in a newline.

All Pull Requests must follow the Pull Request Template, with a title formatted like such `[Project Name]: <Descriptive Title>`
