# Flutter Provider Application Starter


A new Flutter application starter bundled with Provider package for state management.

## Implemented Features

- Provider state sharing and state managing solution
- Fully featured localization / internationalization (i18n):
    - Pluralization support
    - Static keys support with automatic string constants generation using the following command:
        - `flutter pub run build_runner build --delete-conflicting-outputs`
    - Supports both languageCode (en) and languageCode_countryCode (en_US) locale formats
    - **(in progress...)** Automatically save & restore the selected locale with a simple implementation
    - Full support for right-to-left locales
    - Fallback locale support in case the system locale is unsupported
    - Supports both inline or nested JSON      
- NOSQL database integration (SEMBAST)
- Light/Dark theme configuration
- Dynamic Themes changing using Provider
- Automatic font selection based on the thickness of the glyphs applied.
- **(in progress...)** API client configuration
- **(in progress...)** DEV/STAGE/PROD application configuration
- Common widgets sharing and reusing example

  
---
Created by @andriy.gulak
[Extrawest.com](https://www.extrawest.com), 2020
---
