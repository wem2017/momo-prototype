# Navigation Options Reference

Configure screen headers — title, background, right buttons, back behavior, and more.

## React Native — setOptions

```tsx
const screenRef = useRef<ScreenRef>(null);

// Set options dynamically
screenRef.current?.setOptions({
  headerTitle: 'Screen Title',
  hiddenBack: false,
  onPressLeftHeader: () => navigation.goBack(),
  onBackHandler: goBack => {
    // Custom back logic
    goBack();
  },
  preventBack: {
    title: 'Leave?',
    description: 'Changes will be lost',
    primary: { title: 'Leave', onPress: () => {} },
    secondary: { title: 'Stay', onPress: () => {} },
  },
  headerRight: {
    useShortcut: true,
    useMore: false,
    useCloseIcon: false,
    tools: [{
      title: { vi: 'Cài đặt', en: 'Settings' },
      items: [{
        icon: '24_settings',
        name: { vi: 'Cài đặt', en: 'Settings' },
        key: 'settings',
        onPress: () => openSettings(),
      }],
    }],
  },
});

// Show/update search header dynamically via ref
screenRef.current?.setSearchHeader({
  placeholder: 'Search...',
  onChangeText: setQuery,
});
```

### ScreenRef Methods

| Method | Signature | Description |
|--------|-----------|-------------|
| `setOptions` | `(params: NavigationOptions) => void` | Update header options dynamically |
| `setSearchHeader` | `(params: SearchHeaderProps) => void` | Show/update the search header |

### NavigationOptions Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `headerTitle` | `string \| HeaderTitleProps` | — | Header title (string or custom type) |
| `hiddenBack` | `boolean` | `false` | Hide back button |
| `onPressLeftHeader` | `() => void` | — | Custom left button handler |
| `onBackHandler` | `(goBack: () => void) => void` | — | Intercept back navigation |
| `preventBack` | `PopupNotifyProps` | — | Show confirmation dialog on back |
| `headerRight` | `HeaderRightToolkit \| OnBoarding` | — | Right header configuration |

Also extends `StackNavigationOptions` from `@react-navigation/stack` (supports `headerStyle`, `headerTintColor`, `headerTransparent`, etc.)

---

## Header Title Types

### Default (string)

```tsx
screenRef.current?.setOptions({ headerTitle: 'My Screen' });
```

### User Title

Shows avatar, name, subtitle, verification icons.

```tsx
screenRef.current?.setOptions({
  headerTitle: {
    type: 'user',
    data: {
      title: 'John Doe',
      subTitle: 'Online',
      image: 'https://avatar.url',     // string or string[]
      dotColor: '#4CAF50',              // status indicator
      icons: ['https://verified.icon'], // verification badges
      tintColor: theme.colors.text.default,
      onPress: () => openProfile(),
      isLoading: false,                 // show skeleton
    },
  },
});
```

| Prop | Type | Description |
|------|------|-------------|
| `title` | `string` | User name (required) |
| `subTitle` | `string` | Subtitle text |
| `image` | `string \| string[]` | Avatar URL(s) |
| `dotColor` | `string` | Status dot color |
| `icons` | `string[]` | Verification badge URLs |
| `tintColor` | `string` | Text tint color |
| `onPress` | `() => void` | Tap handler |
| `isLoading` | `boolean` | Show skeleton placeholder |
| `verify` | `boolean` | Deprecated — use `icons` instead |

### Location Title

Shows location name with dropdown chevron.

```tsx
screenRef.current?.setOptions({
  headerTitle: {
    type: 'location',
    data: {
      location: 'Ho Chi Minh City',
      description: 'Current location',
      tintColor: theme.colors.text.default,
      onPress: () => openLocationPicker(),
      isLoading: false,
    },
  },
});
```

### Journey Title

Shows start/end points with directional icon.

```tsx
screenRef.current?.setOptions({
  headerTitle: {
    type: 'journey',
    data: {
      start: 'District 1',
      end: 'District 7',
      description: '12 km',
      icon: '16_arrow_right',
      iconColor: theme.colors.primary,
      tintColor: theme.colors.text.default,
      onPress: () => editJourney(),
      isLoading: false,
    },
  },
});
```

---

## Header Right

### Toolkit (default)

Shows help center + home/close buttons. Optionally adds shortcut pin and more menu.

```tsx
headerRight: {
  useShortcut: true,        // show pin/star or more icon
  useMore: false,           // force show more icon (overrides tool count)
  useCloseIcon: false,      // use X icon instead of home
  preventClose: { ... },    // confirm before close (PopupNotifyProps)
  tools: [
    {
      title: { vi: 'Nhóm', en: 'Group' },
      items: [
        {
          icon: '24_share',
          name: { vi: 'Chia sẻ', en: 'Share' },
          key: 'share',
          showBadge: false,
          onPress: () => shareScreen(),
        },
      ],
    },
  ],
}
```

**Tool menu behavior:**
- 0 tools → shows only help + close
- 1 tool → shows single tool icon directly
- 2+ tools → shows `...` more menu
- `useMore: true` → forces `...` icon regardless of tool count

### OnBoarding

Shows a skip/action button text in the header right.

```tsx
headerRight: {
  useOnBoarding: true,
  buttonOnBoarding: 'Skip',  // custom button label (default: translated 'skip')
  onPress: () => skipOnboarding(),
}
```

| Prop | Type | Description |
|------|------|-------------|
| `useOnBoarding` | `boolean` | Enable onboarding mode |
| `onPress` | `() => void` | Button press handler |
| `buttonOnBoarding` | `string` | Custom button label (defaults to translated 'skip') |

---

## Header Background

Configured via `Screen` component props, not `setOptions`.

```tsx
<Screen
  ref={screenRef}
  navigation={navigation}
  headerType="default"         // 'default' | 'extended' | 'none'
  useShadowHeader={true}       // shadow below header
  headerBackground="https://bg.png" // custom background image
  animatedHeader={{            // header collapses on scroll
    headerTintColor: '#FFFFFF',
    headerTitle: 'Animated Title',
    component: (props) => <CustomHeader {...props} />,
  }}
/>
```

### Header Types

| Type | Description |
|------|-------------|
| `'default'` | Standard header with title + back |
| `'extended'` | Taller header, supports search and collapse animation |
| `'none'` | No header |

### Search Header

Integrate search bar into the header.

```tsx
<Screen
  headerType="extended"
  inputSearchProps={{
    placeholder: 'Search...',
    onChangeText: setQuery,
    headerRightWidth: 74,
    leftPosition: 48,
    hiddenBack: false,
    buttonText: 'Cancel',                  // cancel button label (default: 'Huỷ')
    onPressButtonText: () => clearSearch(), // cancel button handler
    renderButtons: () => <FilterButton />,
  }}
  inputSearchRef={searchRef}
/>
```

### SearchHeaderProps

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `placeholder` | `string` | — | Search input placeholder |
| `onChangeText` | `(text: string) => void` | — | Text change handler |
| `headerRightWidth` | `0 \| 74 \| 110 \| number` | `74` | Right header area width |
| `leftPosition` | `12 \| 48 \| number` | — | Left position offset |
| `hiddenBack` | `boolean` | — | Hide back button |
| `buttonText` | `string` | `'Huỷ'` | Cancel button label |
| `onPressButtonText` | `() => void` | — | Cancel button press handler |
| `renderButtons` | `() => ReactNode` | — | Custom buttons next to search |

---

## Design Spec `header` → React Native Code Mapping

When generating code from a design spec JSON, the `header.props` must be split across **two code targets**. Putting a prop in the wrong target produces broken headers.

### Target 1: `<Screen>` component props (JSX)

These control visual appearance and go directly on the Screen component.

| Spec `header.props` field | Screen prop | Example |
|---------------------------|------------|---------|
| `headerType` | `headerType` | `headerType="extended"` |
| `headerBackground` | `headerBackground` | `headerBackground="https://bg.png"` |
| `useShadowHeader` | `useShadowHeader` | `useShadowHeader={true}` |
| `layoutOffset` | `layoutOffset` | `layoutOffset={-56}` |
| `headerRightWidth` | `headerRightWidth` | `headerRightWidth={110}` |

### Target 2: `screenRef.current?.setOptions()` (imperative, in useEffect)

These control content/behavior and must be set via ref.

| Spec `header.props` field | setOptions prop | Transform |
|---------------------------|----------------|-----------|
| `useBack` | `hiddenBack` | **Invert**: `useBack: true` → `hiddenBack: false` |
| `headerTitle` | `headerTitle` | Pass object as-is: `{ type, data }` |
| `headerRight` | `headerRight` | Pass object as-is |

### Complete Spec → Code Example

**Spec:**

```json
{
  "header": {
    "type": "Header",
    "props": {
      "useBack": true,
      "headerType": "extended",
      "headerTitle": {
        "type": "user",
        "data": { "title": "{name}", "subTitle": "{phone}", "image": "{avatar}" }
      },
      "headerRight": {
        "useShortcut": false,
        "useMore": false,
        "useCloseIcon": false,
        "tools": [
          {
            "title": { "vi": "Tiện ích", "en": "Tools" },
            "items": [
              { "icon": "24_help_center", "name": { "vi": "Trợ giúp", "en": "Help" }, "key": "help" },
              { "icon": "24_home", "name": { "vi": "Trang chủ", "en": "Home" }, "key": "home" }
            ]
          }
        ]
      }
    }
  }
}
```

**Generated code:**

```tsx
const screenRef = useRef<ScreenRef>(null);

// Target 2: setOptions in useEffect
useEffect(() => {
  screenRef.current?.setOptions({
    hiddenBack: false,  // useBack: true → inverted
    headerTitle: {
      type: 'user',
      data: { title: name, subTitle: phone, image: avatar },
    },
    headerRight: {
      useShortcut: false,
      useMore: false,
      useCloseIcon: false,
      tools: [
        {
          title: { vi: 'Tiện ích', en: 'Tools' },
          items: [
            { icon: '24_help_center', name: { vi: 'Trợ giúp', en: 'Help' }, key: 'help' },
            { icon: '24_home', name: { vi: 'Trang chủ', en: 'Home' }, key: 'home' },
          ],
        },
      ],
    },
  });
}, []);

// Target 1: Screen props in JSX
<Screen
  ref={screenRef}
  navigation={navigation}
  headerType="extended"           // from spec headerType
  scrollable
>
  {/* body */}
</Screen>
```

---

## Compose — setOptions

```kotlin
val navigation = LocalNavigation.current

LaunchedEffect(Unit) {
    navigation.setOptions(
        headerTitle = HeaderTitle.Default("Screen Title"),
        headerType = HeaderType.Default(),
        headerRight = HeaderRight.Toolkit(),
        hiddenBack = false,
        scrollData = ScrollData(scrollState = lazyListState),
        backgroundColor = null,
        tintColor = null,
        footerComponent = { FooterContent() },
        floatingButtonProps = FloatingButtonProps(
            icon = "ic_plus",
            label = "Add",
            onClick = { },
        ),
        onBackHandler = { },
    )
}
```

### setOptions Parameters

| Param | Type | Description |
|-------|------|-------------|
| `headerTitle` | `HeaderTitle` | `HeaderTitle.Default("Title")` |
| `headerType` | `HeaderType` | See header types below |
| `headerRight` | `HeaderRight` | `HeaderRight.Toolkit()` |
| `hiddenBack` | `Boolean` | Hide back button |
| `scrollData` | `ScrollData` | Scroll state for header collapse |
| `backgroundColor` | `Color?` | Custom background color |
| `tintColor` | `Color?` | Header tint color |
| `footerComponent` | `@Composable () -> Unit` | Footer content |
| `floatingButtonProps` | `FloatingButtonProps?` | Floating action button |
| `onBackHandler` | `(() -> Unit)?` | Custom back handler |

### Compose Header Types

| Type | Description |
|------|-------------|
| `HeaderType.Default()` | Standard header with title + back |
| `HeaderType.Extended()` | Larger header (supports search) |
| `HeaderType.Animated()` | Collapses on scroll |
| `HeaderType.None` | No header |

### ScrollData

```kotlin
ScrollData(scrollable = true)                    // basic scrollable
ScrollData(scrollState = lazyListState)          // triggers header collapse
```
