# TabView

## React Native

```tsx
import { TabView } from '@momo-kits/tab-view';

<TabView
  tabs={[
    { title: 'Tab 1', component: <Tab1 /> },
    { title: 'Tab 2', component: <Tab2 />, icon: '24_info', badgeValue: 3 },
    { title: 'Tab 3', component: <Tab3 />, showDot: true, dotSize: 'small' },
  ]}
  scrollable={false}
  type="default"
  initialPage={0}
  onPressTabItem={(index) => {}}
  direction="row"
  selectedColor={theme.colors.primary}
  unselectedColor={theme.colors.text.default}
  fitContent={false}
  style={{}}
  accessibilityLabel="tab_view"
  accessibilityLabelForSelectedCard="selected_tab"
  pagerProps={{
    onPageSelected: (e) => {},
    onPageScroll: (e) => {},
    scrollEnabled: true,
  }}
/>

// Ref — programmatic navigation
const tabViewRef = useRef<TabViewRef>(null);
tabViewRef.current?.goToPage(2);
```

### Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `tabs` | `Tab[]` | `[]` | Array of tab items |
| `scrollable` | `boolean` | `false` | Allow horizontal scroll in tab bar |
| `type` | `'default' \| 'card'` | `'default'` | Tab bar style |
| `initialPage` | `number` | `0` | Initial tab index |
| `onPressTabItem` | `(index) => void` | — | Called when tab is pressed |
| `direction` | `'row' \| 'column'` | `'row'` | Tab content layout direction |
| `selectedColor` | `string` | — | Active tab label/icon color |
| `unselectedColor` | `string` | — | Inactive tab label/icon color |
| `fitContent` | `boolean` | `false` | Wrap content height; disables swipe |
| `pagerProps` | `PagerViewProps` | — | Props passed to underlying PagerView |
| `style` | `ViewStyle` | — | Custom style for tab bar |
| `accessibilityLabel` | `string` | — | Accessibility label |
| `accessibilityLabelForSelectedCard` | `string` | — | Accessibility label for selected tab |

### Tab

| Prop | Type | Description |
|------|------|-------------|
| `title` | `string` | Tab label text |
| `component` | `ReactElement` | Tab content (required) |
| `icon` | `string` | Icon shown beside title |
| `renderIcon` | `(active) => ReactElement` | Custom icon render function |
| `showDot` | `boolean` | Show notification dot on tab |
| `dotSize` | `'small' \| 'large'` | Dot size |
| `badgeValue` | `string \| number` | Badge count on tab |
| `accessibilityLabel` | `string` | Accessibility label for tab |

### Ref

```tsx
import { TabView, TabViewRef } from '@momo-kits/tab-view';

const tabViewRef = useRef<TabViewRef>(null);
tabViewRef.current?.goToPage(2); // programmatically go to page index
```

Package: `@momo-kits/tab-view`

## Compose

```kotlin
import vn.momo.kits.components.TabView
import vn.momo.kits.components.TabViewItem
import vn.momo.kits.components.TabViewType
import vn.momo.kits.components.TabViewDirection

TabView(
    tabs = listOf(
        TabViewItem(title = "Tab 1", content = { Text("Content 1") }),
        TabViewItem(title = "Tab 2", icon = "24_info", badgeValue = "3", content = { Text("Content 2") }),
    ),
    initialPage = 0,
    type = TabViewType.DEFAULT,       // DEFAULT | CARD
    scrollable = false,
    fitContent = false,
    selectedColor = null,
    unselectedColor = null,
    direction = TabViewDirection.ROW, // ROW | COLUMN
    userScrollEnabled = true,
    onPressTabItem = { index -> },
    onPageSelected = { index -> },
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Content | `component` prop | `content` slot |
| Lazy rendering | Built-in | `mutableStateListOf` tracks visited pages |
| Indicator animation | Native | `animateDpAsState` (200ms) |
| Direction | `string` | `TabViewDirection` enum |
| Type | `string` | `TabViewType` enum |
