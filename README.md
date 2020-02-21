# Flutter Provider Application Starter


A new Flutter application starter bundled with Provider package for state management.

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

