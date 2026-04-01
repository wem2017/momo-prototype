# React Native Prototype Template

## Template Repository
**Source**: `https://github.com/wem2017/prototype-kits.git`

## Project Structure
```
<project-root>/
├── App.tsx                  # App entry — NavigationContainer setup
├── IPhoneBezel.tsx          # iPhone 14 web preview frame (390x844)
├── index.ts                 # registerRootComponent
├── app.json                 # Expo config
├── package.json             # Dependencies (all @momo-kits/* pre-installed)
├── tsconfig.json            # Path aliases: @/*, @components, @assets, @configs
├── localization/
│   └── language.json        # VI/EN translations
├── assets/                  # App icons, splash screen
└── src/                     # ** ALL generated screens go here **
    └── Welcome.tsx          # Example screen (reference pattern)
```

## App Entry Pattern (`App.tsx`)
```tsx
import {defaultTheme, Localize, NavigationContainer} from "@momo-kits/foundation";
import language from './localization/language.json';
import Welcome from "@/src/Welcome";

export default function App() {
  return (
    <NavigationContainer
      localize={new Localize(language)}
      theme={defaultTheme}
      screen={Welcome}
      maxApi={undefined}
    />
  );
}
```

## Screen Template Pattern (`src/Welcome.tsx`)
Every generated screen should follow this structure:
```tsx
import React, {useEffect, useRef} from 'react';
import {StyleSheet, View} from 'react-native';
import {Colors, NavigationScreenProps, Screen, ScreenRef, Spacing, Text} from '@momo-kits/foundation';

const ScreenName: React.FC<NavigationScreenProps> = ({ navigation }) => {
  const screenRef = useRef<ScreenRef>(null);

  useEffect(() => {
    screenRef.current?.setOptions({
      hiddenBack: false,          // true for root screens
      headerTitle: "Screen Title",
      headerRight: {
        useShortcut: false,
        useMore: false,
        useCloseIcon: false,
        tools: [],
      },
    });
  }, []);

  return (
    <Screen
      ref={screenRef}
      navigation={navigation}
      scrollable
      useGridLayout={false}
      backgroundColor={Colors.black_02}
    >
      {/* Screen content here */}
    </Screen>
  );
};

export default ScreenName;

const styles = StyleSheet.create({
  // styles here
});
```

## Key Setup Details
- **Expo SDK**: 54 | **React Native**: 0.81.5 | **React**: 19.1.0
- **All `@momo-kits/*` v0.157.1-expo.7 packages** pre-installed
- **Path aliases**: `@/*` (root), `@components` (src/components), `@assets` (src/assets), `@configs` (src/configs)
- **Localization**: VI/EN via `localization/language.json`
- **Web preview**: `yarn web` — renders in IPhoneBezel (iPhone 14 frame, 390x844)

