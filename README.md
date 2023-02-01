BOILERPLATE FLUTTER APP
==============================================

# 🛠 Built With

- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) - The blueprint for a modular system, which strictly follows the design principle called separation of concerns.
- [Dependency Injection (get_it)](https://pub.dev/packages/get_it) -  Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App.
- [Melos](https://melos.invertase.dev) - a CLI tool used to help manage Dart projects with multiple packages.
- [State Management (BLoC)](https://bloclibrary.dev) - Business logic component to separate the business logic with UI
- [Retrofit](https://pub.dev/packages/retrofit) - a type conversion dio (type-safe HTTP client) client generator.  

# 🍴 Requirements

- Flutter SDK Version: >= 3.0.0
- Dart SDK Version: >= 2.17.0

# 📦 Getting started

Install [Melos](https://melos.invertase.dev) as a global package

```base
dart pub global activate melos
```

Run melos bootstrap & generate dart code

```base
melos bootstrap

melos run build:runner
```

# 👨‍🦯 Working flow

## Assets

- Add your assets at `assets/images` or `assets/icons`
- Run cmd to generate define image path

```base
melos run image:gen
```

- Using by import from common/constants/images.dart

## Generate JSON to DART class

- Using [Json To Dart Extension](https://marketplace.visualstudio.com/items?itemName=hirantha.json-to-dart)
- To customize your classes is very easy. If you want fast to create a simple class then just click enter continue to skip all methods. Otherwise, build your own. To generate Freezed class and Json Serializable choose Code Generation. Of course, you can set up your configuration in the Settings/Extensions/JSON To Dart Model
- Step:
  - Copy your json to clipboard
  - `Cmd + Shift + P` => Select `JSON to Dart: From Clipboard to Code Generation Class`
  - Select folder wanna save model

## REST API using [Retrofit](https://pub.dev/packages/retrofit)

- Create Class @RestApi at `data/remote/***`
- Define method
- Generate `flutter pub run build_runner build --delete-conflicting-outputs`

# 🚀  Release to QC and Publish store process

Build App using [Fastlane](https://fastlane.tools/) and upload to [AppCenter](https://appcenter.ms) for test.

Please install [Fastlane](https://fastlane.tools/) & [AppCenter CLI](https://learn.microsoft.com/vi-vn/appcenter/cli/) before using build command.

Build Android & Upload AppCenter run:

```base
melos run build:android <env>
```

Build iOS & Upload AppCenter run:

```base
melos run build:ios <env>
```

env args follow:

- dev
- uat
- prod

# 📌  Git commit naming convention syntax

## Allowed values

- feat (new feature for the user, not a new feature for build script)
- fix (bug fix for the user, not a fix to a build script)
- docs (changes to the documentation)
- style (formatting, missing semi colons, etc; no production code change)
- refactor (refactoring production code, eg. renaming a variable)
- test (adding missing tests, refactoring tests; no production code change)
- chore (updating grunt tasks etc; no production code change)

## Commit rules

- Commit Related Changes
- Commit Often
- Don’t Commit Half-Done Work
- Test Before You Commit
- Write Good Commit Messages
- Agree on a Workflow

<br />
