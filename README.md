# Flutter Provider Application Starter


A new Flutter application starter bundled with Provider package for state management.


## 1. Getting started
In order to use this starter in your project, do the following step-by-step:

**1. Clone this repo to your folder:**

`git clone https://gitlab.extrawest.com/andriy.gulak/flutter-provider-application-starter.git`

**2. Change directory to the previously cloned folder**

`cd flutter-provider-application-starter/ `

**3. Remove existing .git folder**

`rm -rf .git `

**4. Initialize empty folder with git**

`git init`

**5. Set remote url to your empty repository**

`git remote set-url origin https://gitlab.extrawest.com/user.name/your_empty_repository.git`

**6. Add all files to git**

`git add .`

**7. Commit all the files with 'initial commit' commit message**

`git commit -m "initial commit"`

**8. Push to remote repository**

`git push -u origin master`


## 2. [Change the app name, package name and bundleId (Android & iOS)](https://gitlab.extrawest.com/internal/knowledge-base/-/blob/master/mobile-dev/flutter/tips_and_tricks.md#change-the-app-name-package-name-and-bundleid-android-ios)

## Implemented Features

- Provider state sharing and state managing solution
- Fully featured localization / internationalization (i18n):
    - Pluralization support
    - Static keys support with automatic string constants generation using the following command:
        - `flutter pub run build_runner build --delete-conflicting-outputs`
    - Supports both languageCode (en) and languageCode_countryCode (en_US) locale formats
    - Automatically save & restore the selected locale
    - Full support for right-to-left locales
    - Fallback locale support in case the system locale is unsupported
    - Supports both inline or nested JSON      
- NOSQL database integration (SEMBAST)
- Light/Dark theme configuration
- Dynamic Themes changing using Provider
- Automatic font selection based on the thickness of the glyphs applied.
- API client configuration
- DEV/STAGE/PROD application configuration
- Static analysis tool integration (pedantic linter package)
- Common widgets sharing and reusing example

  
---
Created by @andriy.gulak
[Extrawest.com](https://www.extrawest.com), 2020
---

