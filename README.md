# Recyclopedia

Recyclopedia is a muti-platform mobile application that helps people to understand recycling information. 

This app is aiming to addresses the issue of 
1. Hard to locate the recycle trash bins in school  
2. Not being able to identify the categories of the trash   

 and provide solutions that promote better waste management practices in Boston University’s area.


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

1. 
2. 
3. 

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

1. Direct to the root directory (if you have not already done so) of the project by running  
`cd src/recyclopedia`

2. Select your environment to run. e.g. If you want to use Android phone to run the project, select an Android phone enmulator. 
![alt text](https://github.com/[username]/[reponame]/blob/[branch]/image.jpg?raw=true)

3. Click on the top-right trangle to start.
![alt text](https://github.com/[username]/[reponame]/blob/[branch]/image.jpg?raw=true)


### Running Project Using Android Studio

1. Direct to the root directory (if you have not already done so) of the project by running  
`cd src/recyclopedia`

2. Add configeration if you haven't done so.
![alt text](./readme_assets/Step%201.jpg)
![alt text](./readme_assets/Step%202.jpg)

3. Select your environment to run. e.g. If you want to use Android phone to run the project, select an Android phone enmulator. 
![alt text](./readme_assets/Step%203.jpg)

4. Click on the top-right trangle to start.
![alt text](./readme_assets/Step%204.jpg)


## Risks and Limitations
This section identifies foreseeable harms and misunderstandings...

## More Information
...

# Add Users
To add yourself to the repository, open a Pull Request modifying `COLLABORATORS`, entering your GitHub username in a newline.

All Pull Requests must follow the Pull Request Template, with a title formatted like such `[Project Name]: <Descriptive Title>`
