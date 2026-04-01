# Design Spec to Code Mapping

How to translate a design spec JSON into platform code. Read `design-spec-structure.md` first to understand the JSON schema.

---

## React Native

### File & Imports

- `meta.screenName` → file name and default export
- Import design system components from `@momo-kits/foundation` **unless** the component has its own package (see table below)
- Import `View`, `Pressable`, `StyleSheet` from `react-native`
- Import tokens: `Colors`, `Spacing`, `Radius` from `@momo-kits/foundation`

**Separate-package components (RN only — do NOT import these from foundation):**

| Component | RN Package |
|-----------|-----------|
| Avatar | `@momo-kits/avatar` |
| Carousel | `@momo-kits/carousel` |
| Chip | `@momo-kits/chip` |
| Collapse | `@momo-kits/collapse` |
| DatePicker | `@momo-kits/date-picker` |
| Information | `@momo-kits/information` |
| ProgressInfo | `@momo-kits/progress-info` |
| Rating | `@momo-kits/rating` |
| Slider | `@momo-kits/slider` |
| Stepper | `@momo-kits/stepper` |
| Steps | `@momo-kits/step` |
| SuggestAction | `@momo-kits/suggest-action` |
| Swipe | `@momo-kits/swipe` |
| TabView | `@momo-kits/tab-view` |
| Tooltip | `@momo-kits/animated-tooltip` |
| Uploader | `@momo-kits/uploader` |

```tsx
import { Colors, Icon, Screen, ScreenRef, Spacing, Text } from '@momo-kits/foundation';
import { Avatar } from '@momo-kits/avatar';
import { Chip } from '@momo-kits/chip';
import { Pressable, StyleSheet, View } from 'react-native';
```

### `meta` → Component Declaration

```tsx
// meta.screenName → component name
const MoneyTransferScreen: React.FC<NavigationScreenProps> = ({ navigation }) => {
  const screenRef = useRef<ScreenRef>(null);
  // ...
};
export default MoneyTransferScreen;
```

### `components` → Sub-Components

Each blueprint becomes a typed React functional component.

| Spec field | Code target |
|------------|-------------|
| `type` | Component name: `const SecurityBanner: React.FC<Props>` |
| `props` | TypeScript interface |
| `styles` | `StyleSheet.create` entry |
| `children` | JSX children |

**Prop type mapping:**

| Spec type | TypeScript type |
|-----------|----------------|
| `"string"` | `string` |
| `"number"` | `number` |
| `"boolean"` | `boolean` |
| `"function"` | `() => void` |
| `"array"` | `string[]` or typed array |

**Child element mapping:**

| Spec `type` | JSX |
|-------------|-----|
| `"Icon"` | `<Icon source="..." size={24} />` |
| `"Text"` | `<Text typography="...">{children}</Text>` |
| `"View"` | `<View style={...}>{children}</View>` |
| `"Pressable"` | `<Pressable onPress={...}>{children}</Pressable>` |
| Any design system component | `<Component {...props} />` |

**Example:**

```tsx
interface SecurityBannerProps {
  description: string;
  aiLabel: string;
  onPressMore: () => void;
}

const SecurityBanner: React.FC<SecurityBannerProps> = ({
  description, aiLabel, onPressMore,
}) => (
  <View style={styles.securityBanner}>
    <Icon source="24_check_circle" size={24} color={Colors.green_03} />
    <Text typography="body_default_regular" color={Colors.black_17} style={styles.flex1}>
      {description}
    </Text>
    <Tag label={aiLabel} icon="16_sparkle" customColor={Colors.pink_03} size="medium" />
  </View>
);
```

### `header` → Two Code Targets

Header props split across **two targets**. Putting a prop in the wrong target produces broken headers.

**Target 1: `<Screen>` JSX props** — visual appearance

| Spec `header.props` | Screen prop | Example |
|----------------------|------------|---------|
| `headerType` | `headerType` | `headerType="extended"` |
| `headerBackground` | `headerBackground` | `headerBackground="https://bg.png"` |
| `useShadowHeader` | `useShadowHeader` | `useShadowHeader={true}` |

**Target 2: `screenRef.current?.setOptions()` in `useEffect`** — content/behavior

| Spec `header.props` | setOptions prop | Transform |
|----------------------|----------------|-----------|
| `useBack` | `hiddenBack` | **Invert**: `useBack: true` → `hiddenBack: false` |
| `headerTitle` | `headerTitle` | Pass object as-is: `{ type, data }` |
| `headerRight` | `headerRight` | Pass object as-is |

```tsx
const screenRef = useRef<ScreenRef>(null);

useEffect(() => {
  screenRef.current?.setOptions({
    hiddenBack: false,
    headerTitle: {
      type: 'user',
      data: { title: name, subTitle: phone, image: avatar },
    },
    headerRight: {
      useShortcut: false,
      tools: [{ title: { vi: 'Tiện ích', en: 'Tools' }, items: [...] }],
    },
  });
}, []);
```

### `body` → Screen Component

| Spec field | Screen prop |
|------------|-------------|
| `scrollable: true` | `scrollable` |
| `style.backgroundColor` | `backgroundColor={Colors.xxx}` |
| `children` | JSX children inside `<Screen>` |

```tsx
<Screen
  ref={screenRef}
  navigation={navigation}
  headerType="extended"
  scrollable
  backgroundColor={Colors.black_02}
  footerComponent={renderFooter}
>
  <SecurityBanner description={text} />
  <TransferCard amount={amount} />
</Screen>
```

### `footer` → `footerComponent` Prop

`Screen` footer already provides built-in spacing and shadow. **Only Skip `footer.styles` properties `padding`, `margin`, and `backgroundColor`** — they are redundant and will cause double-spacing.

```tsx
<Screen
  footerComponent={
    <Button title={buttonTitle} type="disabled" size="large" full onPress={handleTransfer} />
  }
>
```

- `footer.styles` → **Skip only** `padding`, `margin`, `backgroundColor` (Screen footer handles these). **Apply all other styles** (`flex`, `gap`, `flexDirection`, etc.) to the footer wrapper `View`.
- `footer.children` → render design system or custom components directly as `footerComponent` value
- If footer has a single child → pass it directly (no wrapping `View`)
- If footer has multiple children → wrap in a `View` with remaining styles (excluding padding/margin/backgroundColor)

### `tabs` → `{ScreenName}Tab` Wrapper File

When `tabs` is an object (not `null`), generate a separate `{ScreenName}Tab.tsx` file that wraps the screen in a `BottomTab`.

- `tabs.indexActive` determines which item in `tabs.items` renders the screen from this spec
- Other items reference external screen components by `screen` name
- `initialRouteName` defaults to `items[indexActive].name`
- When `tabs.floatingButton` is not empty (`{}`), map it to the `floatingButton` prop

```tsx
import {
  BottomTab, BottomTabItemProps, FloatingButtonProps, NavigationScreenProps,
} from '@momo-kits/foundation';
import MoneyTransferScreen from './MoneyTransferScreen';
import ScanScreen from './ScanScreen';
import ProfileScreen from './ProfileScreen';

const tabs: BottomTabItemProps[] = [
  {
    name: 'MoneyTransfer',
    label: 'Chuyển tiền',     // from items[].label
    icon: 'ic_transfer',
    screen: MoneyTransferScreen,  // indexActive: 0 → this spec's screen
    options: { title: 'Chuyển tiền' },
  },
  {
    name: 'Profile',
    label: 'Tôi',
    icon: 'ic_profile',
    screen: ProfileScreen,        // non-active → external component
    options: { title: 'Tôi' },
  },
];

// tabs.floatingButton → floatingButton prop
const floatingButton: FloatingButtonProps = {
  icon: 'ic_scan',          // from tabs.floatingButton.icon
  label: 'Quét mọi QR',    // from tabs.floatingButton.label
  onPress: () => {},        // handler to navigate to ScanScreen
};

const MoneyTransferTab: React.FC<NavigationScreenProps> = ({ navigation }) => (
  <BottomTab
    tabs={tabs}
    navigation={navigation}
    initialRouteName="MoneyTransfer"
    nested={false}
    floatingButton={floatingButton}
  />
);
export default MoneyTransferTab;
```

If a referenced `screen` component does not exist, generate a placeholder screen file for it.

### `overlays` → React Components

Each overlay entry generates a typed React component placed before the screen function. The component shape depends on `type`.

#### `type: "Modal"` → modal content component

```json
{
  "overlays": {
    "ConfirmModal": {
      "type": "Modal",
      "barrierDismissible": true,
      "props": { "itemId": "number", "itemName": "string" },
      "content": {
        "type": "PopupNotify",
        "props": {
          "title": "Xác nhận xoá?",
          "description": "Bạn có chắc muốn xoá {itemName}?",
          "primary": { "title": "Xoá", "onPress": "{onRequestClose}" },
          "secondary": { "title": "Huỷ", "onPress": "{onRequestClose}" }
        }
      }
    }
  }
}
```

```tsx
// Generated: ConfirmModal component
interface ConfirmModalProps {
  itemId: number;
  itemName: string;
  onRequestClose?: (callback?: () => void) => void;
}

const ConfirmModal: React.FC<ConfirmModalProps> = ({ itemId, itemName, onRequestClose }) => (
  <PopupNotify
    title="Xác nhận xoá?"
    description={`Bạn có chắc muốn xoá ${itemName}?`}
    primary={{ title: 'Xoá', onPress: () => onRequestClose?.() }}
    secondary={{ title: 'Huỷ', onPress: () => onRequestClose?.() }}
    onRequestClose={onRequestClose}
  />
);
```

- `content.type` = `PopupNotify` or `PopupPromotion` → use the matching component directly
- `content.type` = anything else → render as a custom layout component using the same child-element mapping rules as `components`
- Always inject `onRequestClose?: (callback?) => void` into props — it is provided by the navigator

#### `type: "BottomSheet"` → sheet content component + footer

```json
{
  "overlays": {
    "FilterSheet": {
      "type": "BottomSheet",
      "options": { "title": "Lọc" },
      "surface": true,
      "barrierDismissible": true,
      "draggable": true,
      "props": { "selectedOptions": "array", "onApply": "function" },
      "body": {
        "children": [
          { "type": "Chip", "props": { "label": "Option A", "selected": "{selectedA}", "onPress": "{toggleA}" } },
          { "type": "Chip", "props": { "label": "Option B", "selected": "{selectedB}", "onPress": "{toggleB}" } }
        ]
      },
      "footer": {
        "children": [
          { "type": "Button", "props": { "title": "Áp dụng", "size": "large", "full": true, "onPress": "{onApply}" } }
        ]
      }
    }
  }
}
```

```tsx
// Generated: FilterSheet component (body only — footer goes to footerComponent)
interface FilterSheetProps {
  selectedOptions: string[];
  onApply: () => void;
  onRequestClose?: (callback?: () => void) => void;
}

const FilterSheet: React.FC<FilterSheetProps> = ({ selectedOptions, onApply, onRequestClose }) => {
  const [selectedA, setSelectedA] = useState(false);
  const [selectedB, setSelectedB] = useState(false);
  return (
    <View>
      <Chip label="Option A" selected={selectedA} onPress={() => setSelectedA(v => !v)} />
      <Chip label="Option B" selected={selectedB} onPress={() => setSelectedB(v => !v)} />
    </View>
  );
};
```

- `overlay.body.children` → JSX body of the sheet component (same child-element mapping as `components`)
- `overlay.footer.children` → rendered inline as `footerComponent` in the `showBottomSheet` call (not inside the sheet component)
- Always inject `onRequestClose` into the sheet component props

### `actions` → Handlers

Each action key becomes a handler. The shape determines the generated code.

**All navigation actions use `navigator`** (from `ApplicationContext`), not `navigation`.

```tsx
const { navigator } = useContext(ApplicationContext);
```

#### Simple action (`code`) → direct handler

```json
{ "handleChangeAmount": { "description": "...", "code": "setTransferAmount(value);" } }
```

```tsx
const handleChangeAmount = (value: string) => {
  setTransferAmount(value);
};
```

#### Navigation action (`navigate` + `params`) → `useCallback` with navigator call

```json
{ "handlePressGreetingCard": { "navigate": "push", "params": { "screen": "GreetingCardPickerScreen" } } }
```

```tsx
const handlePressGreetingCard = useCallback(() => {
  navigator.push({ screen: GreetingCardPickerScreen });
}, [navigator]);
```

| `navigate` | Generated call |
|-----------|---------------|
| `"push"` | `navigator.push({ screen: ScreenComponent })` |
| `"present"` | `navigator.present({ screen: ScreenComponent })` |
| `"pop"` | `navigator.pop()` |
| `"popToTop"` | `navigator.popToTop()` |
| `"replace"` | `navigator.replace({ screen: ScreenComponent })` |
| `"reset"` | `navigator.reset({ screen: ScreenComponent })` |

#### Overlay action (`overlay` + `params`) → `useCallback` with `showModal` or `showBottomSheet`

The overlay key is looked up in `overlays`. The `type` field determines which navigator method is called. Props from `params` are spread into the call alongside the overlay's own configuration.

**Modal overlay:**

```json
{
  "handlePressConfirm": {
    "overlay": "ConfirmModal",
    "params": { "itemId": "{currentItemId}", "itemName": "{currentItemName}" }
  }
}
```

```tsx
// overlays.ConfirmModal: type=Modal, barrierDismissible=true
const handlePressConfirm = useCallback(() => {
  navigator.showModal({
    screen: ConfirmModal,
    barrierDismissible: true,   // from overlays.ConfirmModal.barrierDismissible
    itemId: currentItemId,       // from params, variable resolved
    itemName: currentItemName,
  });
}, [currentItemId, currentItemName, navigator]);
```

**BottomSheet overlay:**

```json
{
  "handlePressFilter": {
    "overlay": "FilterSheet",
    "params": { "selectedOptions": "{selectedOptions}", "onApply": "handleApplyFilter" }
  }
}
```

```tsx
// overlays.FilterSheet: type=BottomSheet, options={title:'Lọc'}, surface=true, barrierDismissible=true
const handlePressFilter = useCallback(() => {
  navigator.showBottomSheet({
    screen: FilterSheet,
    options: { title: 'Lọc' },           // from overlays.FilterSheet.options
    surface: true,                         // from overlays.FilterSheet.surface
    barrierDismissible: true,              // from overlays.FilterSheet.barrierDismissible
    draggable: true,                       // from overlays.FilterSheet.draggable
    footerComponent: (                     // from overlays.FilterSheet.footer.children
      <Button title="Áp dụng" size="large" full onPress={handleApplyFilter} />
    ),
    selectedOptions,                       // from params
    onApply: handleApplyFilter,            // from params (handler name resolved to reference)
  });
}, [selectedOptions, handleApplyFilter, navigator]);
```

**Rules for overlay param resolution:**
- `"{variable}"` → resolve to the current state/prop variable (strip `{}`)
- `"handlerName"` (no `{}`) → resolve to the handler function reference
- Overlay config fields (`barrierDismissible`, `surface`, `draggable`, `options`, `onDismiss`) come from the overlay definition, not from `params`
- `footer.children` from the overlay definition → generated inline as `footerComponent` JSX in the navigator call

#### Bottom sheet — stacked with back navigation

When overlay has `leftOptions`, include it in the call:

```tsx
navigator.showBottomSheet({
  screen: SecondSheet,
  options: { title: 'Step 2' },
  leftOptions: {
    iconLeft: 'ic_back_ios',
    onPressIconLeft: () => navigator.pop(),
  },
});
```

### `localization` → Default State Values

Use `vi` locale values as initial state and display strings.

```tsx
const [transferAmount, setTransferAmount] = useState('0');
const recipientName = 'Anh Dũng Hồng';
const quickMessageList = ['Mình chuyển tiền nhé 🤑', 'Em cảm ơn ạ! 🤟'];
```

### `tracking` → Comments

Generate as inline comments near the relevant handler.

```tsx
const handleTransfer = useCallback(() => {
  // tracking: TransferButtonPressed { amount, message, recipientPhone }
  initiateTransfer({ amount, message, recipient });
}, []);
```

### Token Resolution

| Spec token | Code |
|------------|------|
| `"Colors.pink_03"` | `Colors.pink_03` (in JSX: `{Colors.pink_03}`) |
| `"Spacing.L"` | `Spacing.L` (in style: `paddingHorizontal: Spacing.L`) |
| `"Radius.M"` | `Radius.M` (in style: `borderRadius: Radius.M`) |

All tokens import from `@momo-kits/foundation`.

### Variable Resolution

| Spec value | Code |
|------------|------|
| `"{amount}"` | `{amount}` (prop or state in JSX) |
| `"{onPress}"` | `{onPress}` (callback prop) |
| `"{items[0]}"` | `{items[0]}` (array access) |

### Styles

Use `StyleSheet.create` at the bottom of the file. Never inline style objects in JSX — extract to stylesheet.

```tsx
const styles = StyleSheet.create({
  banner: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: Colors.green_08,
    paddingHorizontal: Spacing.L,
    gap: Spacing.S,
  },
});
```

---

## Compose Multiplatform

### File & Imports

- `meta.screenName` → file name and `@Composable` function name
- Import components from `vn.momo.kits.components`
- Import tokens from `vn.momo.kits.const` (Colors, Spacing, Radius, Typography)
- Import navigation from `vn.momo.kits.navigation`

```kotlin
import vn.momo.kits.components.*
import vn.momo.kits.const.Colors
import vn.momo.kits.const.Spacing
import vn.momo.kits.const.Radius
import vn.momo.kits.const.Typography
import vn.momo.kits.navigation.LocalNavigation
import vn.momo.kits.navigation.LocalNavigator
```

### `meta` → Composable Function

```kotlin
@Composable
fun MoneyTransferScreen() {
    val navigation = LocalNavigation.current
    val navigator = LocalNavigator.current
    // ...
}
```

### `components` → Composable Sub-Functions

Each blueprint becomes a `@Composable` function with a data class for props (if more than 2 params).

| Spec field | Code target |
|------------|-------------|
| `type` | Function name: `@Composable fun SecurityBanner(...)` |
| `props` | Function parameters or data class |
| `styles` | `Modifier` chain |
| `children` | Composable children in `Column`/`Row`/`Box` |

**Prop type mapping:**

| Spec type | Kotlin type |
|-----------|-------------|
| `"string"` | `String` |
| `"number"` | `Int` or `Float` |
| `"boolean"` | `Boolean` |
| `"function"` | `() -> Unit` |
| `"array"` | `List<String>` or typed list |

**Style mapping:**

| Spec style | Compose Modifier/Layout |
|------------|------------------------|
| `flexDirection: "row"` | `Row { }` |
| `flexDirection: "column"` (default) | `Column { }` |
| `flex: 1` | `Modifier.weight(1f)` |
| `padding: "Spacing.L"` | `Modifier.padding(Spacing.L)` |
| `paddingHorizontal: "Spacing.L"` | `Modifier.padding(horizontal = Spacing.L)` |
| `paddingVertical: "Spacing.S"` | `Modifier.padding(vertical = Spacing.S)` |
| `gap: "Spacing.S"` | `Arrangement.spacedBy(Spacing.S)` |
| `backgroundColor: "Colors.green_08"` | `Modifier.background(Colors.green_08)` |
| `borderRadius: "Radius.M"` | `Modifier.clip(RoundedCornerShape(Radius.M))` |
| `alignItems: "center"` | `verticalAlignment = Alignment.CenterVertically` (Row) |
| `justifyContent: "center"` | `horizontalArrangement = Arrangement.Center` (Row) |
| `alignSelf: "center"` | `Modifier.align(Alignment.CenterHorizontally)` |

**Child element mapping:**

| Spec `type` | Compose |
|-------------|---------|
| `"Icon"` | `Icon(source = "...", size = 24.dp)` |
| `"Text"` | `Text(text = "...", style = Typography.bodyDefaultRegular)` |
| `"View"` | `Column { }` / `Row { }` / `Box { }` (based on flexDirection in styles) |
| `"Pressable"` | `Modifier.activeOpacityClickable { onClick() }` on a Box/Row |

**Example:**

```kotlin
@Composable
fun SecurityBanner(
    description: String,
    aiLabel: String,
    onPressMore: () -> Unit,
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .background(Colors.green_08)
            .padding(horizontal = Spacing.L, vertical = Spacing.S),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(Spacing.S),
    ) {
        Icon(source = "24_check_circle", size = 24.dp, color = Colors.green_03)
        Text(
            text = description,
            style = Typography.bodyDefaultRegular,
            color = Colors.black_17,
            modifier = Modifier.weight(1f),
        )
        Tag(label = aiLabel, customColor = Colors.pink_03, size = TagSize.Medium)
    }
}
```

### `header` → `LaunchedEffect` + `navigation.setOptions`

In Compose, header configuration goes into `navigation.setOptions()` inside `LaunchedEffect(Unit)`.

| Spec `header.props` | setOptions param | Transform |
|----------------------|-----------------|-----------|
| `useBack` | `hiddenBack` | **Invert**: `useBack: true` → `hiddenBack = false` |
| `headerType` | `headerType` | `HeaderType.Default()` / `HeaderType.Extended()` / `HeaderType.None` |
| `headerTitle` (string) | `headerTitle` | `HeaderTitle.Default("Title")` |
| `headerTitle` (user) | `headerTitle` | Custom composable in header |
| `headerRight` | `headerRight` | `HeaderRight.Toolkit(...)` |

```kotlin
val navigation = LocalNavigation.current

LaunchedEffect(Unit) {
    navigation.setOptions(
        headerTitle = HeaderTitle.Default("Transfer"),
        headerType = HeaderType.Extended(),
        hiddenBack = false,
        headerRight = HeaderRight.Toolkit(),
    )
}
```

### `body` → Screen Content

| Spec field | Compose |
|------------|---------|
| `scrollable: true` | `ScrollData(scrollable = true)` in `setOptions` |
| `style.backgroundColor` | `backgroundColor` in `setOptions` or `Modifier.background()` |
| `children` | Composable calls in `Column`/`LazyColumn` |

```kotlin
Column(
    modifier = Modifier
        .fillMaxSize()
        .background(Colors.black_02),
) {
    SecurityBanner(description = securityText, ...)
    TransferCard(amount = transferAmount, ...)
}
```

For scrollable content with header collapse:

```kotlin
val listState = rememberLazyListState()

LaunchedEffect(Unit) {
    navigation.setOptions(
        scrollData = ScrollData(scrollState = listState),
    )
}

LazyColumn(state = listState) {
    item { SecurityBanner(...) }
    item { TransferCard(...) }
}
```

### `footer` → `footerComponent` in `setOptions`

Navigation footer already provides built-in spacing and shadow. **Skip `footer.style` properties like `padding`, `margin`, and `backgroundColor`** — they are redundant.

```kotlin
LaunchedEffect(Unit) {
    navigation.setOptions(
        footerComponent = {
            Button(
                title = buttonTitle,
                type = ButtonType.DISABLED,
                size = Size.LARGE,
                isFull = true,
                onClick = { handleTransfer() },
            )
        },
    )
}
```

- `footer.style` → **Skip** padding/margin/backgroundColor (footer handles these)
- Single child → pass directly; multiple children → wrap in `Column`/`Row` without spacing styles

### `tabs` → `{ScreenName}Tab` Composable

When `tabs` is an object (not `null`), generate a separate `{ScreenName}Tab.kt` file with a `BottomTab` composable.

- `tabs.indexActive` determines which item renders the screen from this spec
- When `tabs.floatingButton` is not empty (`{}`), map it to the `floatingButton` parameter

```kotlin
import vn.momo.kits.navigation.bottomtab.BottomTab
import vn.momo.kits.navigation.bottomtab.BottomTabItem
import vn.momo.kits.navigation.bottomtab.BottomTabFloatingButton

@Composable
fun MoneyTransferTab() {
    BottomTab(
        items = listOf(
            BottomTabItem(
                name = "MoneyTransfer",
                label = "Chuyển tiền",
                icon = "ic_transfer",
                screen = { MoneyTransferScreen() },
            ),
            BottomTabItem(
                name = "Profile",
                label = "Tôi",
                icon = "ic_profile",
                screen = { ProfileScreen() },
            ),
        ),
        // tabs.floatingButton → floatingButton prop
        floatingButton = BottomTabFloatingButton(
            icon = "ic_scan",
            label = "Quét mọi QR",
            onPress = { /* navigate to ScanScreen */ },
        ),
    )
}
```

### `overlays` → Composable Functions

Each overlay entry generates a `@Composable` function. Place them before the screen composable.

**Modal overlay (`type: "Modal"`):**

```kotlin
// overlays.ConfirmModal — content.type = PopupNotify
@Composable
fun ConfirmModal(
    itemId: Int,
    itemName: String,
    onRequestClose: (((() -> Unit)?) -> Unit)? = null,
) {
    PopupNotify(
        title = "Xác nhận xoá?",
        description = "Bạn có chắc muốn xoá $itemName?",
        primary = ButtonData(title = "Xoá") { onRequestClose?.invoke(null) },
        secondary = ButtonData(title = "Huỷ") { onRequestClose?.invoke(null) },
        onRequestClose = onRequestClose,
    )
}
```

**BottomSheet overlay (`type: "BottomSheet"`):**

```kotlin
// overlays.FilterSheet — body.children only; footer goes to footerComponent in the navigator call
@Composable
fun FilterSheet(
    selectedOptions: List<String>,
    onApply: () -> Unit,
    onRequestClose: (((() -> Unit)?) -> Unit)? = null,
) {
    var selectedA by remember { mutableStateOf(false) }
    var selectedB by remember { mutableStateOf(false) }
    Column {
        Chip(label = "Option A", selected = selectedA, onPress = { selectedA = !selectedA })
        Chip(label = "Option B", selected = selectedB, onPress = { selectedB = !selectedB })
    }
}
```

### `actions` → Lambda / Remember Handlers

Three shapes map to different Kotlin patterns.

**Simple action (`code`):**

```kotlin
val handleChangeAmount: (String) -> Unit = { value ->
    transferAmount = value
}
```

**Navigation action (`navigate` + `params`):**

```kotlin
val handlePressGreetingCard = {
    navigator.push { GreetingCardPickerScreen() }
}
```

**Overlay action (`overlay` + `params`) — modal:**

```kotlin
// overlays.ConfirmModal: type=Modal, barrierDismissible=true
val handlePressConfirm = {
    navigator.showModal(
        content = { ConfirmModal(itemId = currentItemId, itemName = currentItemName) },
        barrierDismissible = true,
    )
}
```

**Overlay action (`overlay` + `params`) — bottom sheet:**

```kotlin
// overlays.FilterSheet: type=BottomSheet, options={title:'Lọc'}, surface=true
val handlePressFilter = {
    navigator.showBottomSheet(
        content = { FilterSheet(selectedOptions = selectedOptions, onApply = handleApplyFilter) },
        title = "Lọc",             // from overlays.FilterSheet.options.title
        isSurface = true,          // from overlays.FilterSheet.surface
        barrierDismissible = true, // from overlays.FilterSheet.barrierDismissible
        footerComponent = {        // from overlays.FilterSheet.footer.children
            Button(title = "Áp dụng", size = Size.LARGE, isFull = true, onClick = handleApplyFilter)
        },
    )
}
```

### `localization` → Default State

Use `vi` locale values as initial state with `remember` + `mutableStateOf`.

```kotlin
var transferAmount by remember { mutableStateOf("0") }
val recipientName = "Anh Dũng Hồng"
val quickMessageList = listOf("Mình chuyển tiền nhé 🤑", "Em cảm ơn ạ! 🤟")
```

### `tracking` → Comments

```kotlin
val handleTransfer = {
    // tracking: TransferButtonPressed { amount, message, recipientPhone }
    initiateTransfer(amount, message, recipient)
}
```

### Token Resolution

| Spec token | Compose code |
|------------|-------------|
| `"Colors.pink_03"` | `Colors.pink_03` |
| `"Spacing.L"` | `Spacing.L` (already Dp — do NOT call `.dp`) |
| `"Radius.M"` | `Radius.M` |

Import from `vn.momo.kits.const`.

### Variable Resolution

| Spec value | Compose code |
|------------|-------------|
| `"{amount}"` | `amount` (parameter or state) |
| `"{onPress}"` | `onPress()` (lambda invocation) |
| `"{items[0]}"` | `items[0]` (list access) |

### Typography Mapping

Spec typography tokens map to Compose `Typography` object properties using camelCase:

| Spec token | Compose |
|------------|---------|
| `"body_default_regular"` | `Typography.bodyDefaultRegular` |
| `"header_s_semibold"` | `Typography.headerSSemibold` |
| `"description_default_regular"` | `Typography.descriptionDefaultRegular` |

---

## Quick Reference: RN vs Compose Side-by-Side

| Concept | React Native | Compose |
|---------|-------------|---------|
| Screen wrapper | `<Screen ref={screenRef}>` | `Column` / `LazyColumn` + `setOptions` |
| Header config | `screenRef.current?.setOptions()` in `useEffect` | `navigation.setOptions()` in `LaunchedEffect` |
| Footer | `<Screen footerComponent={fn}>` | `footerComponent` in `setOptions` |
| Styles | `StyleSheet.create({})` | `Modifier` chain |
| State | `useState` | `mutableStateOf` + `remember` |
| Handlers | `useCallback` | Lambda or local function |
| Row layout | `<View style={{ flexDirection: 'row' }}>` | `Row { }` |
| Flex grow | `style={{ flex: 1 }}` | `Modifier.weight(1f)` |
| Gap | `style={{ gap: Spacing.S }}` | `Arrangement.spacedBy(Spacing.S)` |
| Token import | `@momo-kits/foundation` | `vn.momo.kits.const` |
| Component import | `@momo-kits/foundation` or `@momo-kits/<lib>` | `vn.momo.kits.components` |
| Navigation | `navigation` prop | `LocalNavigation.current` |
| Navigator | `ApplicationContext.navigator` | `LocalNavigator.current` |
