# Stack Screen Configuration

## React Native — Screen Component

The `Screen` component from `@momo-kits/foundation` is the outermost container for every screen. It manages the header, scroll, keyboard avoidance, safe areas, and grid layout.

### Screen Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `navigation` | `Navigation` | — | Navigation object (injected by NavigationContainer) |
| `scrollable` | `boolean` | — | Enable scrollable content |
| `headerType` | `HeaderType` | `'default'` | `'default'` \| `'extended'` \| `'none'` |
| `animatedHeader` | `AnimatedHeader` | — | Object: `{ headerTintColor?, component?, headerTitle? }` — collapses on scroll |
| `headerComponent` | `ReactNode` | — | Custom header component |
| `footerComponent` | `ReactNode` | — | Sticky footer component |
| `backgroundColor` | `string` | — | Screen background color |
| `enableKeyboardAvoidingView` | `boolean` | — | Wrap content in KeyboardAvoidingView |
| `keyboardVerticalOffset` | `number` | auto | Override keyboard avoiding offset |
| `floatingButtonProps` | `FloatingButtonProps` | — | `{ icon, label, onPress, container? }` |
| `scrollViewProps` | `ScrollViewProps` | — | Pass-through props for underlying ScrollView |
| `layoutOffset` | `-8 \| -24 \| -56` | `-56` | Card offset overlap with header banner |
| `headerRightWidth` | `0 \| 73 \| 110 \| number` | `73` | Width of the right header area |
| `useGridLayout` | `boolean` | `true` | Apply auto grid spacing to children |
| `inputSearchProps` | `SearchHeaderProps` | — | Animated search header config |
| `inputSearchRef` | `Ref<InputRef>` | — | Ref for the search input |
| `animatedValue` | `Animated.Value` | auto | Inject a custom animated value |
| `useShadowHeader` | `boolean` | `true` | Header shadow |
| `headerBackground` | `string` | — | Custom header background image |
| `trackingParams` | `ScreenTrackingParams` | — | `{ value1?, value2? }` for auto tracking |

### ScreenRef (imperative methods)

```tsx
import { Screen, ScreenRef } from '@momo-kits/foundation';

const screenRef = useRef<ScreenRef>(null);

<Screen ref={screenRef} navigation={navigation} scrollable headerType="default">
  {/* content */}
</Screen>

// Dynamically update header options
screenRef.current?.setOptions({
  headerTitle: 'New Title',
  hiddenBack: false,
  headerRight: { useShortcut: true },
});

// Show/update search header
screenRef.current?.setSearchHeader({
  placeholder: 'Search...',
  onChangeText: setQuery,
});
```

### HeaderType

| Value | Description |
|-------|-------------|
| `'default'` | Standard header with title + back button |
| `'extended'` | Taller header, supports search and collapse animation |
| `'none'` | No header rendered |

### AnimatedHeader

```tsx
animatedHeader={{
  headerTintColor: '#FFFFFF',
  headerTitle: 'Animated Title',          // string | HeaderTitleProps
  component: (props) => <CustomBanner {...props} />,
}}
```

### FloatingButtonProps

| Prop | Type | Description |
|------|------|-------------|
| `icon` | `string \| ReactNode` | FAB icon (required) |
| `label` | `string` | FAB label (required) |
| `onPress` | `() => void` | Click handler (required) |
| `container` | `ReactNode` | Optional custom container |

---

## Compose — Screen-level Configuration

Use `LazyColumn` + `rememberLazyListState()` as the preferred scrollable — triggers header collapse via `ScrollData(scrollState = lazyListState)`.

```kotlin
import vn.momo.kits.navigation.LocalNavigation
import vn.momo.kits.navigation.LocalNavigator
import vn.momo.kits.navigation.ScrollData
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.rememberLazyListState

@Composable
fun MyScreen() {
    val navigation = LocalNavigation.current
    val navigator = LocalNavigator.current
    val lazyListState = rememberLazyListState()

    LaunchedEffect(Unit) {
        navigation.setOptions(
            headerTitle = HeaderTitle.Default("Screen Title"),
            headerType = HeaderType.Default(),
            headerRight = HeaderRight.Toolkit(),
            hiddenBack = false,
            scrollData = ScrollData(scrollState = lazyListState),
            footerComponent = { FooterContent() },
            floatingButtonProps = FloatingButtonProps(icon = "ic_plus", label = "Add", onClick = { }),
        )
    }

    LazyColumn(state = lazyListState) {
        // content
    }
}
```

### setOptions params

```kotlin
navigation.setOptions(
    headerTitle: HeaderTitle,
    headerType: HeaderType,
    headerRight: HeaderRight,
    hiddenBack: Boolean,
    scrollData: ScrollData,
    backgroundColor: Color?,
    tintColor: Color?,
    footerComponent: @Composable () -> Unit,
    floatingButtonProps: FloatingButtonProps?,
    onBackHandler: (() -> Unit)?,
)
```

### HeaderType Options

- `HeaderType.Default()` — standard header with title + back button
- `HeaderType.Extended()` — larger header (supports `inputSearchProps` for animated search)
- `HeaderType.Animated()` — collapses on scroll
- `HeaderType.None` — no header

### ScrollData

```kotlin
ScrollData(scrollable = true)
ScrollData(scrollState = lazyListState)   // triggers header collapse
```

Use `LazyColumn` + `rememberLazyListState()` as preferred scrollable.
