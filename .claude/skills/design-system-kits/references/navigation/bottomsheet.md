# Bottom Sheet

## React Native — showBottomSheet

Bottom sheets are displayed via `navigator.showBottomSheet()` from `ApplicationContext`.

```tsx
const { navigator } = useContext(ApplicationContext);

navigator.showBottomSheet({
  screen: SheetContent,
  options: { title: 'Sheet Title' },
  surface: true,
  draggable: true,
  barrierDismissible: false,
  onDismiss: (type) => console.log('dismissed by', type),
});
```

Dismiss from inside:

```tsx
navigator.pop();
// or from content component via injected prop:
props.onRequestClose?.(() => {
  // callback after dismiss animation
});
```

### BottomSheetParams

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `screen` | `React.ComponentType` | required | Content component rendered inside the sheet |
| `options.title` | `string` | — | Title shown in the header |
| `options.header` | `ReactNode` | — | Custom header node (replaces title) |
| `surface` | `boolean` | — | Use `background.surface` color instead of `background.default` |
| `onDismiss` | `(type?: string) => void` | — | Callback on dismiss; `type` is `'touch'`, `'gesture'`, or `'icon_close'` |
| `barrierDismissible` | `boolean` | `false` | Allow backdrop tap to dismiss |
| `draggable` | `boolean` | `true` | Enable drag-to-dismiss gesture |
| `useBottomInset` | `boolean` | `true` | Add safe area bottom inset padding |
| `useKeyboardAvoidingView` | `boolean` | `true` | Wrap content in KeyboardAvoidingView |
| `keyboardVerticalOffset` | `number` | auto | Override keyboard avoiding offset |
| `useDivider` | `boolean` | `true` | Show bottom border under the header |
| `footerComponent` | `ReactNode` | — | Sticky footer below content |
| `useNativeModal` | `boolean` | `false` | Use native RN Modal (auto-enabled in widget mode) |
| `leftOptions.iconLeft` | `string` | `'ic_back'` | Left header button icon |
| `leftOptions.onPressIconLeft` | `() => void` | — | Left header button handler (adds a back button) |

Additional params are spread as props to the content `screen` component.

### Left Options (Back Navigation in Sheet)

For stacked bottom sheets with back navigation:

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

### Footer Component

```tsx
navigator.showBottomSheet({
  screen: SheetContent,
  options: { title: 'Selection' },
  footerComponent: <Button title="Confirm" onPress={handleConfirm} />,
});
```

---

## Compose

```kotlin
navigator.showBottomSheet(
    content = { SheetContent() },
    isSurface = false,
    barrierDismissible = true,
    onDismiss = { },
)
```

Dismiss from inside:

```kotlin
navigator.pop()
```
