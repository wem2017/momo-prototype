# Bottom Tab Navigation

## React Native — BottomTab

The `BottomTab` component from `@momo-kits/foundation` wraps `@react-navigation/bottom-tabs` with KitX styling.

```tsx
import { BottomTab } from '@momo-kits/foundation';

<BottomTab
  navigation={navigation}
  initialRouteName="Home"
  tabs={[
    {
      name: 'Home',
      label: 'Home',
      icon: 'ic_home',
      screen: HomeScreen,
      options: { headerTitle: 'Home' },
    },
    {
      name: 'Search',
      label: 'Search',
      icon: 'ic_search',
      screen: SearchScreen,
      options: { headerTitle: 'Search' },
    },
    {
      name: 'Profile',
      label: 'Profile',
      icon: 'ic_profile',
      badgeLabel: '3',
      screen: ProfileScreen,
      options: { headerTitle: 'Profile' },
    },
  ]}
  floatingButton={{
    icon: 'ic_plus',
    label: 'New',
    onPress: () => handleNewAction(),
  }}
/>
```

### BottomTab Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `tabs` | `BottomTabItemProps[]` | required | Array of tab configurations |
| `navigation` | `NavigationProps` | required | Navigation object from parent |
| `initialRouteName` | `string` | — | Initially focused tab name |
| `nested` | `boolean` | — | Whether tabs use shared parent stack or independent NavigationContainer |
| `listeners` | `{ tabPress?, focus?, blur? }` | — | Event listeners for tab events |
| `floatingButton` | `FloatingButtonProps` | — | Center floating action button |

### BottomTabItemProps

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `name` | `string` | required | Tab route identifier |
| `label` | `string` | required | Tab bar display label |
| `icon` | `string` | required | Icon source string |
| `screen` | `React.ComponentType` | required | Tab content component |
| `options` | `NavigationOptions` | required | Navigation options for this tab |
| `badgeLabel` | `string \| number` | — | Badge: `""` = dot, `"3"` = count, `0` = hidden |
| `showDot` | `boolean` | — | Legacy prop (dot behavior is controlled by `badgeLabel=""`) |
| `initialParams` | `any` | — | Initial params passed to the tab screen |

### FloatingButtonProps

| Prop | Type | Description |
|------|------|-------------|
| `icon` | `string \| ReactNode` | FAB icon (required) |
| `label` | `string` | FAB label (required) |
| `onPress` | `() => void` | Click handler (required) |
| `container` | `ReactNode` | Custom container component |

### Tab Bar Details

- Icon size: 28px
- Animated indicator pill: 44px wide, centered in selected tab
- Tab transitions: fade + scale (200ms)
- Supports badges (dot via `badgeLabel=""` and count via `badgeLabel="3"`)

---

## Compose

```kotlin
import vn.momo.kits.navigation.bottomtab.BottomTab
import vn.momo.kits.navigation.bottomtab.BottomTabItem
import vn.momo.kits.navigation.bottomtab.BottomTabFloatingButton

BottomTab(
    items = listOf(
        BottomTabItem(
            name = "home",
            label = "Home",
            icon = "ic_home",
            screen = { HomeScreen() },
            options = NavigationOptions(
                headerTitle = HeaderTitle.Default("Home"),
            ),
        ),
        BottomTabItem(
            name = "search",
            label = "Search",
            icon = "ic_search",
            screen = { SearchScreen() },
        ),
        BottomTabItem(
            name = "profile",
            label = "Profile",
            icon = "ic_profile",
            showDot = true,
            badgeLabel = "3",
            screen = { ProfileScreen() },
        ),
    ),
    floatingButton = BottomTabFloatingButton(
        icon = "ic_plus",
        label = "New",
        onPress = { handleNewAction() },
    ),
)
```

### BottomTabItem

| Prop | Type | Description |
|------|------|-------------|
| `name` | String | Tab identifier |
| `label` | String | Tab bar label |
| `icon` | String | Icon source string |
| `showDot` | Boolean | Show notification dot (default: false) |
| `badgeLabel` | String? | Badge text (null = no badge, "0" = hidden) |
| `screen` | @Composable () -> Unit | Tab content |
| `options` | NavigationOptions? | Navigation config for this tab |

### BottomTabFloatingButton

| Prop | Type | Description |
|------|------|-------------|
| `icon` | String | FAB icon |
| `label` | String | FAB label |
| `onPress` | () -> Unit | Click handler |

The floating button appears centered between tabs with a curved container.

### Tab Bar Details

- Height: 64dp
- Animated indicator bar follows selected tab
- Supports badges (dot and count)
- Tab transitions: fade + scale (200ms)
