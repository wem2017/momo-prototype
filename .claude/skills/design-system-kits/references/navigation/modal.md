# Modal

## React Native — showModal

Modal overlays are displayed via `navigator.showModal()` from `ApplicationContext`.

```tsx
const { navigator } = useContext(ApplicationContext);

navigator.showModal(
  {
    screen: MyModalContent,
    barrierDismissible: true,
    onDismiss: () => console.log('dismissed'),
  },
  (error) => console.log(error), // optional onError callback
);
```

Dismiss from inside:

```tsx
navigator.pop();
// or from content component via injected prop:
props.onRequestClose?.(() => {
  // callback after dismiss animation
});
```

### ModalParams

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `screen` | `React.ComponentType` | required | Content component to render inside the modal |
| `barrierDismissible` | `boolean` | — | Allow backdrop tap to dismiss |
| `onDismiss` | `() => void` | — | Callback when modal is dismissed |
| `modalStyle` | `ViewStyle` | — | Custom style for the modal container |
| `useNativeModal` | `boolean` | `false` | Use native RN Modal (auto-enabled in widget mode) |

Additional params are spread as props to the content `screen` component.

### PopupNotify in Modal

Show a confirmation dialog by passing `PopupNotify` as the modal content:

```tsx
navigator.showModal({
  screen: ({ onRequestClose }) => (
    <PopupNotify
      title="Confirm?"
      description="Are you sure you want to proceed?"
      primary={{ title: 'OK', onPress: () => onRequestClose?.() }}
      secondary={{ title: 'Cancel', onPress: () => onRequestClose?.() }}
      onRequestClose={onRequestClose}
    />
  ),
  barrierDismissible: true,
});
```

### PopupNotify Props

| Prop | Type | Description |
|------|------|-------------|
| `title` | `string` | Title text (required) |
| `primary` | `{ title, onPress }` | Primary action button (required) |
| `description` | `string \| ReactNode` | Description text |
| `image` | `string` | Image URL/path |
| `error` | `string` | Error message text |
| `secondary` | `{ title, onPress }` | Secondary action button |
| `buttonDirection` | `'row' \| 'column' \| 'auto'` | Button layout (`'auto'` switches based on title length > 12 chars) |
| `onIconClose` | `() => void` | Close icon press handler |
| `onRequestClose` | `(callback?) => void` | Dismiss modal — accepts optional callback that runs after dismiss animation |
| `id` | `string` | Tracking component ID |

### PopupPromotion

Full-screen promotional modal with an image.

```tsx
navigator.showModal({
  screen: ({ onRequestClose }) => (
    <PopupPromotion
      image="https://promo-image.png"
      onActionClick={() => handlePromo()}
      onIconClose={() => onRequestClose?.()}
      onRequestClose={onRequestClose}
    />
  ),
});
```

| Prop | Type | Description |
|------|------|-------------|
| `image` | `string` | Promotion image (required) |
| `onActionClick` | `() => void` | Action click handler |
| `onIconClose` | `() => void` | Close icon handler |
| `onRequestClose` | `(callback?) => void` | Dismiss modal |
| `id` | `string` | Tracking component ID |

---

## Compose — Modal Overlay

```kotlin
navigator.showModal(
    content = { ModalContent() },
    barrierDismissible = true,
    onDismiss = { },
)
```

Dismiss from inside:

```kotlin
navigator.pop()
```

## Compose — Present (Full-screen Modal)

```kotlin
navigator.present(content = { FullScreenModal() })
```

Use `present` for full-screen modals, `showModal` for overlay dialogs.
