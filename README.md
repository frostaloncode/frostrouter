

![frostrouter Banner](https://raw.githubusercontent.com/frostaloncode/frostrouter/refs/heads/main/images/banner.png)

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
![Version](https://img.shields.io/badge/Version-0.9.0-blue)
[![License: BSD-3-Clause](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Pub.dev](https://img.shields.io/pub/v/frostrouter.svg)](https://pub.dev/packages/frostrouter)
[![Dokümantasyonu Görüntüle](https://img.shields.io/badge/Documentation-v0.9.0-brightgreen.svg)](https://pub.dev/documentation/frostrouter/latest/)
[![GitHub Wiki](https://img.shields.io/badge/Wiki-Available-blue)](https://github.com/frostaloncode/frostrouter/wiki)

# Introduction

What is frostrouter?

It puts the color hex codes into a form that can be used on the flutter. The package includes three different versions.  One version includes hex code checks. The version without an optional hex code checks. The package includes three versions:

* One version includes hex code checks.
* One version doesn't include hex code checks.
* One version doesn't include any functions.

Why frostrouter?

* You can get different versions in a single package.
* Hex code controls are available.
* It's open source.
* It runs quickly.
* The code is simple, and the documentation is easy to understand.
  
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


final colorexample = frostrouter.frostrouter( hex: '#000000');


final stringexample = frostrouter.frostSTRColor( hex: '#000000');
```


## Extension

Build Context makes it easy for you to get things done.


```dart
import 'package:frostrouter/frostrouter.dart';

final stringexample = context.frostSTRColor( hex: '#000000');

final colorexample = context.frostrouter( hex: '#000000');

```

