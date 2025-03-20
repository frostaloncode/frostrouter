

![FrostRouter Banner](https://raw.githubusercontent.com/frostaloncode/frostrouter/refs/heads/main/images/banner.png)

# Developers
* Sinan UYĞUN - Developer 

# Contact

[![GitHub stars](https://img.shields.io/github/stars/frostaloncode/frostrouter?style=social)](https://github.com/frostaloncode/frostrouter)
[![GitLab stars](https://img.shields.io/gitlab/stars/frosTalon/frostrouter?style=social)](https://gitlab.com/frosTalon/frostrouter)
[![Medium](https://img.shields.io/badge/Medium-Read%20on%20Medium-black?logo=medium)](https://medium.com/@frostalonofficial/flutter-frostrouter-14461f285d91)
[![ORCID](https://img.shields.io/badge/ORCID-FrosTalon-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0009-0002-8592-7958)
[![YouTube](https://img.shields.io/badge/YouTube-Subscribe-red)](https://www.youtube.com/@frosTalonCode)

# Project Details

![Contributors](https://img.shields.io/github/contributors/frostaloncode/frostrouter)
![Version](https://img.shields.io/badge/Version-0.9.1-blue)
[![License: BSD-3-Clause](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Pub.dev](https://img.shields.io/pub/v/frostrouter.svg)](https://pub.dev/packages/frostrouter)
[![Dokümantasyonu Görüntüle](https://img.shields.io/badge/Documentation-v0.9.1-brightgreen.svg)](https://pub.dev/documentation/frostrouter/latest/)
[![GitHub Wiki](https://img.shields.io/badge/Wiki-Available-blue)](https://github.com/frostaloncode/frostrouter/wiki)

# Introduction

What is frostrouter?

FrostRouter is a library that helps you move from one page to another in Flutter projects. It is usually used to manage the transitions between pages. It provides an easier-to-use version of Flutter's default navigation system, helping to create a cleaner and more maintainable code structure. FrostRouter makes in-app routing more flexible and organized.

With customizable structures and less boilerplate code, FrostRouter allows users and developers to manage their applications more efficiently. It also helps make page transitions more controllable and testable.

Why frostrouter?

Flutter's basic navigation system works well for small and simple projects, but it can be hard to use in large projects. Using a library like FrostRouter has these benefits:

* Clean and organized code: 
  
  FrostRouter manages page transitions and redirects from a centralized location. This makes your code more organized and easier to maintain.

* Flexibility: 
    
    You can customize FrostRouter according to the needs of your application. You can make it easier to move data between pages and add custom animations.

* Testability: 
    
    Managing navigation in a centralized point makes it easy to write tests. This makes it easier to create and test your application.

* Complex Routing States: 
    
    When your application needs to redirect users to different pages in different situations, FrostRouter is the ideal tool to manage such complex routing logics.

* Application Management: 
    
    By centralizing your app's routing structure, you can better manage how users navigate through your app and in what order.

Open Source: You can access and support the source code. You can use the codes in your projects according to the rules of the license and support the project.
  
# Installation

Add the following dependencies to your [pubspec.yaml](pubspec.yaml) file:

```yaml
dependencies:
  frostrouter: [latest-version]
```

Include the package using the bash command.

```bash

$ flutter pub add frostrouter

```

# Usage

After you install it, here's how to use Flutter. The package includes three different versions.

## FrostRouter

The version with hex codes verifies the color.

```dart
import 'package:frostrouter/frostrouter.dart';

final frostrouter = frostrouter();

final frostrouter = FrostRouter(
  [
    FrostRoute(
      name: 'page0', 
      path: '/', 
      builder: (context) => PageZero(),
    ),
    FrostRoute(
      name: 'page1', 
      path: '/pageone', 
      builder: (context) => PageOne(),
    ),
    FrostRoute(
      name: 'Page2', 
      path: '/pagetwo', 
      builder: (context) => PageTwo(),
    )
  ]

  void main(){
    runApp(
      MaterialApp.router(
        routerConfig: frostrouter.config,
      )
    );
  }
);
```

## Page Redirection with Path
```dart
frostrouter.frostRoutePath('/pageone');
```

## Page Redirection with Name
```dart
frostrouter.frostRouteName('page0');
```

## Page Redirection with Pop
```dart
frostrouter.frostRoutePop();
```

## Page Redirection with Return
```dart
frostrouter.frostRouteReturn();
```

## Extension

Build Context makes it easy for you to get things done.


```dart
import 'package:frostrouter/src/extension/extension.dart';

context.frostPath('/pagetwo));

context.frostName('pagetwo');

context.frostPop();

context.frostReturn();

```

