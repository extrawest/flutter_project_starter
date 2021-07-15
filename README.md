# Flutter Provider Application Starter


[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/extrawest/flutter_web_app/graphs/commit-activity)
[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://GitHub.com/Naereen/ama)
![Maintaner](https://img.shields.io/badge/maintainer-extrawest.com-blue)
![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)
![GitHub release](https://img.shields.io/github/release/Naereen/StrapDown.js.svg)

A new Flutter application starter bundled with Provider package for state management.


## 1. Getting started
In order to use this starter in your project, do the following step-by-step:

**1. Clone this repo to your folder:**

`git clone https://github.com/extrawest/flutter_project_starter.git`

**2. Change directory to the previously cloned folder**

`cd flutter-provider-application-starter/ `

**3. Remove existing .git folder**

`rm -rf .git `

**4. Initialize empty folder with git**

`git init`

**5. Set remote url to your empty repository**

`git remote set-url origin https://github.com/extrawest/flutter_project_starter.git`

**6. Add all files to git**

`git add .`

**7. Commit all the files with 'initial commit' commit message**

`git commit -m "initial commit"`

**8. Push to remote repository**

`git push -u origin master`


## 2. Change the app name, package name and bundleId (Android & iOS)

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

## TODO
- Add auto read from cache
- Add resolution aware images

---
Created by @andriy.gulak
[Extrawest.com](https://www.extrawest.com), 2021
---

