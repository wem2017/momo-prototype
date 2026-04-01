# Navigation Setup

## React Native — NavigationContainer

The `NavigationContainer` from `@momo-kits/foundation` is the root entry point that sets up the navigation stack, theme, and context providers.

### NavigationContainerProps

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `screen` | `React.ComponentType<NavigationScreenProps>` | required | Root screen component |
| `maxApi` | `any` | required | MaxApi instance for native bridge |
| `localize` | `LocalizeProps` | required | Localization: `{ getCurrentLanguage, getAssets, translate, translateData, addTranslations }` |
| `theme` | `Theme` | `defaultTheme` | Theme object (light/dark colors, font) |
| `options` | `NavigationOptions` | — | Default navigation options for root screen |
| `initialParams` | `any` | — | Initial params passed to the root screen |
| `features` | `FeatureFlags` | — | Feature flags (see below) |

### FeatureFlags

| Flag | Type | Description |
|------|------|-------------|
| `enableFoundationList` | `boolean` | Enable FoundationList component |
| `enableBottomTabAnimation` | `boolean` | Enable bottom tab animations |
| `enableHapticBottomTab` | `boolean` | Enable haptic feedback on tab press |
| `enableHapticDialog` | `boolean` | Enable haptic feedback on dialog show |
| `showBaseLineDebug` | `boolean` | Show baseline debug overlay |


## Compose — ComposeAppContainer (App Root)

Prefer `ComposeAppContainer` (from parent project — auto KitConfig, Language, IMaxApi via Koin). Fallback to `NavigationContainer`.

```kotlin
// ComposeAppContainer — import from parent project, e.g. vn.momo.compose.container.ComposeAppContainer
ComposeAppContainer(
    initialScreen = { HomeScreen() },
    options = NavigationOptions(headerTitle = HeaderTitle.Default("My App")),
    initialTheme = defaultTheme,
    applicationContext = MiniAppContext(...),
)
```

Fallback — `NavigationContainer`:

```kotlin
NavigationContainer(
    initialScreen = { HomeScreen() },
    initialTheme = defaultTheme,
)
```

## Screen-level Navigation

Inside NavigationContainer scope:

```kotlin
val navigation = LocalNavigation.current
val navigator = LocalNavigator.current

navigation.setOptions(...)   // header, scroll, footer, FAB
navigator.push { DetailScreen() }
navigator.pop()
```

## Best Practices

1. One container per Fragment — don't nest containers
2. Prefer `ComposeAppContainer` over `NavigationContainer`
3. Use `LaunchedEffect(Unit)` for `setOptions` — set options when screen loads
4. Connect scroll state early — `ScrollData(scrollState = lazyListState)` triggers header collapse
5. No padding in `footerComponent` — container provides standard padding

## CompositionLocal Providers

| Provider | Access | Purpose |
|----------|--------|---------|
| `AppTheme` | `AppTheme.current` | Current theme (light/dark) |
| `AppStatusBar` | `AppStatusBar.current` | Status bar height (Dp) |
| `AppNavigationBar` | `AppNavigationBar.current` | Nav bar height (Dp) |
| `ApplicationContext` | `ApplicationContext.current` | MiniApp context |
| `LocalNavigator` | `LocalNavigator.current` | Navigator instance |
| `LocalNavigation` | `LocalNavigation.current` | Screen-level navigation |

## Custom Modifiers

```kotlin
import vn.momo.kits.modifier.*

Modifier.conditional(condition) { background(Colors.pink_03) }
Modifier.activeOpacityClickable(activeOpacity = 0.8f) { onClick() }
Modifier.shadow(color = Colors.black_20.copy(alpha = 0.1f), blurRadius = 16f)
Modifier.setAutomationId("my_component")
```
